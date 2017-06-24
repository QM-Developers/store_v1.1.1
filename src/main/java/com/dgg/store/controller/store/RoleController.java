package com.dgg.store.controller.store;

import com.dgg.store.service.store.RoleService;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.RelationVO;
import com.dgg.store.util.vo.core.TreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class RoleController
{
    @Autowired
    private RoleService service;

    @RequestMapping(value = "/s/findRoles",method = RequestMethod.POST)
    @ResponseBody
    public List<Role> findRoles()
    {
        return service.findRoles();
    }

    @RequestMapping(value = "/s/deleteRole",method = RequestMethod.POST)
    @ResponseBody
    public Integer deleteRole(Role role)
    {
        return service.deleteRole(role);
    }

    @RequestMapping(value = "/s/findPermissionByRole",method = RequestMethod.POST)
    @ResponseBody
    public List<TreeVO> findPermissionByRole(Role role)
    {
        return service.findPermissionByRole(role);
    }

    @RequestMapping(value = "/s/addRole",method = RequestMethod.POST)
    @ResponseBody
    public Integer addRole(Role role)
    {
        return service.insertRole(role);
    }

    @RequestMapping(value = "/s/addPermissionInRole",method = RequestMethod.POST)
    @ResponseBody
    public Integer addPermissionInRole(RelationVO relationVO)
    {
        return service.insertPermissionToRole(relationVO);
    }

    @RequestMapping(value = "/s/findRoleById")
    @ResponseBody
    public Role findRoleById(Role role)
    {
        return service.findRoleById(role);
    }

    @RequestMapping(value = "/s/updateRole",method = RequestMethod.POST)
    @ResponseBody
    public Integer updateRole(Role role)
    {
        return service.updateRole(role);
    }
}
