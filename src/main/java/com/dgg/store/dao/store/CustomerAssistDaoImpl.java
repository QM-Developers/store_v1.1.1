package com.dgg.store.dao.store;

import com.dgg.store.mapper.CustomerAssistMapper;
import com.dgg.store.util.pojo.CustomerAssist;
import com.dgg.store.util.pojo.CustomerAssistExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerAssistDaoImpl implements CustomerAssistDao
{
    @Autowired
    private CustomerAssistMapper mapper;

    @Override
    public long countByExample(CustomerAssistExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(CustomerAssistExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(CustomerAssist record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(CustomerAssist record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<CustomerAssist> selectByExample(CustomerAssistExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public CustomerAssist selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(CustomerAssist record, CustomerAssistExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(CustomerAssist record, CustomerAssistExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(CustomerAssist record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(CustomerAssist record)
    {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public String getUserName(String userId)
    {
        return mapper.getUserName(userId);
    }

    @Override
    public List<CustomerAssist> listCustomerAssistByHelper(String userId, Integer status, int pageNum, int pageSize)
    {
        return mapper.listCustomerAssistByHelper(userId, status, pageNum, pageSize);
    }

    @Override
    public int countCustomerAssistByHelper(String userId, Integer status)
    {
        return mapper.countCustomerAssistByHelper(userId, status);
    }

    @Override
    public String getUserImage(String userId)
    {
        return mapper.getUserImage(userId);
    }

}
