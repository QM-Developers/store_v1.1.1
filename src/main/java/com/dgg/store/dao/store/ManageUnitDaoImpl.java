package com.dgg.store.dao.store;

import com.dgg.store.mapper.ManageUnitMapper;
import com.dgg.store.util.pojo.ManageUnit;
import com.dgg.store.util.pojo.ManageUnitExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ManageUnitDaoImpl implements ManageUnitDao
{
    @Autowired
    private ManageUnitMapper mapper;

    @Override
    public long countByExample(ManageUnitExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(ManageUnitExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(ManageUnit record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(ManageUnit record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<ManageUnit> selectByExample(ManageUnitExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public ManageUnit selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(ManageUnit record, ManageUnitExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(ManageUnit record, ManageUnitExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(ManageUnit record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(ManageUnit record)
    {
        return mapper.updateByPrimaryKey(record);
    }
}
