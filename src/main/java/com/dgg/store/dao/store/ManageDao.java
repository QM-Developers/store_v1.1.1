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

    Integer insertPerPosRe(List<PerPosReVO> perPosReList);

    DepartmentVO findDepartmentInfo(String departmentId);

    Integer updateDepartment(DepartmentVO department);

    Integer cleanPosition(String departmentId);

    Integer cleanPerPosRe(String departmentId);

    Integer deleteDepartment(String departmentId);

    Integer findDepartmentMemberCount(String departmentId);

    List<DepartmentVO> findDepartmentList(String myTeamId);

    List<MemberVO> findPositionList(String departmentId);

    Integer insertMember(MemberVO member);

    Integer insertPerUserRe(List<PerUserReVO> perUserReList);

    List<MemberVO> findMemberList(MemberVO memberVO);

    Integer countPositionMember(String positionId);

    MemberVO findMemberInfo(String memberId);

    Integer updateMember(MemberVO member);

    Integer cleanPerUserRe(String memberId);
}
