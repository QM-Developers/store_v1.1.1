package com.dgg.store.mapper;

import com.dgg.store.util.pojo.MyTeam;
import com.dgg.store.util.pojo.TeamDepartment;
import com.dgg.store.util.vo.core.SearchVO;
import com.dgg.store.util.vo.core.TreeVO;
import com.dgg.store.util.vo.team.DepartmentMemberVO;
import com.dgg.store.util.vo.team.DepartmentVO;
import com.dgg.store.util.vo.team.MyTeamVO;
import com.dgg.store.util.vo.team.TeamDepartmentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyTeamMapper
{
    Integer insertMyTeam(MyTeamVO teamVO);

    Integer insertDepartment(TeamDepartment department);

    List<TeamDepartment> findDepartmentList(@Param("teamId") String myTeamId);

    DepartmentVO findDepartmentInfo(@Param("departmentId") String teamDepartmentId, @Param("personal") String personal);

    Integer insertDepartmentMember(DepartmentMemberVO memberVO);

    List<MyTeam> findCompanyList(@Param("teamId") String myTeamId);

    List<SearchVO> findTeamsByKeyword(@Param("keyword") String keyword);

    MyTeamVO findCompanyInfo(@Param("teamId") String myTeamId);

    Integer updateRoleByDepartment(@Param("departmentId") String teamDepartmentId, @Param("roleId") String roleTeamPersonal);

    Integer updateRoleByUser(@Param("userId") String userId, @Param("roleId") String roleId);

    List<TeamDepartment> findCCDepartmentList(@Param("teamId") String s, @Param("departmentName") String departmentName);

    List<DepartmentMemberVO> findDepartmentMember(DepartmentMemberVO department);

    DepartmentMemberVO findDepartmentMemberInfo(@Param("userId") String userId);

    List<TeamDepartmentVO> findCDepartmentList(@Param("teamId") String myTeamId, @Param("roleId") String roleId);

    Integer updateDepartment(DepartmentMemberVO memberVO);

    Integer findDepartmentMemberCount(@Param("departmentId") String teamDepartmentId);

    DepartmentVO findDepartmentManager(@Param("departmentId") String teamDepartmentId,@Param("roleId") String roleId);

    MyTeamVO findCompanyPrincipal(@Param("teamId") String myTeamId, @Param("departmentType") String departmentType,@Param("roleId") String roleId);

    List<TreeVO> findChildTeamTree(@Param("teamId") String teamId);

    List<TreeVO> findDepartmentTree(@Param("teamId") String teamId);
}