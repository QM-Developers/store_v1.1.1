package com.dgg.store.mapper;

import com.dgg.store.util.pojo.GoodsAttr;
import com.dgg.store.util.pojo.GoodsAttrExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GoodsAttrMapper {
    long countByExample(GoodsAttrExample example);

    int deleteByExample(GoodsAttrExample example);

    int deleteByPrimaryKey(String goodsAttrId);

    int insert(GoodsAttr record);

    int insertSelective(GoodsAttr record);

    List<GoodsAttr> selectByExample(GoodsAttrExample example);

    GoodsAttr selectByPrimaryKey(String goodsAttrId);

    int updateByExampleSelective(@Param("record") GoodsAttr record, @Param("example") GoodsAttrExample example);

    int updateByExample(@Param("record") GoodsAttr record, @Param("example") GoodsAttrExample example);

    int updateByPrimaryKeySelective(GoodsAttr record);

    int updateByPrimaryKey(GoodsAttr record);

    
}