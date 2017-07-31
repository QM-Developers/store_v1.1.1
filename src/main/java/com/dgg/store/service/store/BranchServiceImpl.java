package com.dgg.store.service.store;

import com.dgg.store.dao.store.BranchDao;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BranchServiceImpl implements BranchService
{
    @Autowired
    private BranchDao dao;

    @Override
    public ResultVO insertBranch(SessionVO sessionVO, BranchVO branchVO)
    {
        branchVO.setBranchId(IDGenerator.generator());
        int result = dao.insertBranch(branchVO);

        ResultVO resultVO = new ResultVO(result == 0 ? 2 : 1, sessionVO.getToken(), result);

        return resultVO;
    }
}
