package com.dgg.store.mapper;

import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.pojo.GoodsTypeinfoExample;
import java.util.List;

import com.dgg.store.util.vo.core.TreeVO;
import org.apache.ibatis.annotations.Param;

public interface GoodsTypeinfoMapper {
    long countByExample(GoodsTypeinfoExample example);

    int deleteByExample(GoodsTypeinfoExample example);

    int deleteByPrimaryKey(String goodsTypeId);

    int insert(GoodsTypeinfo record);

    int insertSelective(GoodsTypeinfo record);

    List<GoodsTypeinfo> selectByExample(GoodsTypeinfoExample example);

    GoodsTypeinfo selectByPrimaryKey(String goodsTypeId);

    int updateByExampleSelective(@Param("record") GoodsTypeinfo record, @Param("example") GoodsTypeinfoExample example);

    int updateByExample(@Param("record") GoodsTypeinfo record, @Param("example") GoodsTypeinfoExample example);

    int updateByPrimaryKeySelective(GoodsTypeinfo record);

    int updateByPrimaryKey(GoodsTypeinfo record);


    List<TreeVO> findTypeTree();

    List<GoodsTypeAttr> findGoodsTypeAttr(GoodsTypeAttr typeAttr);

    void cleanGoodsTypeAttr(GoodsTypeAttr typeAttr);

    int insertGoodsTypeAttr(GoodsTypeAttr newTypeAttr);

    List<GoodsTypeinfo> findGoodsTypeByPid(@Param("typePid") String goodsTypePid);

    Integer deleteGoodsType(@Param("typeId") String goodsTypeId);
}