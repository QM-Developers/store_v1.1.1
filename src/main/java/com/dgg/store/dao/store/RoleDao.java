package com.dgg.store.dao.store;


import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.TreeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleDao
{

    List<TreeVO> findPermissionByRole(Role role);

    void cleanPermissions(@Param("roleId") String roleId);

    int insertPermissionInRole(String roleId, String permissionId);

    int findHadPermission(String roleId, String servletPath);

    Integer updateRole(Role role);

    Role findRoleById(Integer roleId);

    Integer insertRole(Role role);

    Integer deleteRole(Integer roleId);

    List<Role> findRoles();
}
