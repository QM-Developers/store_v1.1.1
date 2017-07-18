package com.dgg.store.dao.common;

import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.register.RegisterVO;

public interface RegisterDao
{
    int updateUserData(RegisterVO condition);

    LoginRepVO findLoginRepVO(RegisterVO condition);
}
