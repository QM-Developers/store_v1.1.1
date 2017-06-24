package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.SessionVO;

import java.util.List;

public interface StoreDao
{
    Integer insertStore(User store);

    Integer updateStore(User store);

    List<User> findStores();

    List<Role> findRolesByStore(SessionVO sessionVO);

    int updateUserById(User user);

    Integer deleteStore(User store);
}
