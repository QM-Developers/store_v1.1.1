package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.pojo.FreightTempExample;

import java.util.List;

public interface FreightTempDao
{
    long countByExample(FreightTempExample example);

    int deleteByExample(FreightTempExample example);

    int deleteByPrimaryKey(String freightId);

    int insert(FreightTemp record);

    int insertSelective(FreightTemp record);

    List<FreightTemp> selectByExample(FreightTempExample example);

    FreightTemp selectByPrimaryKey(String freightId);

    int updateByExampleSelective(FreightTemp record, FreightTempExample example);

    int updateByExample(FreightTemp record, FreightTempExample example);

    int updateByPrimaryKeySelective(FreightTemp record);

    int updateByPrimaryKey(FreightTemp record);
}
