package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.branch.BranchGoodsVO;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;

import java.util.List;
import java.util.Set;

public interface BranchDao
{
    int insertBranch(BranchVO branchVO);

    List<BranchVO> listBranch(BranchVO branchVO, int start, int end);

    int deleteBranch(BranchVO condition);

    BranchVO getBranch(String branchId);

    int updateBranch(BranchVO branchVO);

    List<GoodsDetailVO> listGoods(BranchVO condition, int start, int end);

    int getGoodsInventory(String standardId);

    int updateGoodsInventory(String standardId, int inventory);

    int deleteBranchGoods(BranchGoodsVO condition);

    int insertBranchGoods(BranchGoodsVO branchGoodsVO);

    Integer getBranchInventory(BranchGoodsVO condition);

    List<GoodsDetailVO> listBranchGoods(BranchVO condition, Set<String> childType, int start, int end);

    int countBranch(BranchVO condition);

    int countGoods(BranchVO condition);

    int countBranchGoods(BranchVO condition, Set<String> childType);

    List<GoodsStandard> listStandards(GoodsDetailVO vo);

    List<GoodsStandard> listBranchStandards(String goodsId, String branchId);

    int countBranchStandard(String standardId, String branchId);

    String getCurrentBranchId(String userId);

    String getFirstBranchId(String myTeamId, byte branchType);
}
