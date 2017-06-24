package com.dgg.store.service.store;

import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.RelationVO;
import com.dgg.store.util.vo.core.TreeVO;

import java.util.List;

public interface RoleService
{
    List<Role> findRoles();

    Integer deleteRole(Role role);

    Integer insertRole(Role role);

    List<TreeVO> findPermissionByRole(Role role);

    Integer insertPermissionToRole(RelationVO relationVO);

    int findHadPermission(String roleId, String servletPath);

    Role findRoleById(Role role);

    Integer updateRole(Role role);
}
