package com.dgg.store.mapper;

import com.dgg.store.util.pojo.Menu;
import com.dgg.store.util.vo.core.MenuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    int insert(Menu record);

    List<MenuVO> findMenus();

    List<MenuVO> findCustomerGroups(@Param("userId") String userId);
}