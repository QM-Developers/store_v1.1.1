package com.dgg.store.service.user;

import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.SessionVO;

public interface UserRegisterService
{
    Object updateUserStatus(SessionVO sessionVO, User user);

    Object findUserStatus(SessionVO sessionVO,User user);
}
