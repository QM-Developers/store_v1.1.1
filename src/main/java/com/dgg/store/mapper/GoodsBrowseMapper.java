package com.dgg.store.mapper;

import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface GoodsBrowseMapper
{
    List<GoodsTypeVO> findGoodsType(@Param("typeId") String goodsTypePid);

    List<GoodsInfoVO> findGoodsList(@Param("type") GoodsTypeVO goodsTypeId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize,@Param("childType") Set<String> childType);

    GoodsDetailVO findGoodsDetail(@Param("goodsId") String goodsId);

    GoodsStandard findGoodsStandard(@Param("standardId") String standardId);

    String findGoodsDescribe(@Param("goodsId") String goodsId);

    String findGoodsDescribeImg(@Param("id") String id);

    List<GoodsTypeVO> findAllGoodsType();

    Set<String> findChildTypeId(@Param("typeId") String typeId);

    int countGoodsByType(@Param("type") GoodsTypeVO goodsTypeId);
}
