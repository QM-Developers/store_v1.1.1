package com.dgg.store.service.store;

import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface FollowerOrderService
{
    String updateRefundReceive(SessionVO sessionVO, MyOrder myOrder);

    String updateRefundPass(SessionVO sessionVO, MyOrder myOrder);

    String updateSalesmanPass(SessionVO sessionVO, MyOrder myOrder);

    String updateDelivered(SessionVO sessionVO, MyOrder myOrder);

    String listFollowerOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO);

    String listSalesOrderByKeyword(SessionVO sessionVO, String keyword, PageVO pageVO);

    String getSalesOrder(SessionVO sessionVO, MyOrder myOrder);
}
