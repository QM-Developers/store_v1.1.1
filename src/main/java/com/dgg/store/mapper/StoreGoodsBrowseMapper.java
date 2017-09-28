package com.dgg.store.mapper;

import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;

import java.util.List;
import java.util.Set;

public interface StoreGoodsBrowseMapper
{
    int countGoodsByType(GoodsTypeVO goodsTypeVO);

    List<GoodsInfoVO> findGoodsList(GoodsTypeVO goodsTypeVO, int start, int end, Set<String> childType);

    Set<String> findChildTypeId(String goodsTypeId);

    GoodsDetailVO findGoodsDetail(GoodsDetailVO goodsDetailVO);

    String findGoodsDescribe(String goodsId);

    String findGoodsDescribeImg(String id);
}
