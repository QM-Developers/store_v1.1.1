package com.dgg.store.dao.store;

import com.dgg.store.mapper.PermissionMapper;
import com.dgg.store.util.pojo.Permission;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.TreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PermissionDaoImpl implements PermissionDao
{
    @Autowired
    private PermissionMapper mapper;

    @Override
    public List<TreeVO> findPermissionTree(Role role)
    {
        return mapper.findPermissionTree(role);
    }

    @Override
    public void cleanPermissionRE(Permission permission)
    {
        mapper.cleanPermissionRE(permission);
    }

    @Override
    public Integer insert(Permission permission)
    {
        return mapper.insert(permission);
    }

    @Override
    public Integer updatePermission(Permission permission)
    {
        return mapper.updatePermission(permission);
    }

    @Override
    public Integer delete(String permissionId)
    {
        return mapper.delete(permissionId);
    }

    @Override
    public Object findPermissionById(String permissionId)
    {
        return mapper.findPermissionById(permissionId);
    }
}
