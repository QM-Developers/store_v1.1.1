package com.dgg.store.service.store;

import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

import java.util.List;

public interface GoodsTypeService
{
    Object findTypeTree();

    Integer insertGoodsType(GoodsTypeinfo typeinfo);

    List<GoodsTypeAttr> findGoodsTypeAttr(GoodsTypeAttr typeAttr);

    Integer insertGoodsTypeAttr(GoodsTypeAttr typeAttr);

    ResultVO findGoodsTypeByPid(SessionVO sessionVO, GoodsTypeinfo typeinfo);

    ResultVO deleteGoodsType(SessionVO sessionVO, GoodsTypeVO typeVO);
}
