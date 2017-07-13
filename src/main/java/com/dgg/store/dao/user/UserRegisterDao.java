package com.dgg.store.dao.user;

import com.dgg.store.util.pojo.User;

import java.util.List;

public interface UserRegisterDao
{
    int updateUserById(User user);

    User findUserByPhone(String myTeamId, String userPhone);

    List<String> findUserTeam(String userPhone);

    List<String> findChildrenTeam(String teamId);
}
