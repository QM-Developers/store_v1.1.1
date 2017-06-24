package com.dgg.store.service.store;

import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.RelationVO;
import com.dgg.store.util.vo.core.SessionVO;

import java.util.List;

public interface StoreService
{
    Integer insertStore(User store);

    Integer updateStore(User store);

    List<User> findStores();

    List<Role> findRolesByStore(SessionVO sessionVO);

    Integer updateRoleToStore(RelationVO relationVO);

    Integer deleteStore(User store);
}
