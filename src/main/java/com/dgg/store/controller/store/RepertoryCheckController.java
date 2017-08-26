package com.dgg.store.controller.store;

import com.dgg.store.service.store.RepertoryCheckService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RepertoryCheckController
{
    @Autowired
    private RepertoryCheckService service;

    @RequestMapping(value = "/s/listRepertoryFirst", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listRepertoryFirst(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryFirst(sessionVO, pageVO);
    }

    @RequestMapping(value = "/s/getRepertory", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getRepertory(HttpServletRequest request,PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getRepertory(sessionVO,pageVO);
    }


}
