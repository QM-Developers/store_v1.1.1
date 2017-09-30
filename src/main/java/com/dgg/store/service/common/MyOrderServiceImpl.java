package com.dgg.store.service.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.MyOrderDao;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.OrderUtil;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.umeng.push.PushMessageFactory;
import com.dgg.store.util.core.umeng.push.UMengUtil;
import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.pojo.MyOrderExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.order.MyOrderListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MyOrderServiceImpl implements MyOrderService
{
    @Autowired
    private MyOrderDao dao;

    @Autowired
    private PushMessageMapper mapper;

    @Override
    public String insertMyOrder(SessionVO sessionVO, MyOrder myOrder)
    {
        List<String> imageList;
        StringBuilder image = new StringBuilder();
        MyOrderListVO orderList;
        String standardId;
        JSONArray goods = JSON.parseArray(myOrder.getGoods());
        JSONObject json;

//        if (!hadEnoughRepertory(sessionVO, goods))
//            return JSONObject.toJSONString(new ResultVO(OrderConstant.REPERTORY_NOT_ENOUGH, sessionVO.getToken()));

        // 生成订单号
        int index = 0;
        String orderNumber = String.format("%08d", new Random(index).nextInt(100000000));
        while(dao.countOrderNumber(orderNumber,sessionVO.getMyTeamId()) > 0)
            orderNumber = String.format("%08d", new Random(++index).nextInt(100000000));

        // 设置订单参数
        myOrder.setUserId(sessionVO.getUserId());
        myOrder.setOrderNumber(orderNumber);
        myOrder.setOrderId(IDGenerator.generator());
        myOrder.setOrderStatus(OrderConstant.WAITING_CHECK);
        myOrder.setCreateDate(new Date());
        myOrder.setBuyerMessage(myOrder.getSellerMessage() == null ? Constant.EMPTY : myOrder.getSellerMessage());
        myOrder.setSellerMessage(Constant.EMPTY);
        myOrder.setPaymentStatus(OrderConstant.NOT_PAY);
        myOrder.setLogisticsStatus(Constant.EMPTY);
        myOrder.setMemberId(sessionVO.getMyTeamId());

        int result = dao.insert(myOrder);
        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        for (int i = 0; i < goods.size(); i++)
        {
            json = (JSONObject) goods.get(i);
            imageList = dao.listImage(json.get(KeyConstant.GOODS_ID).toString());
            standardId = json.get(KeyConstant.STANDARD_ID).toString();

            for (String s : imageList)
                image.append(s).append(SymbolConstant.VERTICAL);

            orderList = dao.getOrderList(standardId);
            orderList.setStandardId(standardId);
            orderList.setOrderId(myOrder.getOrderId());
            orderList.setGoodsImage(image.toString());
            orderList.setBuyNum(Integer.parseInt(json.get(KeyConstant.GOODS_NUM).toString()));
            orderList.setRefundNum(Constant.ZERO);
            result = dao.insertOrderList(orderList);

            if (result < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);
        }

        switch (myOrder.getPaymentType())
        {
            case OrderConstant.PAYMENT_TRANSFER:
                UMengUtil.sendUnicast(dao.getFinanceDeviceToken(sessionVO.getMyTeamId(), QMPermissionConstant.FINANCE_CHECK), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_NEW));
                break;
            case OrderConstant.PAYMENT_MONTHLY:
                UMengUtil.sendUnicast(dao.getSalesDeviceToken(sessionVO.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_SALES_NEW));
                break;
            case OrderConstant.PAYMENT_DESTINATION:
                UMengUtil.sendUnicast(dao.getSalesDeviceToken(sessionVO.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_SALES_NEW));
                break;
        }

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), myOrder.getOrderId()));
    }

    private boolean hadEnoughRepertory(SessionVO sessionVO, JSONArray goods)
    {

        String customerType = dao.getCustomerType(sessionVO.getUserId(), sessionVO.getMyTeamId());
        int repositoryLevel = dao.getCustomerRepertory(customerType, sessionVO.getMyTeamId());
        int repertory;
        JSONObject json;

        switch (repositoryLevel)
        {
            case CustomerConstant.REPERTORY_LEVEL1:
                for (int i = 0; i < goods.size(); i++)
                {
                    json = (JSONObject) goods.get(i);
                    repertory = dao.getGoodsRepertoryFirst(json.getString(KeyConstant.STANDARD_ID));
                    if (repertory < json.getInteger(KeyConstant.GOODS_NUM))
                        return false;
                }
                break;
            case CustomerConstant.REPERTORY_LEVEL2:
                for (int i = 0; i < goods.size(); i++)
                {
                    json = (JSONObject) goods.get(i);
                    repertory = dao.getGoodsRepertorySecond(json.getString(KeyConstant.STANDARD_ID), sessionVO.getUserId(), sessionVO.getMyTeamId());
                    if (repertory < json.getInteger(KeyConstant.GOODS_NUM))
                        return false;
                }
                break;
            default:
                break;
        }

        return true;
    }

    @Override
    public String listMyOrder(SessionVO sessionVO, PageVO pageVO)
    {
        MyOrderExample example = new MyOrderExample();
        MyOrderExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(sessionVO.getUserId());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        List<MyOrder> result = dao.selectByExample(example);
        result = getOrderList(result);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getMyOrder(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());
        List<MyOrderListVO> orderList;

        orderList = dao.listOrderList(myOrder.getOrderId());
        for (MyOrderListVO orderListVO : orderList)
            orderListVO.setGoodsImage(dao.getImage(orderListVO.getGoodsImage().split(SymbolConstant.REG_VERTICAL)[0]));
        myOrder.setOrderList(orderList);
        myOrder = OrderUtil.getOrderCount(myOrder);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), myOrder));
    }

    @Override
    public String updateSign(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.ALREADY_DELIVERED);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        if (myOrder.getPaymentStatus().equals(OrderConstant.ALREADY_PAY))
        {
            record.setOrderStatus(OrderConstant.ORDER_SUCCESS);
            record.setFinishDate(new Date());
        } else
            record.setOrderStatus(OrderConstant.ALREADY_SIGN);

        int result = dao.updateByPrimaryKeySelective(record);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateRefund(SessionVO sessionVO, MyOrder myOrder)
    {
        int result = 1;
        int count = 3;
        int index = 0;

        JSONArray jArray = JSONArray.parseArray(myOrder.getGoods());
        String message = myOrder.getRefundMessage();
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());
        JSONObject json = null;

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    String standardId;
                    int refundNum;
                    List<MyOrderListVO> orderList = dao.listOrderList(myOrder.getOrderId());
                    for (int i = 0; i < jArray.size(); i++)
                    {
                        json = (JSONObject) jArray.get(i);
                        refundNum = json.getInteger(KeyConstant.GOODS_NUM);
                        standardId = json.getString(KeyConstant.STANDARD_ID);
                        for (MyOrderListVO vo : orderList)
                            if (vo.getStandardId().equals(standardId))
                                if (vo.getBuyNum() < refundNum)
                                    return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
                    }
                    break;
                case 1:
                    MyOrder record = new MyOrder();

                    record.setOrderId(myOrder.getOrderId());
                    record.setOrderStatus(OrderConstant.REFUND_WAITING);
                    record.setOrderStatusBefore(myOrder.getOrderStatus());
                    record.setRefundMessage(message);

                    result = dao.updateByPrimaryKeySelective(record);
                    break;
                case 2:
                    MyOrderListVO myOrderList = new MyOrderListVO();

                    myOrderList.setOrderId(myOrder.getOrderId());
                    for (int i = 0; i < jArray.size(); i++)
                    {
                        json = (JSONObject) jArray.get(i);
                        myOrderList.setStandardId(json.getString(KeyConstant.STANDARD_ID));
                        myOrderList.setRefundNum(json.getInteger(KeyConstant.GOODS_NUM));
                        if (result < 1)
                            break;
                        result = dao.updateListByPrimaryKeySelective(myOrderList);
                    }
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        UMengUtil.sendUnicast(dao.getSalesDeviceToken(sessionVO.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.REFUSE_SALES_NEW));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateRefundCancel(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.REFUND_WAITING);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(myOrder.getOrderStatusBefore());
        int result = dao.updateByPrimaryKeySelective(record);

        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateRefundGoods(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.REFUND_PASS);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.REFUND_GOODS);
        int result = dao.updateByPrimaryKeySelective(record);

        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String listMyOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        MyOrderExample example = new MyOrderExample();
        MyOrderExample.Criteria criteria = example.createCriteria();

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());

        criteria.andUserIdEqualTo(sessionVO.getUserId());
        if (myOrder.getOrderStatus() != null)
            criteria.andOrderStatusEqualTo(myOrder.getOrderStatus());
        if (myOrder.getCreateDate() != null && myOrder.getFinishDate() != null)
            criteria.andCreateDateBetween(myOrder.getCreateDate(), myOrder.getFinishDate());
        if (myOrder.getPaymentType() != null)
            criteria.andPaymentTypeEqualTo(myOrder.getPaymentType());
        if (myOrder.getPaymentStatus() != null)
            criteria.andPaymentStatusEqualTo(myOrder.getPaymentStatus());

        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());
        List<MyOrder> result = dao.selectByExample(example);
        result = getOrderList(result);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listFreightTemp(SessionVO sessionVO)
    {
        String latLng = null;
        List<FreightTemp> result = dao.listFreightTemp(sessionVO.getMyTeamId());

        String customerType = dao.getCustomerType(sessionVO.getUserId(), sessionVO.getMyTeamId());
        int repertoryType = dao.getCustomerRepertory(customerType, sessionVO.getMyTeamId());

        switch (repertoryType)
        {
            case CustomerConstant.REPERTORY_LEVEL1:
                latLng = dao.getLatLng1(sessionVO.getMyTeamId());
                break;
            case CustomerConstant.REPERTORY_LEVEL2:
                latLng = dao.getLatLng2(sessionVO.getUserId(), sessionVO.getMyTeamId());
                break;
            default:
                break;
        }

        for (FreightTemp temp : result)
            temp.setLatLng(latLng);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listMyOrderByOrderNumber(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        MyOrderExample example = new MyOrderExample();
        MyOrderExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(sessionVO.getUserId());
        criteria.andOrderNumberEqualTo(myOrder.getOrderNumber());

        List<MyOrder> result = dao.selectByExample(example);
        result = getOrderList(result);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));

        return json.toJSONString();
    }

    private List<MyOrder> getOrderList(List<MyOrder> data)
    {
        List<MyOrderListVO> orderList = null;
        for (MyOrder order : data)
        {
            orderList = dao.listOrderList(order.getOrderId());
            for (MyOrderListVO orderListVO : orderList)
                orderListVO.setGoodsImage(dao.getImage(orderListVO.getGoodsImage().split(SymbolConstant.REG_VERTICAL)[0]));
            order.setOrderList(orderList);
        }

        return data;
    }

}
