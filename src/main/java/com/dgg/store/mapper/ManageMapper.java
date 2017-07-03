package com.dgg.store.mapper;

import com.dgg.store.util.vo.LoginVO;
import com.dgg.store.util.vo.manage.ManageMenuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ManageMapper
{
    int findLoginUser(LoginVO loginVO);

    ManageMenuVO findTeamAndMemberCount(@Param("myTeamId") String myTeamId);

    List<ManageMenuVO> findDepartmentAndMemberCount(@Param("myTeamId") String myTeamId);
}
