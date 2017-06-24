package com.dgg.store.dao.user;

import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.SessionVO;

public interface UserDao
{
    SessionVO findUserSessionVOById(String userId);

    void updateUserById(User user);
}
