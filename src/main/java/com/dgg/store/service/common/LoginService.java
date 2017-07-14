package com.dgg.store.service.common;


import com.dgg.store.util.vo.core.LoginVO;
import com.dgg.store.util.vo.core.ResultVO;

public interface LoginService
{
    Object findUserByLogin(LoginVO loginVO);

    ResultVO login(LoginVO loginVO);
}
