package com.dgg.store.service.sys;

import com.dgg.store.dao.sys.UserDao;
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
    public SessionVO findUserSessionVOById(String userId)
    {
        return dao.findUserSessionVOById(userId);
    }

    @Override
    public int updateUserById(String userId, String token)
    {
        User user = new User();
        user.setUserId(userId);
        user.setToken(token);

        return dao.updateUserById(user);
    }
}
