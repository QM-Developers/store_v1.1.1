package com.dgg.store.mapper;

import java.util.List;

import com.dgg.store.util.pojo.RepertoryIncomeList;
import com.dgg.store.util.pojo.RepertoryIncomeListExample;
import org.apache.ibatis.annotations.Param;

public interface RepertoryIncomeListMapper {
    long countByExample(RepertoryIncomeListExample example);

    int deleteByExample(RepertoryIncomeListExample example);

    int insert(RepertoryIncomeList record);

    int insertSelective(RepertoryIncomeList record);

    List<RepertoryIncomeList> selectByExample(RepertoryIncomeListExample example);

    int updateByExampleSelective(@Param("record") RepertoryIncomeList record, @Param("example") RepertoryIncomeListExample example);

    int updateByExample(@Param("record") RepertoryIncomeList record, @Param("example") RepertoryIncomeListExample example);
}