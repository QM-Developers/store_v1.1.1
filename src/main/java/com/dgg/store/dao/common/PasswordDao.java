package com.dgg.store.dao.common;

import com.dgg.store.util.vo.core.LoginRepVO;
import com.dgg.store.util.vo.password.PasswordVO;

public interface PasswordDao
{
    LoginRepVO findLoginRepVO(PasswordVO condition);

    Integer updatePassword(PasswordVO condition);
}
