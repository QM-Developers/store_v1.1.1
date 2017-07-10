package com.dgg.store.mapper;

import com.dgg.store.util.vo.team.MemberVO;
import com.dgg.store.util.vo.team.TeamDepartmentVO;

import java.util.List;

public interface MyTeamMapper
{
    TeamDepartmentVO findDepartmentDetail(TeamDepartmentVO department);

    List<MemberVO> findDepartmentMember(MemberVO member);

    List<MemberVO> findMemberByNameOrPhone(MemberVO member);
}