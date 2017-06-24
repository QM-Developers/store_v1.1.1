package com.dgg.store.service.common;


import com.dgg.store.util.vo.LoginVO;

public interface LoginService
{
    Object updateAndFindLoginUser(LoginVO loginVO);

    Object findUserByLogin(LoginVO loginVO);

    Object LoginByVerify(LoginVO loginVO);
}
