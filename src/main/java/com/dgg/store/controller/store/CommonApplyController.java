package com.dgg.store.controller.store;

import com.dgg.store.service.store.CommonApplyService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.RequestConstant;
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

/**
 * 通用 申请/审批 控制器
 */
@Controller
public class CommonApplyController
{
    @Autowired
    private CommonApplyService service;

    /**
     * 上传申请用图片
     *
     * @param file    图片文件
     * @param request 用户参数
     * @return 图片的Id
     */
    @RequestMapping(value = "/s/saveCommonApplyImage", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveCommonApplyImage(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCommonApplyImage(sessionVO, file, request.getSession().getServletContext().getRealPath(SymbolConstant.SYSTEM_SLASH));
    }

    /**
     * 发起通用申请
     *
     * @param request 用户参数
     * @param apply   通用申请参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/saveCommonApply", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveCommonApply(HttpServletRequest request, CommonApply apply)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCommonApply(sessionVO, apply);
    }

    /**
     * 发起人获取申请列表
     *
     * @param request 用户参数
     * @param apply   筛选条件
     * @param pageVO  分页参数
     * @return 申请列表
     */
    @RequestMapping(value = "/s/listCommonApplyByProposer", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCommonApplyByProposer(HttpServletRequest request, CommonApply apply, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCommonApplyByProposer(sessionVO, apply, pageVO);
    }

    /**
     * 审批人获取申请列表
     *
     * @param request 用户参数
     * @param apply   筛选条件
     * @param pageVO  分页参数
     * @return 申请列表
     */
    @RequestMapping(value = "/s/listCommonApplyByApprove", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCommonApplyByApprove(HttpServletRequest request, CommonApply apply, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCommonApplyByApprove(sessionVO, apply, pageVO);
    }

    /**
     * 获取申请详情
     *
     * @param request 用户参数
     * @param apply   申请Id
     * @return 申请详情
     */
    @RequestMapping(value = "/s/getCommonApply", method = POST, produces = RequestConstant.CONTENT_TYPE)
    @ResponseBody
    public String getCommonApply(HttpServletRequest request, CommonApply apply)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getCommonApply(sessionVO, apply);
    }

    /**
     * 同意申请
     *
     * @param request 用户参数
     * @param approve 审批参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCommonApplyAccept", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCommonApplyAccept(HttpServletRequest request, CommonApplyApprove approve)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCommonApplyAccept(sessionVO, approve);
    }

    /**
     * 拒绝申请
     *
     * @param request 用户参数
     * @param approve 审批参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCommonApplyRefuse", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCommonApplyRefuse(HttpServletRequest request, CommonApplyApprove approve)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCommonApplyRefuse(sessionVO, approve);
    }
}
