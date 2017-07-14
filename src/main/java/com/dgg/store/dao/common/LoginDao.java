package com.dgg.store.dao.common;

import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.core.LoginVO;

public interface LoginDao
{
    LoginRepVO findLoginUser(LoginVO loginVO);

    int updateToken(String loginName, String token);

    Object findLoginUserByPhone(LoginVO loginVO);
}
