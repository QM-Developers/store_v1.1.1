package com.dgg.store.controller.store;

import com.dgg.store.service.store.PermissionService;
import com.dgg.store.util.pojo.Permission;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.vo.core.TreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PermissionController
{
    @Autowired
    private PermissionService service;

    @RequestMapping(value = "/s/findPermissionTree",method = RequestMethod.POST)
    @ResponseBody
    public List<TreeVO> findPermissionTree(Role role)
    {
        return service.findPermissionTree(role);
    }

    @RequestMapping(value = "/s/addPermission",method = RequestMethod.POST)
    @ResponseBody
    public Integer addPermission(Permission permission)
    {
        return service.insert(permission);
    }

    @RequestMapping(value = "/s/exportPermissionToExcel",method = RequestMethod.GET)
    @ResponseBody
    public Integer exportPermissionToExcel()
    {
        return service.exportPermissionToExcel();
    }

    @RequestMapping(value = "/s/updatePermission",method = RequestMethod.POST)
    @ResponseBody
    public Integer updatePermission(Permission permission)
    {
        return service.updatePermission(permission);
    }

    @RequestMapping(value = "/s/deletePermission",method = RequestMethod.POST)
    @ResponseBody
    public Integer deletePermission(Permission permission)
    {
        return service.delete(permission);
    }


    @RequestMapping(value = "/s/findPermissionById",method = RequestMethod.POST)
    @ResponseBody
    public Object findPermissionById(Permission permission)
    {
        return service.findPermissionById(permission);
    }


}
