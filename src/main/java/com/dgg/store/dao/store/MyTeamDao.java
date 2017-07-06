package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.MyTeam;
import com.dgg.store.util.pojo.TeamDepartment;
import com.dgg.store.util.vo.core.SearchVO;
import com.dgg.store.util.vo.core.TreeVO;
import com.dgg.store.util.vo.team.DepartmentMemberVO;
import com.dgg.store.util.vo.team.MyTeamVO;
import com.dgg.store.util.vo.team.TeamDepartmentVO;

import java.util.List;

public interface MyTeamDao
{
    Integer insertMyTeam(MyTeamVO teamVO);

    Integer insertDepartment(TeamDepartment department);

    List<TeamDepartment> findDepartmentList(String myTeamId);

    Integer insertDepartmentMember(DepartmentMemberVO memberVO);

    List<MyTeam> findCompanyList(String myTeamId);

    List<SearchVO> findTeamsByKeyword(String keyword);

    MyTeamVO findCompanyInfo(String myTeamId);

    Integer updateRoleByDepartment(String teamDepartmentId, String roleTeamPersonal);

    Integer updateRoleByUser(String userId, String roleId);

    List<TeamDepartment> findCCDepartmentList(String s, String strCoporationManager);

    List<DepartmentMemberVO> findDepartmentMember(DepartmentMemberVO department);

    DepartmentMemberVO findDepartmentMemberInfo(String userId);

    List<TeamDepartmentVO> findCDepartmentList(String myTeamId,String roleId);

    Integer updateDepartment(DepartmentMemberVO memberVO);

    Integer findDepartmentMemberCount(String teamDepartmentId);

    MyTeamVO findCompanyPrincipal(String myTeamId, String departmentManager, String roleTeamPersonal);

    List<TreeVO> findChildTeamTree(String teamId);

    List<TreeVO> findDepartmentTree(String teamId);
}
