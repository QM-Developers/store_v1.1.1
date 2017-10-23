package com.dgg.store.service.store;

import com.dgg.store.util.vo.branch.BranchGoodsVO;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface BranchService
{
    String insertBranch(SessionVO sessionVO, BranchVO branchVO);

    String listBranch(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO);

    ResultVO deleteBranch(SessionVO sessionVO, BranchVO branchVO);

    String getBranch(SessionVO sessionVO, BranchVO branchVO);

    String updateBranch(SessionVO sessionVO, BranchVO branchVO);

    String listGoods(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO);

    ResultVO updateBranchGoods(SessionVO sessionVO, BranchGoodsVO branchGoodsVO);

    String listBranchGoods(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO);

    String getRepertory(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO);

    String getFirstRepertory(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO);

    String listRepertoryByKeyword(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO);

    String getFirstBranchId(SessionVO sessionVO);
}
