package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.RepertoryRecord;
import com.dgg.store.util.pojo.RepertoryRecordExample;
import com.dgg.store.util.pojo.RepertoryRecordList;

import java.util.List;

public interface RepertoryRecordDao
{
    long countByExample(RepertoryRecordExample example);

    int deleteByExample(RepertoryRecordExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(RepertoryRecord record);

    int insertSelective(RepertoryRecord record);

    List<RepertoryRecord> selectByExample(RepertoryRecordExample example);

    RepertoryRecord selectByPrimaryKey(String breedId);

    int updateByExampleSelective( RepertoryRecord record,  RepertoryRecordExample example);

    int updateByExample( RepertoryRecord record,  RepertoryRecordExample example);

    int updateByPrimaryKeySelective(RepertoryRecord record);

    int updateByPrimaryKey(RepertoryRecord record);

//    String getUserNameById(String userId);

    int getRepertory(String standardId);

//    int getSecondRepertory(String standardId);

//    List<RepertoryRecordList> getRepertoryRecordList(String recordId);

    int getGoodsCount(String branchId, String standardId);

    int updateGoodsCount(String branchId, String standardId, int count);

    int insertRecordList(RepertoryRecordList recordList);

    int branchGoodsExists(String branchId, String standardId);

    int insertBranchGoods(RepertoryRecordList list, String branchId);

    String getUserName(String userId);
}
