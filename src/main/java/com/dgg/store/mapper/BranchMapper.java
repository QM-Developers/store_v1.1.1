package com.dgg.store.mapper;

import com.dgg.store.util.vo.branch.BranchGoodsVO;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BranchMapper
{
    int insertBranch(BranchVO branchVO);

    List<BranchVO> listBranch(@Param("condition")BranchVO branchVO, @Param("start") int start, @Param("end") int end);

    int deleteBranch(BranchVO condition);

    BranchVO getBranch(@Param("branchId") String branchId);

    int updateBranch(BranchVO branchVO);

    List<GoodsDetailVO> listGoods(@Param("condition") BranchVO condition, @Param("start") int start, @Param("end") int end);

    int getGoodsInventory(@Param("standardId") String standardId);

    int updateGoodsInventory(@Param("standardId") String standardId, @Param("inventory") int inventory);

    int deleteBranchGoods(BranchGoodsVO condition);

    int insertBranchGoods(BranchGoodsVO branchGoodsVO);

    Integer getBranchInventory(BranchGoodsVO condition);

    List<GoodsDetailVO> listBranchGoods(@Param("condition")BranchVO condition, @Param("start") int start, @Param("end") int end);

    int countBranch(BranchVO condition);

    int countBranchGoods(BranchVO condition);

    int countGoods(BranchVO condition);
}
