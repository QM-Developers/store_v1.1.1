package com.dgg.store.dao.user;

import com.dgg.store.mapper.UserMapper;
import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao
{
    @Autowired
    private UserMapper mapper;

    @Override
    public SessionVO findUserSessionVOById(String userId)
    {
        return mapper.findUserSessionVOById(userId);
    }

    @Override
    public void updateUserById(User user)
    {
        mapper.updateUserById(user);
    }
}
