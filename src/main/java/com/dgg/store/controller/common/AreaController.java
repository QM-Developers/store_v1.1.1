package com.dgg.store.controller.common;

import com.dgg.store.service.common.AreaService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AreaController
{
    @Autowired
    private AreaService service;

    @RequestMapping(value = "user_findAreaByPid",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findAreaByPid(HttpServletRequest request,String pid)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findAreaByPid(sessionVO,pid);
    }

    @RequestMapping(value = "user_findAllArea")
    @ResponseBody
    public ResultVO findAllArea(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findAllArea(sessionVO);
    }
}
