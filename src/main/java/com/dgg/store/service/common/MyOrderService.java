package com.dgg.store.service.common;

import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface MyOrderService
{
    String insertMyOrder(SessionVO sessionVO, MyOrder myOrder);

    String listMyOrder(SessionVO sessionVO, PageVO pageVO);

    String getMyOrder(SessionVO sessionVO, MyOrder myOrder);

    String updateSign(SessionVO sessionVO, MyOrder myOrder);

    String updateRefund(SessionVO sessionVO, MyOrder myOrder);

    String updateRefundCancel(SessionVO sessionVO, MyOrder myOrder);

//    String updateRefundGoods(SessionVO sessionVO, MyOrder myOrder);

    String listMyOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO);

    String listFreightTemp(SessionVO sessionVO, PageVO pageVO);

    String listMyOrderByOrderNumber(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO);
}
