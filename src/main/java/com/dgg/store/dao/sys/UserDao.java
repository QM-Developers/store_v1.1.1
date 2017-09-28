package com.dgg.store.dao.sys;

import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.SessionVO;

public interface UserDao
{
    SessionVO findUserSessionVOById(String userId);

    int updateUserById(User user);
}
