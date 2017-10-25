package com.dgg.store.service.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.mapper.MyOrderMapper;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.OrderUtil;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
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
    private MyOrderMapper orderMapper;

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

        if (!isCustomer(sessionVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        //  判断商品是否下架
        if (!hadGoods(goods))
            return JSONObject.toJSONString(new ResultVO(OrderConstant.GOODS_NOT_FIND, sessionVO.getToken()));

        // 判断库存是否足够
        if (!hadEnoughRepertory(sessionVO, goods))
            return JSONObject.toJSONString(new ResultVO(OrderConstant.REPERTORY_NOT_ENOUGH, sessionVO.getToken()));

        // 生成订单号
        int index = 0;
        String orderNumber = String.format("%08d", new Random(index).nextInt(100000000));
        while (orderMapper.countOrderNumber(orderNumber, sessionVO.getMyTeamId()) > 0)
            orderNumber = String.format("%08d", new Random(++index).nextInt(100000000));

        // 设置订单参数
        myOrder.setUserId(sessionVO.getUserId());
        myOrder.setShoppingAddress(ParameterUtil.getDefault(myOrder.getShoppingAddress(), Constant.EMPTY));
        myOrder.setOrderNumber(orderNumber);
        myOrder.setOrderId(IDGenerator.generator());
        myOrder.setOrderStatus(myOrder.getPaymentType() != OrderConstant.PAYMENT_TRANSFER ? OrderConstant.WAITING_SALESMAN_CHECK : OrderConstant.WAITING_FINANCE_CHECK_A);
        myOrder.setCreateDate(new Date());
        myOrder.setBuyerMessage(myOrder.getSellerMessage() == null ? Constant.EMPTY : myOrder.getSellerMessage());
        myOrder.setSellerMessage(Constant.EMPTY);
        myOrder.setPaymentStatus(OrderConstant.NOT_PAY);
        myOrder.setLogisticsStatus(Constant.EMPTY);
        myOrder.setMemberId(sessionVO.getMyTeamId());

        int result = orderMapper.insert(myOrder);
        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        for (int i = 0; i < goods.size(); i++)
        {
            json = (JSONObject) goods.get(i);
            imageList = orderMapper.listImage(json.get(KeyConstant.GOODS_ID).toString());
            standardId = json.get(KeyConstant.STANDARD_ID).toString();

            for (String s : imageList)
                image.append(s).append(SymbolConstant.VERTICAL);

            orderList = orderMapper.getOrderList(standardId);
            orderList.setStandardId(standardId);
            orderList.setOrderId(myOrder.getOrderId());
            orderList.setGoodsImage(image.toString());
            orderList.setBuyNum(Integer.parseInt(json.get(KeyConstant.GOODS_NUM).toString()));
            orderList.setRefundNum(Constant.ZERO);
            result = orderMapper.insertOrderList(orderList);

            if (result < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);
        }

        switch (myOrder.getPaymentType())
        {
            case OrderConstant.PAYMENT_TRANSFER:
                UMengUtil.sendUnicast(orderMapper.getFinanceDeviceToken(sessionVO.getMyTeamId(), QMPermissionConstant.FINANCE_CHECK), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_FINANCE_NEW));
                break;
            case OrderConstant.PAYMENT_MONTHLY:
                UMengUtil.sendUnicast(orderMapper.getSalesDeviceToken(sessionVO.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_SALES_NEW));
                break;
            case OrderConstant.PAYMENT_DESTINATION:
                UMengUtil.sendUnicast(orderMapper.getSalesDeviceToken(sessionVO.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.ORDER_SALES_NEW));
                break;
        }

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), myOrder.getOrderId()));
    }

    private boolean isCustomer(SessionVO sessionVO)
    {
        return orderMapper.getUserRole(sessionVO.getUserId()).equals(RoleConstant.USER);
    }

    private boolean hadGoods(JSONArray goods)
    {
        JSONObject json;
        for (Object good : goods)
        {
            json = JSONObject.parseObject(good.toString());
            if (orderMapper.countGoodsStandard(json.getString(KeyConstant.STANDARD_ID)) < 1)
                return false;
        }
        return true;
    }

    private boolean hadEnoughRepertory(SessionVO sessionVO, JSONArray goods)
    {
        String customerType = orderMapper.getCustomerType(sessionVO.getUserId(), sessionVO.getMyTeamId());
        int repositoryLevel = orderMapper.getCustomerRepertory(customerType, sessionVO.getMyTeamId());
        int repertory;
        String branchId;
        if (repositoryLevel == CustomerConstant.REPERTORY_LEVEL1)
            branchId = orderMapper.getFirstBranchId(sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST);
        else
            branchId = orderMapper.getCurrentBranchIdByCustomer(sessionVO.getUserId());

        JSONObject json;

        for (int i = 0; i < goods.size(); i++)
        {
            json = (JSONObject) goods.get(i);
            repertory = orderMapper.getBranchRepertory(branchId, json.getString(KeyConstant.STANDARD_ID));
            if (json.getInteger(KeyConstant.GOODS_NUM) == null && repertory < json.getInteger(KeyConstant.GOODS_NUM))
                return false;
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
        int pageCount = PagingUtil.getCount((int) orderMapper.countByExample(example), pageVO.getPageSize());

        List<MyOrder> result = orderMapper.selectByExample(example);
        result = getOrderList(result);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getMyOrder(SessionVO sessionVO, MyOrder myOrder)
    {
        MyOrderExample example = new MyOrderExample();
        MyOrderExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(sessionVO.getUserId());
        criteria.andOrderIdEqualTo(myOrder.getOrderId());

        List<MyOrder> orderList = orderMapper.selectByExample(example);
        if (orderList == null || orderList.size() < 1)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        myOrder = orderList.get(0);
        List<MyOrderListVO> orderListVO;

        orderListVO = orderMapper.listOrderList(myOrder.getOrderId());
        for (MyOrderListVO listVO : orderListVO)
            listVO.setGoodsImage(orderMapper.getImage(listVO.getGoodsImage().split(SymbolConstant.REG_VERTICAL)[0]));
        myOrder.setOrderList(orderListVO);
        myOrder = OrderUtil.getOrderCount(myOrder);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), myOrder));
    }

    @Override
    public String updateSign(SessionVO sessionVO, MyOrder myOrder)
    {
        MyOrderExample example = new MyOrderExample();
        List<MyOrder> orderList = orderMapper.selectByExample(example);

        if (orderList == null || orderList.size() < 1)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        myOrder = orderList.get(0);

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
            record.setOrderStatus(OrderConstant.WAITING_FINANCE_CHECK_B);

        int result = orderMapper.updateByPrimaryKeySelective(record);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateRefund(SessionVO sessionVO, MyOrder myOrder)
    {
        MyOrderExample example = new MyOrderExample();
        MyOrderExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(sessionVO.getUserId());
        criteria.andOrderIdEqualTo(myOrder.getOrderId());

        List<MyOrder> orderLists = orderMapper.selectByExample(example);
        if (orderLists == null || orderLists.size() < 1)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int result = 1;
        int count = 3;
        int index = 0;

        JSONArray jArray = JSONArray.parseArray(myOrder.getGoods());
        String message = myOrder.getRefundMessage();
        myOrder = orderLists.get(0);
        JSONObject json = null;

        if (!canRefund(myOrder.getOrderStatus()))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        while (result > 0)
        {
            switch (index)
            {
                case 0: // 退货数量判断
                    String standardId;
                    int refundNum;
                    List<MyOrderListVO> orderList = orderMapper.listOrderList(myOrder.getOrderId());
                    for (Object aJArray : jArray)
                    {
                        json = (JSONObject) aJArray;
                        refundNum = json.getInteger(KeyConstant.GOODS_NUM);
                        standardId = json.getString(KeyConstant.STANDARD_ID);
                        for (MyOrderListVO vo : orderList)
                            if (vo.getStandardId().equals(standardId))
                                if (vo.getBuyNum() < refundNum)
                                    return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
                    }
                    break;
                case 1: // 更新订单状态
                    MyOrder record = new MyOrder();

                    record.setOrderId(myOrder.getOrderId());
                    record.setOrderStatus(OrderConstant.REFUND_WAITING);
                    record.setOrderStatusBefore(myOrder.getOrderStatus());
                    record.setRefundMessage(message);

                    result = orderMapper.updateByPrimaryKeySelective(record);
                    break;
                case 2: // 更新订单商品列表
                    MyOrderListVO myOrderList = new MyOrderListVO();

                    myOrderList.setOrderId(myOrder.getOrderId());
                    for (Object aJArray : jArray)
                    {
                        json = (JSONObject) aJArray;
                        myOrderList.setStandardId(json.getString(KeyConstant.STANDARD_ID));
                        myOrderList.setRefundNum(json.getInteger(KeyConstant.GOODS_NUM));
                        if (result < 1)
                            break;
                        result = orderMapper.updateListByPrimaryKeySelective(myOrderList);
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

        UMengUtil.sendUnicast(orderMapper.getSalesDeviceToken(sessionVO.getUserId(), sessionVO.getMyTeamId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.REFUSE_SALES_NEW));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    private boolean canRefund(Byte orderStatus)
    {
        List<Byte> statusList = new ArrayList<>();
        statusList.add(OrderConstant.ORDER_CLOSE);
        statusList.add(OrderConstant.REFUND_WAITING);
        statusList.add(OrderConstant.REFUND_GOODS);
        statusList.add(OrderConstant.REFUND_RECEIVE);

        for (Byte s : statusList)
            if (s.equals(orderStatus))
                return false;

        return true;
    }

    @Override
    public String updateRefundCancel(SessionVO sessionVO, MyOrder myOrder)
    {
        MyOrderExample example = new MyOrderExample();
        MyOrderExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(sessionVO.getUserId());
        criteria.andOrderIdEqualTo(myOrder.getOrderId());

        List<MyOrder> orderLists = orderMapper.selectByExample(example);
        if (orderLists == null || orderLists.size() < 1)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        myOrder = orderLists.get(0);

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.REFUND_WAITING);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(myOrder.getOrderStatusBefore());
        int result = orderMapper.updateByPrimaryKeySelective(record);

        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

//    @Override
//    public String updateRefundGoods(SessionVO sessionVO, MyOrder myOrder)
//    {
//        myOrder = orderMapper.selectByPrimaryKey(myOrder.getOrderId());
//
//        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.REFUND_PASS);
//
//        if (!flag)
//            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
//
//        MyOrder record = new MyOrder();
//        record.setOrderId(myOrder.getOrderId());
//        record.setOrderStatus(OrderConstant.REFUND_GOODS);
//        int result = orderMapper.updateByPrimaryKeySelective(record);
//
//        if (result < 1)
//            throw new RuntimeException(Constant.STR_ADD_FAILED);
//
//        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
//    }

    @Override
    public String listMyOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO)
    {
        MyOrderExample example = new MyOrderExample();
        MyOrderExample.Criteria criteria = example.createCriteria();

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());

        criteria.andUserIdEqualTo(sessionVO.getUserId());
        if (myOrder.getOrderStatus() != null)
            criteria = getStatusCriteria(criteria, myOrder.getOrderStatus());
        if (myOrder.getCreateDate() != null && myOrder.getFinishDate() != null)
            criteria.andCreateDateBetween(myOrder.getCreateDate(), myOrder.getFinishDate());
        if (myOrder.getPaymentType() != null)
            criteria.andPaymentTypeEqualTo(myOrder.getPaymentType());
        if (myOrder.getPaymentStatus() != null)
            criteria.andPaymentStatusEqualTo(myOrder.getPaymentStatus());

        int pageCount = PagingUtil.getCount((int) orderMapper.countByExample(example), pageVO.getPageSize());
        List<MyOrder> result = orderMapper.selectByExample(example);
        result = getOrderList(result);
        result = OrderUtil.getOrderCount(result);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    private MyOrderExample.Criteria getStatusCriteria(MyOrderExample.Criteria criteria, Byte orderStatus)
    {
        List<Byte> status = new ArrayList<>();

        switch (orderStatus)
        {
            case OrderConstant.STATUS_CHECKING:
                status.add(OrderConstant.WAITING_SALESMAN_CHECK);
                break;
            case OrderConstant.STATUS_SEND:
                status.add(OrderConstant.WAITING_DELIVER);
                break;
            case OrderConstant.STATUS_RECEIVE:
                status.add(OrderConstant.ALREADY_DELIVERED);
                break;
            case OrderConstant.STATUS_PAY:
                status.add(OrderConstant.FINANCE_CHECK_FAIL_A);
                status.add(OrderConstant.FINANCE_CHECK_FAIL_B);
                status.add(OrderConstant.WAITING_FINANCE_CHECK_A);
                status.add(OrderConstant.WAITING_FINANCE_CHECK_B);
                break;
            default:
                criteria.andOrderStatusEqualTo(orderStatus);
                break;
        }

        if (status.size() > 0)
            criteria.andOrderStatusIn(status);

        return criteria;
    }

    @Override
    public String listFreightTemp(SessionVO sessionVO, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        List<FreightTemp> result = orderMapper.listFreightTemp(sessionVO.getMyTeamId(), pageNum, pageSize);

        String customerType = orderMapper.getCustomerType(sessionVO.getUserId(), sessionVO.getMyTeamId());
        int repertoryType = orderMapper.getCustomerRepertory(customerType, sessionVO.getMyTeamId());

        String branchId;
        if (repertoryType == CustomerConstant.REPERTORY_LEVEL1)
            branchId = orderMapper.getFirstBranchId(sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST);
        else
            branchId = orderMapper.getCurrentBranchIdByCustomer(sessionVO.getUserId());

        String latLng = orderMapper.getBranchLatLng(branchId);

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

        List<MyOrder> result = orderMapper.selectByExample(example);
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
            orderList = orderMapper.listOrderList(order.getOrderId());
            for (MyOrderListVO orderListVO : orderList)
                orderListVO.setGoodsImage(orderMapper.getImage(orderListVO.getGoodsImage().split(SymbolConstant.REG_VERTICAL)[0]));
            order.setOrderList(orderList);
        }

        return data;
    }

}
