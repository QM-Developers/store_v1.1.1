package com.dgg.store.dao.store;

import com.dgg.store.mapper.RepertoryRecordMapper;
import com.dgg.store.util.pojo.RepertoryRecord;
import com.dgg.store.util.pojo.RepertoryRecordExample;
import com.dgg.store.util.pojo.RepertoryRecordList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RepertoryRecordDaoImpl implements RepertoryRecordDao
{
    @Autowired
    private RepertoryRecordMapper mapper;

    @Override
    public long countByExample(RepertoryRecordExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(RepertoryRecordExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(RepertoryRecord record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(RepertoryRecord record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<RepertoryRecord> selectByExample(RepertoryRecordExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public RepertoryRecord selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(RepertoryRecord record, RepertoryRecordExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(RepertoryRecord record, RepertoryRecordExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(RepertoryRecord record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(RepertoryRecord record)
    {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public String getUserNameById(String userId)
    {
        return mapper.getUserNameById(userId);
    }

    @Override
    public int insertRecordList(List<RepertoryRecordList> recordList, String recordId)
    {
        return mapper.insertRecordList(recordList,recordId);
    }

    @Override
    public int updateGoodsCount(RepertoryRecordList repertoryRecordList)
    {
        return mapper.updateGoodsCount(repertoryRecordList);
    }

    @Override
    public int getRepertory(String standardId)
    {
        return mapper.getRepertory(standardId);
    }

    @Override
    public int getSecondRepertory(String standardId)
    {
        return mapper.getSecondRepertory(standardId);
    }

    @Override
    public int updateGoodsSecondCount(RepertoryRecordList repertoryRecordList)
    {
        return mapper.updateGoodsSecondCount(repertoryRecordList);
    }

    @Override
    public List<RepertoryRecordList> getRepertoryRecordList(String recordId)
    {
        return mapper.getRepertoryRecordList(recordId);
    }


}
