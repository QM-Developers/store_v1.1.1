package com.dgg.store.service.sys;

import com.dgg.store.util.vo.core.SessionVO;

public interface UserService
{
    SessionVO findUserSessionVOById(String userId);

    int updateUserById(String userId, String token);
}
