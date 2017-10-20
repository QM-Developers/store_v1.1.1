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

/**
 * 库存申请控制器
 */
@Controller
public class RepertoryApplyController
{
    @Autowired
    private RepertoryApplyService service;

    /**
     * 获取审批人列表
     *
     * @param request 用户参数
     * @return 审批人列表
     */
    @RequestMapping(value = "/s/listRepertoryChecker", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listRepertoryChecker(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryChecker(sessionVO);
    }

    /**
     * 发起申请
     *
     * @param request 用户参数
     * @param apply   申请参数
     * @return 申请的Id
     */
    @RequestMapping(value = "/s/saveRepertoryApply", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveRepertoryApply(HttpServletRequest request, RepertoryApply apply)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertRepertoryApply(sessionVO, apply);
    }

    /**
     * 申请人获取库存申请列表
     *
     * @param request 用户参数
     * @param pageVO  分页参数
     * @return 库存申请列表
     */
    @RequestMapping(value = "/s/listRepertoryApplyByProposer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listRepertoryApplyByProposer(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryApplyByProposer(sessionVO, pageVO);
    }

    /**
     * 审批人获取库存审批列表
     *
     * @param request 用户参数
     * @param apply   筛选条件
     * @param pageVO  分页参数
     * @return 库存申请列表
     */
    @RequestMapping(value = "/s/listRepertoryApplyByApprover", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listRepertoryApplyByApprover(HttpServletRequest request, RepertoryApply apply, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryApplyByApprover(sessionVO, apply, pageVO);
    }

    /**
     * 同意申请
     *
     * @param request 用户参数
     * @param apply   申请的Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateRepertoryApplyAccept", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRepertoryApplyAccept(HttpServletRequest request, RepertoryApply apply)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRepertoryApplyAccept(sessionVO, apply);
    }

    /**
     * 确认签收
     *
     * @param request 用户参数
     * @param apply   申请的Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateRepertoryApplyFinish", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateRepertoryApplyFinish(HttpServletRequest request, RepertoryApply apply)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRepertoryApplyFinish(sessionVO, apply);
    }

    /**
     * 获取库存审批详情
     *
     * @param request 用户参数
     * @param apply   申请的Id
     * @return 库存审批详情
     */
    @RequestMapping(value = "/s/getRepertoryApply", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getRepertoryApply(HttpServletRequest request, RepertoryApply apply)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getRepertoryApply(sessionVO, apply);
    }


}
