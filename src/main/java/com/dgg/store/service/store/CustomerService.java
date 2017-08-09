package com.dgg.store.service.store;

import com.dgg.store.util.vo.CustomerVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface CustomerService
{
    String insertCustomerRecord(CustomerVO customerVO, SessionVO sessionVO);

    String listCustomer(SessionVO sessionVO, PageVO pageVO, CustomerVO customerVO);

    String updateCustomer(SessionVO sessionVO, CustomerVO customerVO);
}
