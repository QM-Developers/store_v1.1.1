package com.dgg.store.dao.store;

import com.dgg.store.mapper.FarmerMapper;
import com.dgg.store.util.pojo.Farmer;
import com.dgg.store.util.pojo.FarmerExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FarmerDaoImpl implements FarmerDao
{
    @Autowired
    private FarmerMapper mapper;

    @Override
    public long countByExample(FarmerExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(FarmerExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(Farmer record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(Farmer record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<Farmer> selectByExample(FarmerExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public Farmer selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(Farmer record, FarmerExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(Farmer record, FarmerExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(Farmer record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Farmer record)
    {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public Integer deleteBreed(Farmer farmer)
    {
        return mapper.deleteBreed(farmer);
    }

    @Override
    public Integer deletePlace(Farmer farmer)
    {
        return mapper.deletePlace(farmer);
    }
}
