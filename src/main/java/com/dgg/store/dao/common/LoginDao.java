package com.dgg.store.dao.common;

import com.dgg.store.util.vo.LoginVO;

public interface LoginDao
{
    Object findLoginUser(LoginVO loginVO);

    int updateToken(String loginName, String token);

    Object findLoginUserByPhone(LoginVO loginVO);
}
