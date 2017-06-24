package com.dgg.store.mapper;

import com.dgg.store.util.pojo.Mall;
import com.dgg.store.util.pojo.MallExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MallMapper {
    long countByExample(MallExample example);

    int deleteByExample(MallExample example);

    int deleteByPrimaryKey(String storeMallId);

    int insert(Mall record);

    int insertSelective(Mall record);

    List<Mall> selectByExample(MallExample example);

    Mall selectByPrimaryKey(String storeMallId);

    int updateByExampleSelective(@Param("record") Mall record, @Param("example") MallExample example);

    int updateByExample(@Param("record") Mall record, @Param("example") MallExample example);

    int updateByPrimaryKeySelective(Mall record);

    int updateByPrimaryKey(Mall record);
}