package com.dgg.store.mapper;

import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.register.RegisterVO;

public interface RegisterMapper
{
    int updateUserData(RegisterVO condition);

    LoginRepVO findLoginRepVO(String userId);
}
