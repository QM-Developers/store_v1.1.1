package com.dgg.store.dao.store;

import com.dgg.store.util.vo.manage.DepartmentVO;
import com.dgg.store.util.vo.team.MemberVO;
import com.dgg.store.util.vo.team.TeamDepartmentVO;

import java.util.List;

public interface MyTeamDao
{
    TeamDepartmentVO findDepartmentDetail(TeamDepartmentVO department);

    List<MemberVO> findDepartmentMember(MemberVO member);

    List<MemberVO> findMemberByNameOrPhone(MemberVO member);

    List<TeamDepartmentVO> listTeamDepartment(String myTeamId);
}
