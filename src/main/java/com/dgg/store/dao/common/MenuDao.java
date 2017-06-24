package com.dgg.store.dao.common;

import com.dgg.store.util.vo.MenuVO;

import java.util.List;

public interface MenuDao
{
    List<MenuVO> findMenus();

    List<MenuVO> findCustomerGroups(String userId);
}
