package com.dgg.store.dao.store;

import com.dgg.store.mapper.CustomerMapper;
import com.dgg.store.util.pojo.MyTeam;
import com.dgg.store.util.vo.CustomerGroupVO;
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
    public Integer insertStoreUser(CustomerVO customerVO)
    {
        return mapper.insertStoreUser(customerVO);
    }

    @Override
    public Integer insertCustomerGroup(CustomerVO customerVO)
    {
        return mapper.insertCustomerGroup(customerVO);
    }

    @Override
    public List<CustomerVO> findCustomerByGroup(String customerGroupId, String userId)
    {
        return mapper.findCustomerByGroup(customerGroupId,userId);
    }

    @Override
    public CustomerVO findCustomerInfo(String customerId)
    {
        return mapper.findCustomerInfo(customerId);
    }

    @Override
    public List<MyTeam> findCooperation(String userId)
    {
        return mapper.findCooperation(userId);
    }

    @Override
    public List<CustomerVO> findPartner(Integer integer)
    {
        return mapper.findPartner(integer);
    }

    @Override
    public Integer insertCooperation(MyTeam myTeam)
    {
        return mapper.insertCooperation(myTeam);
    }

    @Override
    public Integer updateCustomer(CustomerVO customerVO)
    {
        return mapper.updateCustomer(customerVO);
    }

    @Override
    public Integer insertCustomerHistory(String customerId)
    {
        return mapper.insertCustomerHistory(customerId);
    }

    @Override
    public List<CustomerGroupVO> findCustomerGroup()
    {
        return mapper.findCustomerGroup();
    }

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
    public Integer updateCustomerRecord(CustomerVO customerVO)
    {
        return mapper.updateCustomerRecord(customerVO);
    }

    @Override
    public Integer updateCustomerUser(CustomerVO customerVO)
    {
        return mapper.updateCustomerUser(customerVO);
    }

    @Override
    public int findCustomerUpdateCount(String customerId)
    {
        return mapper.findCustomerUpdateCount(customerId);
    }

}
