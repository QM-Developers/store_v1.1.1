package com.dgg.store.mapper;

import com.dgg.store.util.vo.CustomerVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerMapper
{
    int insertCustomerRecord(CustomerVO customerVO);

    Integer insertCustomer(CustomerVO customerVO);

    List<CustomerVO> listCustomer(@Param("customer") CustomerVO condition, @Param("start") int start, @Param("end") int end);

    Integer updateCustomer(CustomerVO customerVO);

    Integer updateCustomerUserRecord(CustomerVO customerVO);

    Integer updateCustomerUser(CustomerVO customerVO);

    int countCustomer(CustomerVO customerVO);
}