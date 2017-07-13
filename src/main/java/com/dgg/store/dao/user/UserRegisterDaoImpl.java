package com.dgg.store.dao.user;

import com.dgg.store.mapper.UserMapper;
import com.dgg.store.util.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserRegisterDaoImpl implements UserRegisterDao
{
    @Autowired
    private UserMapper mapper;

    @Override
    public int updateUserById(User user)
    {
        return mapper.updateUserById(user);
    }

    @Override
    public User findUserByPhone(String myTeamId, String userPhone)
    {
        return mapper.findUserByPhone(myTeamId,userPhone);
    }

    @Override
    public List<String> findUserTeam(String userPhone)
    {
        return mapper.findUserTeam(userPhone);
    }

    @Override
    public List<String> findChildrenTeam(String teamId)
    {
        return mapper.findChildrenTeam(teamId);
    }

}
