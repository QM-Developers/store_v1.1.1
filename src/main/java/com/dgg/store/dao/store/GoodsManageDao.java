package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.ImageSpace;
import com.dgg.store.util.vo.goods.GoodsImgVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;

import java.util.List;

public interface GoodsManageDao
{
    int insertGoodsinfo(GoodsInfoVO goodsinfo);

    int insertImgToSpace(String imgId,String path,String teamId);

    GoodsTypeVO findTypeAndParent(String goodsTypePid);

    GoodsTypeVO findGoodsType(String goodsTypeId);

    List<GoodsTypeAttr> findTypeAttr(String goodsTypeId);

    Integer insertImgToGoods(GoodsImgVO imgVO);

    List<ImageSpace> findImages(String myTeamId);

    Integer insertStandardToGoods(GoodsStandard standard);

    List<GoodsInfoVO> findGoodsList(String myTeamId);
}
