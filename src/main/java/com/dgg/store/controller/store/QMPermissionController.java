package com.dgg.store.controller.store;

import com.dgg.store.service.store.QMPermissionService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.permission.QMPermissionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class QMPermissionController
{
    @Autowired
    private QMPermissionService service;

    @RequestMapping(value = "/s/findQMPermissionTree",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findQMPermissionTree(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findQMPermissionTree(sessionVO);
    }

    @RequestMapping(value = "/s/addQMPermission",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addQMPermission(HttpServletRequest request, QMPermissionVO permission)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertQMPermission(sessionVO,permission);
    }

    @RequestMapping(value = "/s/updateQMPermission",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateQMPermission(HttpServletRequest request,QMPermissionVO permission)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateQMPermission(sessionVO,permission);
    }
}
