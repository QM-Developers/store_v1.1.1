package com.dgg.store.mapper;

import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RepertoryCheckMapper
{
    int countGoods(@Param("myTeamId") String myTeamId);

    List<GoodsDetailVO> listGoods(@Param("myTeamId") String myTeamId, @Param("start") int start, @Param("end") int end);

    List<GoodsStandard> listStandards(GoodsDetailVO vo);

    String getBranchId(@Param("userId") String userId);

    int countBranchGoods(@Param("branchId") String branchId);

    List<GoodsDetailVO> listBranchGoods(@Param("branchId") String branchId, @Param("start") int start, @Param("end") int end);

    List<GoodsStandard> listBranchStandards(@Param("goodsId") String goodsId, @Param("branchId") String branchId);
}
