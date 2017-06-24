package com.dgg.store.service.store;


import com.dgg.store.dao.store.RoleDao;
import com.dgg.store.util.core.zTree.TreeUtil;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.RelationVO;
import com.dgg.store.util.vo.core.TreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService
{
    @Autowired
    private RoleDao dao;

    @Override
    public List<Role> findRoles()
    {
        List<Role> result = dao.findRoles();

        return result;
    }

    @Override
    public Integer deleteRole(Role role)
    {
        return dao.deleteRole(role.getRoleId());
    }

    @Override
    public Integer insertRole(Role role)
    {
        return dao.insertRole(role);
    }

    @Override
    public List<TreeVO> findPermissionByRole(Role role)
    {
        List<TreeVO> result = dao.findPermissionByRole(null);
        List<TreeVO> hadPermissions = dao.findPermissionByRole(role);
        result = TreeUtil.setStatus(result,hadPermissions);
        result = TreeUtil.addChild(result,"0");

        return result;
    }

    @Override
    public Integer insertPermissionToRole(RelationVO relationVO)
    {
        String[] permissionIdArray = relationVO.getMultiId().split(",");
        String roleId = relationVO.getSingleId();
        dao.cleanPermissions(roleId);
        int result = 1;

        for (String permissionId : permissionIdArray)
            if((result = dao.insertPermissionInRole(roleId,permissionId)) == 0)
                throw new RuntimeException();

        return result;
    }

    @Override
    public int findHadPermission(String roleId, String servletPath)
    {
        return dao.findHadPermission(roleId,servletPath);
    }

    @Override
    public Role findRoleById(Role role)
    {
        return dao.findRoleById(role.getRoleId());
    }

    @Override
    public Integer updateRole(Role role)
    {
        return dao.updateRole(role);
    }
}
