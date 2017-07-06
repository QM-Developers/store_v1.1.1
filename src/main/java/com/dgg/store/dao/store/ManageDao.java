package com.dgg.store.dao.store;

import com.dgg.store.util.vo.LoginVO;
import com.dgg.store.util.vo.manage.*;

import java.util.List;

public interface ManageDao
{
    int findLoginUser(LoginVO loginVO);

    ManageMenuVO findTeamAndMemberCount(String myTeamId);

    List<ManageMenuVO> findDepartmentAndMemberCount(String myTeamId);

    Integer insertDepartment(DepartmentVO department);

    Integer insertPosition(List<PositionVO> positionList);

    Integer insertPerPosRe(List<PerPosRe> perPosReList);

    DepartmentVO findDepartmentInfo(String departmentId);

    Integer updateDepartment(DepartmentVO department);

    Integer cleanPosition(String departmentId);

    Integer cleanPerPosRe(String departmentId);

    Integer deleteDepartment(String departmentId);

    Integer findDepartmentMemberCount(String departmentId);

    List<DepartmentVO> findDepartmentList(String myTeamId);

    List<MemberVO> findPositionList(String departmentId);
}
