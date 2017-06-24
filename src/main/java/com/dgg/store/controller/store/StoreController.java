package com.dgg.store.controller.store;

import com.dgg.store.service.store.StoreService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.Role;
import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.RelationVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class StoreController
{
    @Autowired
    private StoreService service;

    @RequestMapping(value = "/s/addStore",method = RequestMethod.POST)
    @ResponseBody
    public Integer addStore(User store)
    {
        return service.insertStore(store);
    }

    @RequestMapping(value = "/s/updateStore",method = RequestMethod.POST)
    @ResponseBody
    public Integer updateStore(User store)
    {
        return service.updateStore(store);
    }

    @RequestMapping(value = "/s/findStores",method = RequestMethod.POST)
    @ResponseBody
    public List<User> findStores()
    {
        return service.findStores();
    }

    @RequestMapping(value = "/s/findRolesByStore",method = RequestMethod.POST)
    @ResponseBody
    public List<Role> findRolesByStore(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
        return service.findRolesByStore(sessionVO);
    }

    @RequestMapping(value = "/s/addRoleToUser",method = RequestMethod.POST)
    @ResponseBody
    public Integer addRoleToUser(RelationVO relationVO)
    {
        return service.updateRoleToStore(relationVO);
    }

    @RequestMapping(value = "/s/deleteStore",method = RequestMethod.POST)
    @ResponseBody
    public Integer deleteStore(User store)
    {
        return service.deleteStore(store);
    }

}
