package com.dgg.store.dao.store;

import com.dgg.store.mapper.BranchMapper;
import com.dgg.store.util.vo.branch.BranchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BranchDaoImpl implements BranchDao
{
    @Autowired
    private BranchMapper mapper;

    @Override
    public int insertBranch(BranchVO branchVO)
    {
        return mapper.insertBranch(branchVO);
    }
}
