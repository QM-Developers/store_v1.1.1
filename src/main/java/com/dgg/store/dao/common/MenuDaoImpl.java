package com.dgg.store.dao.common;

import com.dgg.store.mapper.MenuMapper;
import com.dgg.store.util.vo.MenuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MenuDaoImpl implements MenuDao
{
    @Autowired
    private MenuMapper mapper;

    @Override
    public List<MenuVO> findMenus()
    {
        return mapper.findMenus();
    }

    @Override
    public List<MenuVO> findCustomerGroups(String userId)
    {
        return mapper.findCustomerGroups(userId);
    }
}
