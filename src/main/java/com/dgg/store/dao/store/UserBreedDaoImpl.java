package com.dgg.store.dao.store;

import com.dgg.store.mapper.UserBreedMapper;
import com.dgg.store.util.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserBreedDaoImpl implements UserBreedDao
{
    @Autowired
    private UserBreedMapper mapper;

    @Override
    public long countByExample(UserBreedExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(UserBreedExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(UserBreed record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(UserBreed record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<UserBreed> selectByExample(UserBreedExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public UserBreed selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(UserBreed record, UserBreedExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(UserBreed record, UserBreedExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(UserBreed record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(UserBreed record)
    {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SysBreedType> listBreedType(String selectId)
    {
        return mapper.listBreedType(selectId);
    }

    @Override
    public List<SysBreedTypeSelect> listBreedSelect(String typeId)
    {
        return mapper.listBreedSelect(typeId);
    }

    @Override
    public List<SysBreedTypeInfo> listBreedInfo(String selectId)
    {
        return mapper.listBreedInfo(selectId);
    }
}
