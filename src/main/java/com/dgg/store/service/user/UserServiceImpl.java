package com.dgg.store.service.user;

import com.dgg.store.dao.user.UserDao;
import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService
{
    @Autowired
    private UserDao dao;

    @Override
    public void updateUserById(String userId, String token)
    {
        User user = new User();
        user.setUserId(userId);
        user.setToken(token);

        dao.updateUserById(user);
    }

    @Override
    public SessionVO findUserSessionVOById(String userId)
    {
        return dao.findUserSessionVOById(userId);
    }

    @Override
    public void updateLastLoginTimeById(String userId)
    {

    }

}
