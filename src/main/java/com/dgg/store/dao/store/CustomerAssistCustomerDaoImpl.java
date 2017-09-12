package com.dgg.store.dao.store;

import com.dgg.store.mapper.CustomerAssistCustomerMapper;
import com.dgg.store.util.pojo.CustomerAssistCustomer;
import com.dgg.store.util.pojo.CustomerAssistCustomerExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerAssistCustomerDaoImpl implements CustomerAssistCustomerDao
{
    @Autowired
    private CustomerAssistCustomerMapper mapper;

    @Override
    public long countByExample(CustomerAssistCustomerExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(CustomerAssistCustomerExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int insert(CustomerAssistCustomer record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(CustomerAssistCustomer record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<CustomerAssistCustomer> selectByExample(CustomerAssistCustomerExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public int updateByExampleSelective(CustomerAssistCustomer record, CustomerAssistCustomerExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(CustomerAssistCustomer record, CustomerAssistCustomerExample example)
    {
        return mapper.updateByExample(record, example);
    }

}
