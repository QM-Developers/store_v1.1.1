package com.dgg.store.service.store;

import com.dgg.store.util.pojo.MyTeam;
import com.dgg.store.util.pojo.TeamDepartment;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SearchVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.team.DepartmentMemberVO;
import com.dgg.store.util.vo.team.MyTeamVO;

public interface MyTeamService
{
    ResultVO insertMyTeam(SessionVO sessionVO, MyTeamVO teamVO);

    ResultVO insertDepartment(SessionVO sessionVO, TeamDepartment department);

    ResultVO findDepartmentList(SessionVO sessionVO, MyTeam team);

    ResultVO findDepartmentInfo(SessionVO sessionVO, TeamDepartment department);

    ResultVO insertDepartmentMember(SessionVO sessionVO, DepartmentMemberVO memberVO);

    ResultVO findCompanyList(SessionVO sessionVO);

    ResultVO findTeamsByKeyword(SessionVO sessionVO,SearchVO searchVO);

    ResultVO findCompanyInfo(SessionVO sessionVO, MyTeamVO team);

    ResultVO updatePrincipal(SessionVO sessionVO, DepartmentMemberVO memberVO);

    ResultVO findCCDepartmentList(SessionVO sessionVO, MyTeam team);

    ResultVO findDepartmentMember(SessionVO sessionVO, DepartmentMemberVO department);

    ResultVO findDepartmentMemberInfo(SessionVO sessionVO, DepartmentMemberVO memberVO);

    ResultVO findCDepartmentList(SessionVO sessionVO, MyTeamVO teamVO);

    ResultVO updateDepartment(SessionVO sessionVO, DepartmentMemberVO memberVO);

    ResultVO findCorporationTree(SessionVO sessionVO);
}
