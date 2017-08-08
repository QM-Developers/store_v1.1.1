package com.dgg.store.service.store;


import com.dgg.store.util.pojo.Permission;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.TreeVO;

import java.util.List;

public interface PermissionService
{
    List<TreeVO> findPermissionTree(Role role);

    Integer insert(Permission permission);

    Integer updatePermission(Permission permission);

    Integer delete(Permission permission);

    Object findPermissionById(Permission permission);

    Integer exportPermissionToExcel();
}
