package com.dgg.store.dao.store;

import com.dgg.store.mapper.UserMapper;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StoreDaoImpl implements StoreDao
{
    @Autowired
    private UserMapper mapper;

    @Override
    public Integer insertStore(User store)
    {
        return mapper.insert(store);
    }

    @Override
    public Integer updateStore(User store)
    {
        return mapper.updateUserById(store);
    }

    @Override
    public List<User> findStores()
    {
        return mapper.findStores();
    }

    @Override
    public List<Role> findRolesByStore(SessionVO sessionVO)
    {
        return mapper.findRolesByStore(sessionVO);
    }

    @Override
    public int updateUserById(User user)
    {
        return mapper.updateUserById(user);
    }

    @Override
    public Integer deleteStore(User store)
    {
        return mapper.deleteUserById(store.getUserId());
    }
}
