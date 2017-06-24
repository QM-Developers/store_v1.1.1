package com.dgg.store.mapper;

import com.dgg.store.util.pojo.Role;

import java.util.List;

import com.dgg.store.util.vo.core.TreeVO;
import org.apache.ibatis.annotations.Param;

public interface RoleMapper
{

    List<TreeVO> findPermissionByRole(Role role);

    void cleanPermissions(@Param("roleId") String roleId);

    int insertPermissionToRole(@Param("roleId") String roleId, @Param("permissionId") String permissionId);

    int findHadPermission(@Param("roleId") String roleId, @Param("permissionUrl") String servletPath);

    Integer updateRole(Role role);

    Role findRoleById(@Param("roleId") Integer roleId);

    Integer insertRole(Role role);

    Integer deleteRole(@Param("roleId") Integer roleId);

    List<Role> findRoles();
}