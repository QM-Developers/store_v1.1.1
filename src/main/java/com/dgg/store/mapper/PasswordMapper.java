package com.dgg.store.mapper;

import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.password.PasswordVO;

public interface PasswordMapper
{
    LoginRepVO findLoginRepVO(PasswordVO condition);

    Integer updatePassword(PasswordVO condition);
}
