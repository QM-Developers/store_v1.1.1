package com.dgg.store.mapper;

import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeAttrExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GoodsTypeAttrMapper {
    long countByExample(GoodsTypeAttrExample example);

    int deleteByExample(GoodsTypeAttrExample example);

    int deleteByPrimaryKey(String goodsTypeAttrId);

    int insert(GoodsTypeAttr record);

    int insertSelective(GoodsTypeAttr record);

    List<GoodsTypeAttr> selectByExample(GoodsTypeAttrExample example);

    GoodsTypeAttr selectByPrimaryKey(String goodsTypeAttrId);

    int updateByExampleSelective(@Param("record") GoodsTypeAttr record, @Param("example") GoodsTypeAttrExample example);

    int updateByExample(@Param("record") GoodsTypeAttr record, @Param("example") GoodsTypeAttrExample example);

    int updateByPrimaryKeySelective(GoodsTypeAttr record);

    int updateByPrimaryKey(GoodsTypeAttr record);
}