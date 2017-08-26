package com.dgg.store.mapper;

import com.dgg.store.util.pojo.RepertoryApply;
import com.dgg.store.util.pojo.RepertoryApplyExample;
import com.dgg.store.util.pojo.RepertoryApplyList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RepertoryApplyMapper
{
    long countByExample(RepertoryApplyExample example);

    int deleteByExample(RepertoryApplyExample example);

    int deleteByPrimaryKey(String applyId);

    int insert(RepertoryApply record);

    int insertSelective(RepertoryApply record);

    List<RepertoryApply> selectByExample(RepertoryApplyExample example);

    RepertoryApply selectByPrimaryKey(String applyId);

    int updateByExampleSelective(@Param("record") RepertoryApply record, @Param("example") RepertoryApplyExample example);

    int updateByExample(@Param("record") RepertoryApply record, @Param("example") RepertoryApplyExample example);

    int updateByPrimaryKeySelective(RepertoryApply record);

    int updateByPrimaryKey(RepertoryApply record);

    List<RepertoryApply> listRepertoryChecker(@Param("permissionId") String permissionId, @Param("myTeamId") String myTeamId);

    int insertApplyList(@Param("list") List<RepertoryApplyList> applyList, @Param("applyId") String applyId);

    List<RepertoryApplyList> listApplyList(@Param("applyId") String applyId);

    int getRepertory(@Param("standardId") String standardId);

    int updateGoodsCount(@Param("standardId") String standardId, @Param("count") int count);

    int getSecondRepertory(@Param("branchId") String branchId, @Param("standardId") String standardId);

    int deleteSecondStandard(@Param("branchId") String branchId, @Param("standardId") String standardId);

    int insertSecondRepertory(@Param("list") List<RepertoryApplyList> applyList, @Param("branchId") String branchId);
}