package com.dgg.store.service.common;

import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface MyOrderService
{
    String insertMyOrder(SessionVO sessionVO, MyOrder myOrder);

    String listMyOrder(SessionVO sessionVO, PageVO pageVO);

    String getMyOrder(SessionVO sessionVO, MyOrder myOrder);

    String updateFinancePassA(SessionVO sessionVO, MyOrder myOrder);

    String updateFinanceFailA(SessionVO sessionVO, MyOrder myOrder);

    String updateSalesmanPass(SessionVO sessionVO, MyOrder myOrder);

    String updateDelivered(SessionVO sessionVO, MyOrder myOrder);

    String updateSign(SessionVO sessionVO, MyOrder myOrder);

    String updateFinancePassB(SessionVO sessionVO, MyOrder myOrder);

    String updateFinanceFailB(SessionVO sessionVO, MyOrder myOrder);

    String updateRefund(SessionVO sessionVO, MyOrder myOrder);

    String updateRefundCancel(SessionVO sessionVO, MyOrder myOrder);

    String updateRefundPass(SessionVO sessionVO, MyOrder myOrder);

    String updateRefundGoods(SessionVO sessionVO, MyOrder myOrder);

    String updateRefundReceive(SessionVO sessionVO, MyOrder myOrder);

    String updateRefundMoney(SessionVO sessionVO, MyOrder myOrder);

    String listMyOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO);
}
