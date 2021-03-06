package com.dgg.store.dao.store;

import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsImgVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;

import java.util.List;
import java.util.Set;

public interface StoreGoodsBrowseDao
{
    int countGoodsByType(GoodsTypeVO goodsTypeVO, Set<String> childType);

    List<GoodsInfoVO> findGoodsList(GoodsTypeVO goodsTypeVO, int start, int end, Set<String> childType);

    Set<String> findChildTypeId(String goodsTypeId);

    GoodsDetailVO findGoodsDetail(GoodsDetailVO goodsDetailVO);

    String findGoodsDescribe(String goodsId);

    String findGoodsDescribeImg(String id);

    List<GoodsImgVO> listGoodsImage(String goodsId);
}
