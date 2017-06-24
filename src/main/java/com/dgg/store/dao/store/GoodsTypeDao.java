package com.dgg.store.dao.store;


import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.vo.core.TreeVO;

import java.util.List;

public interface GoodsTypeDao
{
    List<TreeVO> findTypeTree();

    Integer insertGoodsType(GoodsTypeinfo typeinfo);

    List<GoodsTypeAttr> findGoodsTypeAttr(GoodsTypeAttr typeAttr);

    void cleanGoodsTypeAttr(GoodsTypeAttr typeAttr);

    int insertGoodsTypeAttr(GoodsTypeAttr newTypeAttr);

    List<GoodsTypeinfo> findGoodsTypeByPid(String goodsTypePid);

    Integer deleteGoodsType(String goodsTypeId);
}
