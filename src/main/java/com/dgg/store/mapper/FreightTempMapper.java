package com.dgg.store.mapper;

import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.pojo.FreightTempExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FreightTempMapper {
    long countByExample(FreightTempExample example);

    int deleteByExample(FreightTempExample example);

    int deleteByPrimaryKey(String freightId);

    int insert(FreightTemp record);

    int insertSelective(FreightTemp record);

    List<FreightTemp> selectByExample(FreightTempExample example);

    FreightTemp selectByPrimaryKey(String freightId);

    int updateByExampleSelective(@Param("record") FreightTemp record, @Param("example") FreightTempExample example);

    int updateByExample(@Param("record") FreightTemp record, @Param("example") FreightTempExample example);

    int updateByPrimaryKeySelective(FreightTemp record);

    int updateByPrimaryKey(FreightTemp record);
}