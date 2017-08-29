package com.dgg.store.service.store;

import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface SalesOrderService
{
    String updateRefundReceive(SessionVO sessionVO, MyOrder myOrder);

    String updateRefundPass(SessionVO sessionVO, MyOrder myOrder);

    String updateRefundMoney(SessionVO sessionVO, MyOrder myOrder);

    String updateFinancePassB(SessionVO sessionVO, MyOrder myOrder);

    String updateFinanceFailB(SessionVO sessionVO, MyOrder myOrder);

    String updateFinancePassA(SessionVO sessionVO, MyOrder myOrder);

    String updateFinanceFailA(SessionVO sessionVO, MyOrder myOrder);

    String updateSalesmanPass(SessionVO sessionVO, MyOrder myOrder);

    String updateDelivered(SessionVO sessionVO, MyOrder myOrder);

    String listSalesOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO);

    String listFinanceOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO);
}
