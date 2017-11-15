package com.dgg.store.mapper;

import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface GoodsBrowseMapper
{
    List<GoodsTypeVO> findGoodsType(@Param("typeId") String goodsTypePid);

    List<GoodsInfoVO> findGoodsList(@Param("type") GoodsTypeVO goodsTypeId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize, @Param("childType") Set<String> childType);

    GoodsDetailVO findGoodsDetail(@Param("goodsId") String goodsId);

    GoodsStandard findGoodsStandard(@Param("standardId") String standardId);

    String findGoodsDescribe(@Param("goodsId") String goodsId);

    String findGoodsDescribeImg(@Param("id") String id);

    List<GoodsTypeVO> findAllGoodsType();

    Set<String> findChildTypeId(@Param("typeId") String typeId);

    int countGoodsByType(@Param("type") GoodsTypeVO goodsTypeId, @Param("childType") Set<String> childType);

    int countGoodsByType2(@Param("type") GoodsTypeVO goodsTypeId, @Param("childType") Set<String> childType);

    List<GoodsInfoVO> findGoodsList2(@Param("type") GoodsTypeVO goodsTypeId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize, @Param("childType") Set<String> childType);

    GoodsDetailVO findGoodsDetail_2(@Param("goodsId") String goodsId, @Param("userId") String id);

    String getFirstBranchId(@Param("myTeamId") String myTeamId, @Param("branchType") byte branchType);

    int countBranchGoods(@Param("type") GoodsTypeVO goodsTypeVO, @Param("childType") Set<String> childType, @Param("branchId") String branchId);

    List<GoodsInfoVO> listBranchGoods(@Param("type") GoodsTypeVO goodsTypeVO, @Param("childType") Set<String> childType, @Param("pageVO") PageVO pageVO, @Param("branchId") String branchId);

    String getGoodsImage(String goodsId);

    String getCurrentBranchId(String userId);

    GoodsDetailVO getGoodsInfo(String goodsId);

    List<GoodsStandard> listGoodsStandard(@Param("goodsId") String goodsId,@Param("branchId") String branchId);

    List<String> listGoodsImage(String goodsId);

    int getRepertoryLevel(@Param("userId") String userId,@Param("myTeamId") String myTeamId);
}
