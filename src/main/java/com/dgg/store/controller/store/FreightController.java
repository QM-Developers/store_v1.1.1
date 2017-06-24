package com.dgg.store.controller.store;

import com.dgg.store.service.store.FreightService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.TemplateOfFreightVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FreightController
{
    @Autowired
    private FreightService service;

    @RequestMapping(value = "/s/addFreightTemp",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addFreightTemp(HttpServletRequest request, TemplateOfFreightVO freight)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertFreightTemp(sessionVO,freight);
    }

    @RequestMapping(value = "/s/findFreightTemps",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findFreightTemps(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findFreightTemps(sessionVO);
    }

    @RequestMapping(value = "/s/findFreight",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findFreight(HttpServletRequest request,TemplateOfFreightVO freight)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findFreight(sessionVO,freight);
    }

    @RequestMapping(value = "/s/deleteFreightTemp",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deleteFreightTemp(HttpServletRequest request,TemplateOfFreightVO freight)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteFreightTemp(sessionVO,freight);
    }

}
