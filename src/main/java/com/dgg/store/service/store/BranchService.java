package com.dgg.store.service.store;

import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface BranchService
{
    ResultVO insertBranch(SessionVO sessionVO, BranchVO branchVO);
}
