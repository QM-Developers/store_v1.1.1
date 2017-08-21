package com.dgg.store.dao.common;

import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;

import java.util.List;
import java.util.Set;

public interface GoodsBrowseDao
{
    List<GoodsTypeVO> findGoodsType(String goodsTypePid);

    List<GoodsInfoVO> findGoodsList(GoodsTypeVO goodsType, int pageNum, int pageSize, Set<String> childType);

    GoodsDetailVO findGoodsDetail(String goodsId);

    GoodsStandard findGoodsStandard(String standardId);

    String findGoodsDescribe(String goodsId);

    String findGoodsDescribeImg(String id);

    List<GoodsTypeVO> findAllGoodsType();

    Set<String> findChildTypeId(String typeId);

    int countGoodsByType(GoodsTypeVO goodsType);
}
