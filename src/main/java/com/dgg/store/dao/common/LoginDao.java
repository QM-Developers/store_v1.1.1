package com.dgg.store.dao.common;

import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.core.LoginVO;

public interface LoginDao
{
    LoginRepVO findLoginUser(LoginVO loginVO);

    int updateLoginInfo(String userId);
}
