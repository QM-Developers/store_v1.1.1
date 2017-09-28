package com.dgg.store.util.core;

import com.dgg.store.dao.common.MyOrderDao;
import com.dgg.store.mapper.MyMapper;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.order.MyOrderListVO;

import java.util.List;

public class OrderUtil
{
    public static List<MyOrder> getOrderList(List<MyOrder> data, MyOrderDao dao)
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
}
