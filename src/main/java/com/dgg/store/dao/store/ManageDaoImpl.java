package com.dgg.store.dao.store;

import com.dgg.store.mapper.ManageMapper;
import com.dgg.store.util.vo.LoginVO;
import com.dgg.store.util.vo.manage.ManageMenuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ManageDaoImpl implements ManageDao
{
    @Autowired
    private ManageMapper mapper;

    @Override
    public int findLoginUser(LoginVO loginVO)
    {
        return mapper.findLoginUser(loginVO);
    }

    @Override
    public ManageMenuVO findTeamAndMemberCount(String myTeamId)
    {
        return mapper.findTeamAndMemberCount(myTeamId);
    }

    @Override
    public List<ManageMenuVO> findDepartmentAndMemberCount(String myTeamId)
    {
        return mapper.findDepartmentAndMemberCount(myTeamId);
    }
}
