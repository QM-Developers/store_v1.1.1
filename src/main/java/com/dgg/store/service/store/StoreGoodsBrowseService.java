package com.dgg.store.service.store;

import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;

public interface StoreGoodsBrowseService
{
    String listByType(SessionVO sessionVO, GoodsTypeVO goodsTypeVO, PageVO pageVO);

    String get(SessionVO sessionVO, GoodsDetailVO goodsDetailVO);
}
