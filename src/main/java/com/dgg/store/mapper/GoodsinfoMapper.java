package com.dgg.store.mapper;

import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.ImageSpace;
import com.dgg.store.util.vo.goods.GoodsImgVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsinfoMapper
{
    int insertGoodsinfo(GoodsInfoVO goodsinfo);

    GoodsTypeVO findTypeAndParent(@Param("typePid") String goodsTypeId);

    GoodsTypeVO findGoodsType(@Param("typeId") String goodsTypePid);

    List<GoodsTypeAttr> findTypeAttr(@Param("typeId") String goodsTypeId);

    int insertImgToSpace(@Param("imageId") String imgId,@Param("imagePath") String path, @Param("myTeamId") String teamId);

    Integer insertImgToGoods(GoodsImgVO imgVO);

    List<ImageSpace> findImages(@Param("myTeamId") String myTeamId);

    Integer insertStandardToGoods(GoodsStandard standard);
}