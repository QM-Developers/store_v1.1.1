package com.dgg.store.service.common;

import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.password.PasswordVO;

public interface PasswordService
{
    ResultVO getPasswordVerify(PasswordVO passwordVO);

    ResultVO passwordVerify(PasswordVO passwordVO);

    ResultVO updatePassword(SessionVO sessionVO, PasswordVO passwordVO);

    String verifyPassword(SessionVO sessionVO, PasswordVO passwordVO);
}
