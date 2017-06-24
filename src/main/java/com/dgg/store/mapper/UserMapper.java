package com.dgg.store.mapper;

import com.dgg.store.util.pojo.*;
import com.dgg.store.util.vo.core.SessionVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper
{
    int insert(User record);

    List<User> findStores();

    List<Role> findRolesByStore(SessionVO sessionVO);

    Integer updateUserById(User store);

    Integer deleteUserById(@Param("userId") String userId);

    SessionVO findUserSessionVOById(@Param("userId") String userId);

    User findUserByPhone(@Param("teamId") String myTeamId, @Param("userPhone") String userPhone);

    List<String> findUserTeam(@Param("userPhone") String userPhone);

    List<String> findChildrenTeam(@Param("teamId") String teamId);
}