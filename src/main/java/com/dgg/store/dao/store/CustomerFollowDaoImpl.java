package com.dgg.store.dao.store;

import com.dgg.store.mapper.CustomerFollowMapper;
import com.dgg.store.util.pojo.CustomerFollow;
import com.dgg.store.util.pojo.CustomerFollowExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerFollowDaoImpl implements CustomerFollowDao
{
    @Autowired
    private CustomerFollowMapper mapper;


    @Override
    public long countByExample(CustomerFollowExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(CustomerFollowExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(CustomerFollow record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(CustomerFollow record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<CustomerFollow> selectByExample(CustomerFollowExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public CustomerFollow selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(CustomerFollow record, CustomerFollowExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(CustomerFollow record, CustomerFollowExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(CustomerFollow record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(CustomerFollow record)
    {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public String getUserName(String userId)
    {
        return mapper.getUserName(userId);
    }

}
