package com.dgg.store.service.store;

import com.dgg.store.util.pojo.RepertoryApply;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface RepertoryApplyService
{
    String listRepertoryChecker(SessionVO sessionVO);

    String insertRepertoryApply(SessionVO sessionVO, RepertoryApply apply);

    String listRepertoryApplyByProposer(SessionVO sessionVO, PageVO pageVO);

    String listRepertoryApplyByApprover(SessionVO sessionVO, RepertoryApply apply, PageVO pageVO);

    String updateRepertoryApplyAccept(SessionVO sessionVO, RepertoryApply apply);

    String updateRepertoryApplyFinish(SessionVO sessionVO, RepertoryApply apply);
}
