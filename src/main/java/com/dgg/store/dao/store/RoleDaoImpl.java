package com.dgg.store.dao.store;

import com.dgg.store.mapper.RoleMapper;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.TreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RoleDaoImpl implements RoleDao
{
    @Autowired
    private RoleMapper mapper;

    @Override
    public List<TreeVO> findPermissionByRole(Role role)
    {
        return mapper.findPermissionByRole(role);
    }

    @Override
    public void cleanPermissions(String roleId)
    {
        mapper.cleanPermissions(roleId);
    }

    @Override
    public int insertPermissionInRole(String roleId, String permissionId)
    {
        return mapper.insertPermissionToRole(roleId,permissionId);
    }

    @Override
    public int findHadPermission(String roleId, String servletPath)
    {
        return mapper.findHadPermission(roleId,servletPath);
    }

    @Override
    public Integer updateRole(Role role)
    {
        return mapper.updateRole(role);
    }

    @Override
    public Role findRoleById(Integer roleId)
    {
        return mapper.findRoleById(roleId);
    }

    @Override
    public Integer insertRole(Role role)
    {
        return mapper.insertRole(role);
    }

    @Override
    public Integer deleteRole(Integer roleId)
    {
        return mapper.deleteRole(roleId);
    }

    @Override
    public List<Role> findRoles()
    {
        return mapper.findRoles();
    }
}
