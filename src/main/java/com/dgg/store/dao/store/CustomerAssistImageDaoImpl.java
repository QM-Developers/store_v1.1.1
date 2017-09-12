package com.dgg.store.dao.store;

import com.dgg.store.mapper.CustomerAssistImageMapper;
import com.dgg.store.util.pojo.CustomerAssistImage;
import com.dgg.store.util.pojo.CustomerAssistImageExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerAssistImageDaoImpl implements CustomerAssistImageDao
{
    @Autowired
    private CustomerAssistImageMapper mapper;

    @Override
    public long countByExample(CustomerAssistImageExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(CustomerAssistImageExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(CustomerAssistImage record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(CustomerAssistImage record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<CustomerAssistImage> selectByExample(CustomerAssistImageExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public CustomerAssistImage selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(CustomerAssistImage record, CustomerAssistImageExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(CustomerAssistImage record, CustomerAssistImageExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(CustomerAssistImage record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(CustomerAssistImage record)
    {
        return mapper.updateByPrimaryKey(record);
    }

}
