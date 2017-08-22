package com.dgg.store.dao.store;

import com.dgg.store.mapper.CustomerMapper;
import com.dgg.store.util.vo.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDaoImpl implements CustomerDao
{
    @Autowired
    private CustomerMapper mapper;

    @Override
    public int insertCustomerRecord(CustomerVO customerVO)
    {
        return mapper.insertCustomerRecord(customerVO);
    }

    @Override
    public Integer insertCustomer(CustomerVO customerVO)
    {
        return mapper.insertCustomer(customerVO);
    }

    @Override
    public List<CustomerVO> listCustomer(CustomerVO condition, int start, int end)
    {
        return mapper.listCustomer(condition,start,end);
    }

    @Override
    public Integer updateCustomer(CustomerVO customerVO)
    {
        return mapper.updateCustomer(customerVO);
    }

    @Override
    public Integer updateCustomerUser(CustomerVO customerVO)
    {
        return mapper.updateCustomerUser(customerVO);
    }

    @Override
    public Integer updateCustomerUserRecord(CustomerVO customerVO)
    {
        return mapper.updateCustomerUserRecord(customerVO);
    }

    @Override
    public int countCustomer(CustomerVO customerVO)
    {
        return mapper.countCustomer(customerVO);
    }

    @Override
    public CustomerVO getCustomer(CustomerVO customerVO)
    {
        return mapper.getCustomer(customerVO);
    }

    @Override
    public int insertFrontImage(String fileName, String customerId)
    {
        return mapper.insertFrontImage(fileName,customerId);
    }

    @Override
    public int insertBackImage(String fileName, String customerId)
    {
        return mapper.insertBackImage(fileName,customerId);
    }

    @Override
    public int insertHandImage(String fileName, String customerId)
    {
        return mapper.insertHandImage(fileName,customerId);
    }

}
