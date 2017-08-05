package com.dgg.store.dao.store;

import com.dgg.store.mapper.FreightTempMapper;
import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.pojo.FreightTempExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FreightTempDaoImpl implements FreightTempDao
{
    @Autowired
    private FreightTempMapper mapper;

    @Override
    public long countByExample(FreightTempExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(FreightTempExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String freightId)
    {
        return mapper.deleteByPrimaryKey(freightId);
    }

    @Override
    public int insert(FreightTemp record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(FreightTemp record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<FreightTemp> selectByExample(FreightTempExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public FreightTemp selectByPrimaryKey(String freightId)
    {
        return mapper.selectByPrimaryKey(freightId);
    }

    @Override
    public int updateByExampleSelective(FreightTemp record, FreightTempExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(FreightTemp record, FreightTempExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(FreightTemp record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(FreightTemp record)
    {
        return mapper.updateByPrimaryKey(record);
    }
}
