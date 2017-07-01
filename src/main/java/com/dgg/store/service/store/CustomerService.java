package com.dgg.store.service.store;

import com.dgg.store.util.pojo.MyTeam;
import com.dgg.store.util.vo.CustomerVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface CustomerService
{
    ResultVO findCustomerByGroup(SessionVO sessionVO, CustomerVO customerVO);

    ResultVO findCustomerInfo(SessionVO sessionVO,CustomerVO customerVO);

    ResultVO insertCooperation(SessionVO sessionVO, MyTeam myTeam);

    ResultVO findCooperation(SessionVO sessionVO);

    ResultVO findPartner(SessionVO sessionVO, String cooperId);

    ResultVO insertCustomerToCooper(SessionVO sessionVO, CustomerVO customerVO);

    ResultVO updateCustomer(SessionVO sessionVO, CustomerVO customerVO);

    ResultVO findCustomerGroup(SessionVO sessionVO);

    ResultVO insertCustomerRecord(CustomerVO customerVO, SessionVO sessionVO);

    ResultVO findCustomerUpdateCount(SessionVO sessionVO,CustomerVO customerVO);
}
