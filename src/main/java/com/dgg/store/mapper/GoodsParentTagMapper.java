package com.dgg.store.mapper;

import com.dgg.store.util.pojo.GoodsParentTag;
import com.dgg.store.util.pojo.GoodsParentTagExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GoodsParentTagMapper {
    long countByExample(GoodsParentTagExample example);

    int deleteByExample(GoodsParentTagExample example);

    int deleteByPrimaryKey(String goodsParentTagId);

    int insert(GoodsParentTag record);

    int insertSelective(GoodsParentTag record);

    List<GoodsParentTag> selectByExample(GoodsParentTagExample example);

    GoodsParentTag selectByPrimaryKey(String goodsParentTagId);

    int updateByExampleSelective(@Param("record") GoodsParentTag record, @Param("example") GoodsParentTagExample example);

    int updateByExample(@Param("record") GoodsParentTag record, @Param("example") GoodsParentTagExample example);

    int updateByPrimaryKeySelective(GoodsParentTag record);

    int updateByPrimaryKey(GoodsParentTag record);
}