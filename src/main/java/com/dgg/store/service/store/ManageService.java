package com.dgg.store.service.store;

import com.dgg.store.util.vo.LoginVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.manage.MemberVO;

public interface ManageService
{
    ResultVO findLoginUser(SessionVO sessionVO, LoginVO loginVO);

    ResultVO findTeamAndMemberCount(SessionVO sessionVO);

    ResultVO findMemberList(SessionVO sessionVO, MemberVO memberVO);
}
