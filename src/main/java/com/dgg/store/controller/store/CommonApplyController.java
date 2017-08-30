package com.dgg.store.controller.store;

import com.dgg.store.service.store.CommonApplyService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.pojo.CommonApply;
import com.dgg.store.util.pojo.CommonApplyApprove;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class CommonApplyController
{
    @Autowired
    private CommonApplyService service;

    @RequestMapping(value = "/s/saveCommonApplyImage", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveCommonApplyImage(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCommonApplyImage(sessionVO, file, request.getSession().getServletContext().getRealPath(SymbolConstant.SLASH));
    }

    @RequestMapping(value = "/s/saveCommonApply", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveCommonApply(HttpServletRequest request, CommonApply apply)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCommonApply(sessionVO, apply);
    }

    @RequestMapping(value = "/s/listCommonApplyByProposer", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCommonApplyByProposer(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCommonApplyByProposer(sessionVO, pageVO);
    }

    @RequestMapping(value = "/s/listCommonApplyByApprove", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCommonApplyByApprove(HttpServletRequest request,PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCommonApplyByApprove(sessionVO, pageVO);
    }

    @RequestMapping(value = "/s/updateCommonApplyAccept", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCommonApplyAccept(HttpServletRequest request,CommonApplyApprove approve)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCommonApplyAccept(sessionVO, approve);
    }

    @RequestMapping(value = "/s/updateCommonApplyRefuse", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCommonApplyRefuse(HttpServletRequest request,CommonApplyApprove approve)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCommonApplyRefuse(sessionVO, approve);
    }
}
