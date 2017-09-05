package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.RepertoryApply;
import com.dgg.store.util.pojo.RepertoryApplyExample;
import com.dgg.store.util.pojo.RepertoryApplyList;

import java.util.List;

public interface RepertoryApplyDao
{
    long countByExample(RepertoryApplyExample example);

    int deleteByExample(RepertoryApplyExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(RepertoryApply record);

    int insertSelective(RepertoryApply record);

    List<RepertoryApply> selectByExample(RepertoryApplyExample example);

    RepertoryApply selectByPrimaryKey(String breedId);

    int updateByExampleSelective( RepertoryApply record,  RepertoryApplyExample example);

    int updateByExample( RepertoryApply record,  RepertoryApplyExample example);

    int updateByPrimaryKeySelective(RepertoryApply record);

    int updateByPrimaryKey(RepertoryApply record);

    List<RepertoryApply> listRepertoryChecker(String repertoryCheck, String myTeamId);

    int insertApplyList(List<RepertoryApplyList> applyList, String applyId);

    List<RepertoryApplyList> listApplyList(String applyId);

    int getRepertory(String standardId);

    int updateGoodsCount(String standardId, int i);

    int getSecondRepertory(String branchId, String standardId);

    int deleteSecondStandard(String branchId, String standardId);

    int insertSecondRepertory(List<RepertoryApplyList> applyList, String branchId);

    String getDeviceToken(String approverId);
}
