package com.dgg.store.dao.common;

import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.core.PageVO;
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

    int countGoodsByType(GoodsTypeVO goodsType, Set<String> childType);

    int getRepertoryLevel(String userId, String myTeamId);

    int countGoodsByType2(GoodsTypeVO goodsTypeVO, Set<String> childType);

    List<GoodsInfoVO> findGoodsList2(GoodsTypeVO goodsTypeVO, int start, int end, Set<String> childType);

    GoodsDetailVO findGoodsDetail_2(String goodsId, String id);

    String getFirstBranchId( String myTeamId, byte branchType);

    int countBranchGoods(GoodsTypeVO goodsTypeVO, Set<String> childType, String branchId);

    List<GoodsInfoVO> listBranchGoods(GoodsTypeVO goodsTypeVO, Set<String> childType, PageVO pageVO, String branchId);

    String getGoodsImage(String goodsId);

    String getCurrentBranchId(String userId);

    GoodsDetailVO getGoodsInfo(String goodsId);

    List<GoodsStandard> listGoodsStandard(String goodsId, String branchId);

    List<String> listGoodsImage(String goodsId);
}
