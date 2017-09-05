package com.dgg.store.dao.sys;

import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.pojo.PushMessage;
import com.dgg.store.util.pojo.PushMessageExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PushMessageDaoImpl implements PushMessageDao
{
    @Autowired
    private PushMessageMapper mapper;

    @Override
    public long countByExample(PushMessageExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(PushMessageExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(PushMessage record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(PushMessage record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<PushMessage> selectByExample(PushMessageExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public PushMessage selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(PushMessage record, PushMessageExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(PushMessage record, PushMessageExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(PushMessage record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(PushMessage record)
    {
        return mapper.updateByPrimaryKey(record);
    }

}
