package com.dgg.store.service.common;


import com.dgg.store.util.vo.core.LoginVO;
import com.dgg.store.util.vo.core.SessionVO;

import javax.servlet.http.HttpSession;

public interface LoginService
{
    String findUserByLogin(HttpSession session, LoginVO loginVO);

    String updateLoginInfo(LoginVO loginVO);

    String logoutOnBrowser(SessionVO sessionVO, HttpSession session);
}
