package com.dgg.store.dao.store;

import com.dgg.store.util.vo.LoginVO;
import com.dgg.store.util.vo.manage.ManageMenuVO;

import java.util.List;

public interface ManageDao
{
    int findLoginUser(LoginVO loginVO);

    ManageMenuVO findTeamAndMemberCount(String myTeamId);

    List<ManageMenuVO> findDepartmentAndMemberCount(String myTeamId);
}
