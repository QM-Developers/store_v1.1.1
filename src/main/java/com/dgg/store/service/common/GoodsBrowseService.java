package com.dgg.store.service.common;


import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;

public interface GoodsBrowseService
{
    String findGoodsType(SessionVO sessionVO, GoodsTypeVO goodsTypeVO);

    String findGoodsList(SessionVO sessionVO, GoodsTypeVO goodsTypeVO, PageVO pageVO);

    String findGoodsDetail(SessionVO sessionVO, GoodsDetailVO goodsDetailVO);

    Object findGoodsDescribe(String goodsId);
}
