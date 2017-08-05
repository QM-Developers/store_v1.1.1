package com.dgg.store.service.common;


import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface GoodsBrowseService
{
    String findGoodsType(SessionVO sessionVO, GoodsTypeVO goodsTypeVO);

    String findGoodsList(SessionVO sessionVO, GoodsTypeVO goodsTypeVO, PageVO pageVO);

    ResultVO findGoodsDetail(SessionVO sessionVO, GoodsDetailVO goodsDetailVO);

    ResultVO findGoodsStandard(SessionVO sessionVO, GoodsStandard standard);

    Object findGoodsDescribe(String goodsId);
}
