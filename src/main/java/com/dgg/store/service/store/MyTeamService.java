package com.dgg.store.service.store;

import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.team.MemberVO;
import com.dgg.store.util.vo.team.TeamDepartmentVO;

public interface MyTeamService
{
    ResultVO findDepartmentDetail(SessionVO sessionVO, TeamDepartmentVO department);

    ResultVO findDepartmentMember(SessionVO sessionVO, MemberVO member);

    ResultVO findMemberByNameOrPhone(SessionVO sessionVO, MemberVO member);
}
