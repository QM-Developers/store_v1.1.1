package com.dgg.store.dao.store;


import com.dgg.store.util.pojo.Permission;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.TreeVO;

import java.util.List;

public interface PermissionDao
{
    List<TreeVO> findPermissionTree(Role role);

    void cleanPermissionRE(Permission permission);

    Integer insert(Permission permission);

    Integer updatePermission(Permission permission);

    Integer delete(String permissionId);

    Object findPermissionById(String permissionId);
}
