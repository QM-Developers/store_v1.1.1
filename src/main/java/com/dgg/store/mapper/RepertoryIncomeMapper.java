package com.dgg.store.mapper;

import com.dgg.store.util.pojo.RepertoryIncome;
import com.dgg.store.util.pojo.RepertoryIncomeExample;
import com.dgg.store.util.pojo.RepertoryIncomeList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RepertoryIncomeMapper {
    long countByExample(RepertoryIncomeExample example);

    int deleteByExample(RepertoryIncomeExample example);

    int deleteByPrimaryKey(String recordId);

    int insert(RepertoryIncome record);

    int insertSelective(RepertoryIncome record);

    List<RepertoryIncome> selectByExample(RepertoryIncomeExample example);

    RepertoryIncome selectByPrimaryKey(String recordId);

    int updateByExampleSelective(@Param("record") RepertoryIncome record, @Param("example") RepertoryIncomeExample example);

    int updateByExample(@Param("record") RepertoryIncome record, @Param("example") RepertoryIncomeExample example);

    int updateByPrimaryKeySelective(RepertoryIncome record);

    int updateByPrimaryKey(RepertoryIncome record);

    int updateGoodsCount(@Param("goods") RepertoryIncomeList incomeList,@Param("branchId") String branchId);

    int countBranchGoodsExists(@Param("branchId") String branchId,@Param("standardId") String standardId);

    int saveBranchGoods(@Param("goods") RepertoryIncomeList incomeList,@Param("branchId") String branchId);

    String getGoodsImage(String goodsId);

    String getGoodsCode(String goodsId);
}