package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.CustomerAssistCustomer;
import com.dgg.store.util.pojo.CustomerAssistCustomerExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerAssistCustomerDao
{
    long countByExample(CustomerAssistCustomerExample example);

    int deleteByExample(CustomerAssistCustomerExample example);

    int insert(CustomerAssistCustomer record);

    int insertSelective(CustomerAssistCustomer record);

    List<CustomerAssistCustomer> selectByExample(CustomerAssistCustomerExample example);

    int updateByExampleSelective(@Param("record") CustomerAssistCustomer record, @Param("example") CustomerAssistCustomerExample example);

    int updateByExample(@Param("record") CustomerAssistCustomer record, @Param("example") CustomerAssistCustomerExample example);

}
