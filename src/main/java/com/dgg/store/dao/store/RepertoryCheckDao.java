package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.goods.GoodsDetailVO;

import java.util.List;

public interface RepertoryCheckDao
{
    int countGoods(String myTeamId);

    List<GoodsDetailVO> listGoods(String myTeamId, int start, int end);

    List<GoodsStandard> listStandards(GoodsDetailVO vo);

    String getBranchId(String userId);

    int countBranchGoods(String branchId);

    List<GoodsDetailVO> listBranchGoods(String branchId, int start, int end);

    List<GoodsStandard> listBranchStandards(String goodsId, String branchId);
}
