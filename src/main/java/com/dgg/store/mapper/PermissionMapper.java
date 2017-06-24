package com.dgg.store.mapper;

import com.dgg.store.util.pojo.Permission;

import java.util.List;

import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.TreeVO;
import org.apache.ibatis.annotations.Param;

public interface PermissionMapper
{
    List<TreeVO> findPermissionTree(Role role);

    void cleanPermissionRE(Permission permission);

    Integer insert(Permission permission);

    Integer updatePermission(Permission permission);

    Integer delete(@Param("permissionId") String permissionId);

    Object findPermissionById(@Param("permissionId")String permissionId);
}