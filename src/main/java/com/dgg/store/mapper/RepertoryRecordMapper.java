package com.dgg.store.mapper;

import com.dgg.store.util.pojo.RepertoryRecord;
import com.dgg.store.util.pojo.RepertoryRecordExample;
import java.util.List;
import com.dgg.store.util.pojo.RepertoryRecordList;
import org.apache.ibatis.annotations.Param;

public interface RepertoryRecordMapper {
    long countByExample(RepertoryRecordExample example);

    int deleteByExample(RepertoryRecordExample example);

    int deleteByPrimaryKey(String recordId);

    int insert(RepertoryRecord record);

    int insertSelective(RepertoryRecord record);

    List<RepertoryRecord> selectByExample(RepertoryRecordExample example);

    RepertoryRecord selectByPrimaryKey(String recordId);

    int updateByExampleSelective(@Param("record") RepertoryRecord record, @Param("example") RepertoryRecordExample example);

    int updateByExample(@Param("record") RepertoryRecord record, @Param("example") RepertoryRecordExample example);

    int updateByPrimaryKeySelective(RepertoryRecord record);

    int updateByPrimaryKey(RepertoryRecord record);

    String getUserNameById(@Param("userId") String userId);

    int insertRecordList(@Param("list") List<RepertoryRecordList> recordList, @Param("recordId") String recordId);

    int updateGoodsCount(RepertoryRecordList repertoryRecordList);

    int getRepertory(@Param("standardId") String standardId);

    int getSecondRepertory(@Param("standardId") String standardId);

    int updateGoodsSecondCount(RepertoryRecordList repertoryRecordList);

    List<RepertoryRecordList> getRepertoryRecordList(@Param("recordId") String recordId);
}