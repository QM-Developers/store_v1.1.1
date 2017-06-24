package com.dgg.store.mapper;

import com.dgg.store.util.pojo.GoodsChildTag;
import com.dgg.store.util.pojo.GoodsChildTagExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GoodsChildTagMapper {
    long countByExample(GoodsChildTagExample example);

    int deleteByExample(GoodsChildTagExample example);

    int deleteByPrimaryKey(String goodsChildTagId);

    int insert(GoodsChildTag record);

    int insertSelective(GoodsChildTag record);

    List<GoodsChildTag> selectByExample(GoodsChildTagExample example);

    GoodsChildTag selectByPrimaryKey(String goodsChildTagId);

    int updateByExampleSelective(@Param("record") GoodsChildTag record, @Param("example") GoodsChildTagExample example);

    int updateByExample(@Param("record") GoodsChildTag record, @Param("example") GoodsChildTagExample example);

    int updateByPrimaryKeySelective(GoodsChildTag record);

    int updateByPrimaryKey(GoodsChildTag record);
}