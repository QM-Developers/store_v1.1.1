package com.dgg.store.service.user;

import com.dgg.store.util.vo.core.SessionVO;

public interface UserService
{
    void updateUserById(String userId, String token);

    SessionVO findUserSessionVOById(String userId);

    void updateLastLoginTimeById(String userId);
}
