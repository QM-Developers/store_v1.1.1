package com.dgg.store.mapper;

import com.dgg.store.util.pojo.RepertoryApplyList;
import com.dgg.store.util.pojo.RepertoryApplyListExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RepertoryApplyListMapper {
    long countByExample(RepertoryApplyListExample example);

    int deleteByExample(RepertoryApplyListExample example);

    int insert(RepertoryApplyList record);

    int insertSelective(RepertoryApplyList record);

    List<RepertoryApplyList> selectByExample(RepertoryApplyListExample example);

    int updateByExampleSelective(@Param("record") RepertoryApplyList record, @Param("example") RepertoryApplyListExample example);

    int updateByExample(@Param("record") RepertoryApplyList record, @Param("example") RepertoryApplyListExample example);
}