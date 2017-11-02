package com.dgg.store.mapper;

import com.dgg.store.util.vo.core.LoginVO;
import com.dgg.store.util.vo.manage.*;
import com.dgg.store.util.vo.permission.QMPermissionVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ManageMapper
{
    int findLoginUser(LoginVO loginVO);

    ManageMenuVO findTeamAndMemberCount(@Param("myTeamId") String myTeamId);

    List<ManageMenuVO> findDepartmentAndMemberCount(@Param("myTeamId") String myTeamId);

    Integer insertDepartment(DepartmentVO department);

    Integer insertPosition(PositionVO positionList);

    Integer insertPerPosRe(PerPosReVO perPosReList);

    DepartmentVO findDepartmentInfo(@Param("departmentId") String departmentId);

    Integer updateDepartment(DepartmentVO department);

    Integer cleanPosition(@Param("departmentId") String departmentId);

    Integer cleanPerPosRe(@Param("departmentId") String departmentId);

    Integer deleteDepartment(@Param("departmentId") String departmentId);

    Integer findDepartmentMemberCount(@Param("departmentId") String departmentId);

    List<DepartmentVO> findDepartmentList(@Param("myTeamId") String myTeamId);

    List<MemberVO> findPositionList(@Param("departmentId") String departmentId);

    Integer insertMember(MemberVO member);

    Integer insertPerUserRe(@Param("list") List<PerUserReVO> perUserReList);

    List<MemberVO> findMemberList(MemberVO memberVO);

    Integer countPositionMember(@Param("positionId") String positionId);

    MemberVO findMemberInfo(@Param("userId") String memberId);

    Integer updateMember(MemberVO member);

    Integer cleanPerUserRe(@Param("userId") String memberId);

    Integer deleteMember(MemberVO condition);

    Integer insertCustomerVisit(@Param("userId") String userId, @Param("departmentId") String departmentId);

    int cleanCustomerVisit(@Param("userId") String userId);

    List<QMPermissionVO> listQmPermission();

    int countMember(MemberVO memberVO);
}
