package com.dgg.store.service.common;


import com.dgg.store.util.vo.core.LoginVO;

public interface LoginService
{
    Object updateAndFindLoginUser(LoginVO loginVO);

    Object findUserByLogin(LoginVO loginVO);
}
