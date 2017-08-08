package com.dgg.store.service.store;

import com.dgg.store.util.vo.CustomerVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface CustomerService
{
    ResultVO findCustomerByGroup(SessionVO sessionVO, CustomerVO customerVO);

    ResultVO findCustomerInfo(SessionVO sessionVO,CustomerVO customerVO);

    ResultVO updateCustomer(SessionVO sessionVO, CustomerVO customerVO);

    ResultVO findCustomerGroup(SessionVO sessionVO);

    String insertCustomerRecord(CustomerVO customerVO, SessionVO sessionVO);

    ResultVO findCustomerUpdateCount(SessionVO sessionVO,CustomerVO customerVO);
}
