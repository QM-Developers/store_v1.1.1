package com.dgg.store.service.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.MyOrderDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.OrderConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.pojo.MyOrderExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.order.MyOrderListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class MyOrderServiceImpl implements MyOrderService
{
    @Autowired
    private MyOrderDao dao;

    @Override
    public String insertMyOrder(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder.setUserId(sessionVO.getUserId());
        myOrder.setOrderId(IDGenerator.generator());
        myOrder.setOrderStatus(OrderConstant.WAITING_CHECK);
        myOrder.setCreateDate(new Date());
        myOrder.setBuyerMessage(myOrder.getSellerMessage() == null ? "" : myOrder.getSellerMessage());
        myOrder.setSellerMessage(Constant.EMPTY);
        myOrder.setPaymentStatus(OrderConstant.NOT_PAY);
        myOrder.setLogisticsStatus(Constant.EMPTY);

        int result = dao.insert(myOrder);
        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        JSONArray goods = JSON.parseArray(myOrder.getGoods());
        JSONObject json = null;
        List<String> imageList = null;
        StringBuilder image = new StringBuilder();
        MyOrderListVO orderList = new MyOrderListVO();
        for (int i = 0; i < goods.size(); i++)
        {
            json = (JSONObject) goods.get(i);
            imageList = dao.listImage(json.get(KeyConstant.GOODS_ID).toString());

            for (String s : imageList)
                image.append(s).append(SymbolConstant.VERTICAL);

            orderList = dao.getOrderList(json.get(KeyConstant.STANDARD_ID).toString());
            orderList.setOrderId(myOrder.getOrderId());
            orderList.setGoodsImage(image.toString());
            orderList.setBuyNum(Integer.parseInt(json.get(KeyConstant.GOODS_NUM).toString()));
            result = dao.insertOrderList(orderList);

            if (result < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);
        }

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), myOrder.getOrderId()));
    }

    @Override
    public String listMyOrder(SessionVO sessionVO, PageVO pageVO)
    {
        MyOrderExample example = new MyOrderExample();
        MyOrderExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(sessionVO.getUserId());

        example.setStart(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setEnd(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        List<MyOrder> result = dao.selectByExample(example);
        List<MyOrderListVO> orderList = null;
        for (MyOrder order : result)
        {
            orderList = dao.listOrderList(order.getOrderId());
            for (MyOrderListVO orderListVO : orderList)
                orderListVO.setGoodsImage(dao.getImage(orderListVO.getGoodsImage().split(SymbolConstant.REG_VERTICAL)[0]));
            order.setOrderList(orderList);
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getMyOrder(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());
        List<MyOrderListVO> orderList = null;

        orderList = dao.listOrderList(myOrder.getOrderId());
        for (MyOrderListVO orderListVO : orderList)
            orderListVO.setGoodsImage(dao.getImage(orderListVO.getGoodsImage().split(SymbolConstant.REG_VERTICAL)[0]));
        myOrder.setOrderList(orderList);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), myOrder));
    }

    @Override
    public String updateFinancePassA(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_CHECK);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_A);
        flag &= myOrder.getPaymentStatus().equals(OrderConstant.NOT_PAY);
        flag &= myOrder.getPaymentType().equals(OrderConstant.PAYMENT_TRANSFER);
        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setPaymentStatus(OrderConstant.ALREADY_PAY);
        record.setOrderStatus(OrderConstant.WAITING_SALESMAN_CHECK);

        int result = dao.updateByPrimaryKeySelective(record);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateFinanceFailA(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_CHECK);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.FINANCE_CHECK_FAIL_A);
        flag &= myOrder.getPaymentStatus().equals(OrderConstant.NOT_PAY);
        flag &= myOrder.getPaymentType().equals(OrderConstant.PAYMENT_TRANSFER);
        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.FINANCE_CHECK_FAIL_A);

        int result = dao.updateByPrimaryKeySelective(record);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateSalesmanPass(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_CHECK);
        flag |= myOrder.getOrderStatus().equals(OrderConstant.WAITING_SALESMAN_CHECK);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.WAITING_DELIVER);

        int result = dao.updateByPrimaryKeySelective(record);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateDelivered(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        boolean flag = myOrder.getOrderStatus().equals(OrderConstant.WAITING_DELIVER);

        if (!flag)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.ALREADY_DELIVERED);

        int result = dao.updateByPrimaryKeySelective(record);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
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
        record.setOrderStatus(myOrder.getPaymentStatus().equals(OrderConstant.ALREADY_PAY) ? OrderConstant.ORDER_SUCCESS : OrderConstant.ALREADY_SIGN);

        int result = dao.updateByPrimaryKeySelective(record);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }

    @Override
    public String updateRefund(SessionVO sessionVO, MyOrder myOrder)
    {
        myOrder = dao.selectByPrimaryKey(myOrder.getOrderId());

        MyOrder record = new MyOrder();
        record.setOrderId(myOrder.getOrderId());
        record.setOrderStatus(OrderConstant.WAITING_REFUND);
        record.setOrderStatusBefore(myOrder.getOrderStatus());

        int result = dao.updateByPrimaryKeySelective(record);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }


}
