package com.dgg.store.service.store;

import com.dgg.store.util.pojo.MyOrder;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface SalesOrderService
{
    String listOrderSelective(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO);

    String listSales(SessionVO sessionVO);

    String listOrderSelectiveByManager(SessionVO sessionVO, MyOrder myOrder, PageVO pageVO);
}
