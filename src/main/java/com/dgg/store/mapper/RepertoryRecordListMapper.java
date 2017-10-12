package com.dgg.store.mapper;

import com.dgg.store.util.pojo.RepertoryRecordList;
import com.dgg.store.util.pojo.RepertoryRecordListExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RepertoryRecordListMapper {
    long countByExample(RepertoryRecordListExample example);

    int deleteByExample(RepertoryRecordListExample example);

    int insert(RepertoryRecordList record);

    int insertSelective(RepertoryRecordList record);

    List<RepertoryRecordList> selectByExample(RepertoryRecordListExample example);

    int updateByExampleSelective(@Param("record") RepertoryRecordList record, @Param("example") RepertoryRecordListExample example);

    int updateByExample(@Param("record") RepertoryRecordList record, @Param("example") RepertoryRecordListExample example);

    String getGoodsImage(String goodsId);
}