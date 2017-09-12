package com.dgg.store.dao.store;

import com.dgg.store.mapper.CustomerAssistUserMapper;
import com.dgg.store.util.pojo.CustomerAssistUser;
import com.dgg.store.util.pojo.CustomerAssistUserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerAssistUserDaoImpl implements CustomerAssistUserDao
{
    @Autowired
    private CustomerAssistUserMapper mapper;

    @Override
    public long countByExample(CustomerAssistUserExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(CustomerAssistUserExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int insert(CustomerAssistUser record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(CustomerAssistUser record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<CustomerAssistUser> selectByExample(CustomerAssistUserExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public int updateByExampleSelective(CustomerAssistUser record, CustomerAssistUserExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(CustomerAssistUser record, CustomerAssistUserExample example)
    {
        return mapper.updateByExample(record, example);
    }

}
