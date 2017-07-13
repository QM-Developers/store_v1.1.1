package com.dgg.store.dao.common;

import com.dgg.store.util.vo.core.MenuVO;

import java.util.List;

public interface MenuDao
{
    List<MenuVO> findMenus();

    List<MenuVO> findCustomerGroups(String userId);
}
