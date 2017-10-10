package com.dgg.store.mapper;

import com.dgg.store.util.pojo.RepertoryRecord;
import com.dgg.store.util.pojo.RepertoryRecordExample;

import java.util.List;

import com.dgg.store.util.pojo.RepertoryRecordList;
import org.apache.ibatis.annotations.Param;

public interface RepertoryRecordMapper
{
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

    int updateGoodsCount(RepertoryRecordList repertoryRecordList);

    int getRepertory(@Param("standardId") String standardId);

    int getSecondRepertory(@Param("standardId") String standardId);

    int updateGoodsSecondCount(RepertoryRecordList repertoryRecordList);

    List<RepertoryRecordList> getRepertoryRecordList(@Param("recordId") String recordId);

    int getGoodsCount(@Param("branchId") String branchId, @Param("standardId") String standardId);

    int updateGoodsCount(@Param("branchId") String branchId, @Param("standardId") String standardId, @Param("count") int count);

    int insertRecordList(RepertoryRecordList recordList);

    int branchGoodsExists(@Param("branchId") String branchId,@Param("standardId") String standardId);

    int insertBranchGoods(@Param("goods") RepertoryRecordList list,@Param("branchId") String branchId);

    String getUserName(String userId);
}