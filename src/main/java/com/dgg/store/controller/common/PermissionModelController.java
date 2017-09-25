package com.dgg.store.controller.common;

import com.dgg.store.service.common.PermissionModelService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class PermissionModelController
{
    @Autowired
    private PermissionModelService service;

    @RequestMapping(value = "/user_listPermissionModel", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listPermissionModel(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listPermissionModel(sessionVO);
    }
}
