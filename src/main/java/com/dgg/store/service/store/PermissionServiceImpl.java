package com.dgg.store.service.store;

import com.dgg.store.dao.store.PermissionDao;
import com.dgg.store.util.core.zTree.TreeUtil;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.pojo.Permission;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.TreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImpl implements PermissionService
{
    @Autowired
    private PermissionDao dao;

    @Override
    public List<TreeVO> findPermissionTree(Role role)
    {
        List<TreeVO> result = TreeUtil.addChild(dao.findPermissionTree(role), "0");

        return result;
    }

    @Override
    public Integer insert(Permission permission)
    {
        permission.setPermissionId(IDGenerator.generator());
        if (permission.getPermissionPid() == null || "".equals(permission.getPermissionPid()))
            permission.setPermissionPid("0");

        return dao.insert(permission);
    }

    @Override
    public Integer updatePermission(Permission permission)
    {
        if (permission.getPermissionPid() == null || "".equals(permission.getPermissionPid()))
            permission.setPermissionPid("0");

        return dao.updatePermission(permission);
    }

    @Override
    public Integer delete(Permission permission)
    {
        dao.cleanPermissionRE(permission);

        return dao.delete(permission.getPermissionId());
    }

    @Override
    public Object findPermissionById(Permission permission)
    {
        return dao.findPermissionById(permission.getPermissionId());
    }
}
