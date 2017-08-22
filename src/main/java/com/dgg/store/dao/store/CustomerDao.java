package com.dgg.store.dao.store;

import com.dgg.store.util.vo.CustomerVO;

import java.util.List;

public interface CustomerDao
{
    int insertCustomerRecord(CustomerVO customerVO);

    Integer insertCustomer(CustomerVO customerVO);

    List<CustomerVO> listCustomer(CustomerVO condition, int start, int end);

    Integer updateCustomer(CustomerVO customerVO);

    Integer updateCustomerUser(CustomerVO customerVO);

    Integer updateCustomerUserRecord(CustomerVO customerVO);

    int countCustomer(CustomerVO customerVO);

    CustomerVO getCustomer(CustomerVO customerVO);

    int insertFrontImage(String fileName, String customerId);

    int insertBackImage(String fileName, String customerId);

    int insertHandImage(String fileName, String customerId);
}
