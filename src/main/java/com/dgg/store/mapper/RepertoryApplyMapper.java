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

    List<RepertoryApply> listRepertoryChecker(@Param("myTeamId") String myTeamId, @Param("permissionId") String permissionId);

    int countFirstBranchGoods(@Param("standardId") String standardId,@Param("branchType") byte branchFirst);

    int updateSubFirstBranchGoodsCount(@Param("goods") RepertoryApplyList list, @Param("myTeamId") String myTeamId, @Param("branchType") byte branchFirst);

    int countBranchGoodsExists(@Param("standardId") String standardId, @Param("branchId") String branchId);

    int saveBranchGoods(@Param("goods") RepertoryApplyList list, @Param("branchId") String branchId);

    int updateAddGoodsCount(@Param("goods") RepertoryApplyList list, @Param("branchId") String branchId);

    String getGoodsImage(String goodsId);

    String getGoodsCode(String goodsId);

    int getStandardCount(@Param("standardId") String standardId,@Param("myTeamId") String myTeamId,@Param("branchType") byte branchFirst);

    String getGoodsType(String goodsId);
}