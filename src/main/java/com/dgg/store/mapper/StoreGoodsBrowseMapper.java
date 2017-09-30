package com.dgg.store.mapper;

import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsImgVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface StoreGoodsBrowseMapper
{
    int countGoodsByType(@Param("type") GoodsTypeVO goodsTypeVO, @Param("childType") Set<String> childType);

    List<GoodsInfoVO> findGoodsList(@Param("type") GoodsTypeVO goodsTypeVO, @Param("pageNum") int start, @Param("pageSize") int end, @Param("childType") Set<String> childType);

    Set<String> findChildTypeId(@Param("typeId") String goodsTypeId);

    GoodsDetailVO findGoodsDetail(GoodsDetailVO goodsDetailVO);

    String findGoodsDescribe(String goodsId);

    String findGoodsDescribeImg(String id);

    List<GoodsImgVO> listGoodsImage(@Param("goodsId") String goodsId);
}
