package com.dgg.store.service.store;

import com.dgg.store.util.vo.branch.BranchGoodsVO;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface BranchService
{
    ResultVO insertBranch(SessionVO sessionVO, BranchVO branchVO);

    String listBranch(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO);

    ResultVO deleteBranch(SessionVO sessionVO, BranchVO branchVO);

    ResultVO getBranch(SessionVO sessionVO, BranchVO branchVO);

    ResultVO updateBranch(SessionVO sessionVO, BranchVO branchVO);

    String listGoods(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO);

    ResultVO updateBranchGoods(SessionVO sessionVO, BranchGoodsVO branchGoodsVO);

    String listBranchGoods(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO);
}
