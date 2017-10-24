package com.dgg.store.service.store;

import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface FinanceOrderService
{
    String listFinanceOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO);

    String updateFinancePassA(SessionVO sessionVO, MyOrder myOrder);

    String updateFinanceFailA(SessionVO sessionVO, MyOrder myOrder);

    String updateFinancePassB(SessionVO sessionVO, MyOrder myOrder);

    String updateFinanceFailB(SessionVO sessionVO, MyOrder myOrder);

    String updateRefundMoney(SessionVO sessionVO, MyOrder myOrder);

    String updateFinancePass(SessionVO sessionVO, MyOrder myOrder);

    String updateFinanceFail(SessionVO sessionVO, MyOrder myOrder);
}
