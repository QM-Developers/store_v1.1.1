package com.dgg.store.mapper;

import com.dgg.store.util.pojo.CustomerAssistCustomer;
import com.dgg.store.util.pojo.CustomerAssistCustomerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CustomerAssistCustomerMapper {
    long countByExample(CustomerAssistCustomerExample example);

    int deleteByExample(CustomerAssistCustomerExample example);

    int insert(CustomerAssistCustomer record);

    int insertSelective(CustomerAssistCustomer record);

    List<CustomerAssistCustomer> selectByExample(CustomerAssistCustomerExample example);

    int updateByExampleSelective(@Param("record") CustomerAssistCustomer record, @Param("example") CustomerAssistCustomerExample example);

    int updateByExample(@Param("record") CustomerAssistCustomer record, @Param("example") CustomerAssistCustomerExample example);
}