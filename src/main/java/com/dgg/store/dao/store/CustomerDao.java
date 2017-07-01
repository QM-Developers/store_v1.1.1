package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.MyTeam;
import com.dgg.store.util.vo.CustomerGroupVO;
import com.dgg.store.util.vo.CustomerVO;

import java.util.List;

public interface CustomerDao
{
    Integer insertStoreUser(CustomerVO customerVO);

    Integer insertCustomerGroup(CustomerVO customerVO);

    List<CustomerVO> findCustomerByGroup(String customerGroupId, String userId);

    CustomerVO findCustomerInfo(String customerId);

    List<MyTeam> findCooperation(String userId);

    List<CustomerVO> findPartner(Integer integer);

    Integer insertCooperation(MyTeam myTeam);

    Integer updateCustomer(CustomerVO customerVO);

    Integer insertCustomerHistory(String customerId);

    List<CustomerGroupVO> findCustomerGroup();

    int insertCustomerRecord(CustomerVO customerVO);

    Integer insertCustomer(CustomerVO customerVO);

    Integer updateCustomerRecord(CustomerVO customerVO);

    Integer updateCustomerUser(CustomerVO customerVO);

    int findCustomerUpdateCount(String customerId);
}
