package com.dgg.store.controller.store;

import com.dgg.store.service.store.RepertoryApplyService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.RepertoryApply;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RepertoryApplyController
{
    @Autowired
    private RepertoryApplyService service;

    @RequestMapping(value = "/s/listRepertoryChecker", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listRepertoryChecker(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryChecker(sessionVO);
    }

    @RequestMapping(value = "/s/saveRepertoryApply", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveRepertoryApply(HttpServletRequest request, RepertoryApply apply)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertRepertoryApply(sessionVO,apply);
    }

    @RequestMapping(value = "/s/listRepertoryApplyByProposer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listRepertoryApplyByProposer(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryApplyByProposer(sessionVO,pageVO);
    }

    @RequestMapping(value = "/s/listRepertoryApplyByApprover", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listRepertoryApplyByApprover(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryApplyByApprover(sessionVO,pageVO);
    }

    @RequestMapping(value = "/s/updateRepertoryApplyAccept", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRepertoryApplyAccept(HttpServletRequest request,RepertoryApply apply)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRepertoryApplyAccept(sessionVO,apply);
    }

    @RequestMapping(value = "/s/updateRepertoryApplyFinish", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRepertoryApplyFinish(HttpServletRequest request,RepertoryApply apply)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRepertoryApplyFinish(sessionVO,apply);
    }
}
