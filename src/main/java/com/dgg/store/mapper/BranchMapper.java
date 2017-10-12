package com.dgg.store.mapper;

import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.branch.BranchGoodsVO;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface BranchMapper
{
    int insertBranch(BranchVO branchVO);

    List<BranchVO> listBranch(@Param("condition") BranchVO branchVO, @Param("start") int start, @Param("end") int end);

    int deleteBranch(BranchVO condition);

    BranchVO getBranch(@Param("branchId") String branchId);

    int updateBranch(BranchVO branchVO);

    List<GoodsDetailVO> listGoods(@Param("condition") BranchVO condition, @Param("start") int start, @Param("end") int end);

    int getGoodsInventory(@Param("standardId") String standardId);

    int updateGoodsInventory(@Param("standardId") String standardId, @Param("inventory") int inventory);

    int deleteBranchGoods(BranchGoodsVO condition);

    int insertBranchGoods(BranchGoodsVO branchGoodsVO);

    Integer getBranchInventory(BranchGoodsVO condition);

    List<GoodsDetailVO> listBranchGoods(@Param("branchVO") BranchVO condition, @Param("childType") Set<String> childType, @Param("start") int start, @Param("end") int end);

    int countBranch(BranchVO condition);

    int countBranchGoods(@Param("branchVO") BranchVO condition, @Param("childType") Set<String> childType);

    int countGoods(BranchVO condition);

    List<GoodsStandard> listStandards(GoodsDetailVO vo);

    List<GoodsStandard> listBranchStandards(@Param("goodsId") String goodsId, @Param("branchId") String branchId);

    int countBranchStandard(@Param("standardId") String standardId, @Param("branchId") String branchId);

    String getCurrentBranchId(String userId);

    String getFirstBranchId(@Param("myTeamId") String myTeamId, @Param("branchType") byte branchType);

    String getBranchName(String branchId);

    String getGoodsImage(String goodsId);

    int countGoodsByKeyword(BranchVO branchVO);

    List<GoodsDetailVO> listGoodsByKeyword(@Param("branchVO") BranchVO branchVO, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
}
