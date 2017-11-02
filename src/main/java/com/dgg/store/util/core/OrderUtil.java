package com.dgg.store.util.core;

import com.dgg.store.mapper.MyOrderMapper;
import com.dgg.store.util.core.constant.OrderConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.order.MyOrderListVO;

import java.util.ArrayList;
import java.util.List;

public class OrderUtil
{
    public static List<MyOrder> getOrderList(List<MyOrder> data, MyOrderMapper dao)
    {
        List<MyOrderListVO> orderList = null;
        for (int i = 0; i < data.size(); i++)
        {
            orderList = dao.listOrderList(data.get(i).getOrderId());
            for (MyOrderListVO orderListVO : orderList)
                orderListVO.setGoodsImage(dao.getImage(orderListVO.getGoodsImage().split(SymbolConstant.REG_VERTICAL)[0]));
            data.get(i).setOrderList(orderList);
        }

        return data;
    }

    public static List<MyOrder> getOrderCount(List<MyOrder> myOrder)
    {
        for (MyOrder order: myOrder)
            for (MyOrderListVO list : order.getOrderList())
                order.setOrderCount(list.getBuyNum() * list.getGoodsPrice());

        return myOrder;
    }

    public static MyOrder getOrderCount(MyOrder myOrder)
    {
        for (MyOrderListVO list : myOrder.getOrderList())
            myOrder.setOrderCount(list.getBuyNum() * list.getGoodsPrice());
        return myOrder;
    }

    public static List<Byte> getOrderStatus(Byte orderStatus)
    {
        List<Byte> statusList = new ArrayList<>();

        if (orderStatus == null)
            return statusList;

        switch (orderStatus)
        {
            case OrderConstant.WAITING_FINANCE_CHECK_A:
                statusList.add(OrderConstant.WAITING_FINANCE_CHECK_A);
                statusList.add(OrderConstant.WAITING_FINANCE_CHECK_B);
                break;
            default:
                statusList.add(orderStatus);
                break;
        }

        return statusList;
    }
}
