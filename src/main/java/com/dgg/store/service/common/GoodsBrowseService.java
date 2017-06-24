package com.dgg.store.service.common;


import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface GoodsBrowseService
{
    ResultVO findGoodsType(SessionVO sessionVO, GoodsTypeVO goodsTypeVO);

    ResultVO findGoodsList(SessionVO sessionVO, GoodsTypeVO goodsTypeVO);

    ResultVO findGoodsDetail(SessionVO sessionVO, GoodsDetailVO goodsDetailVO);

    ResultVO findGoodsStandard(SessionVO sessionVO, GoodsStandard standard);

    Object findGoodsDescribe(String goodsId);
}
