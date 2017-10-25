package com.dgg.store.controller.store;

import com.dgg.store.service.store.CustomerAssistService;
import com.dgg.store.util.core.FilePathUtil;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.RequestConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.servlet.ServletUtil;
import com.dgg.store.util.pojo.CustomerAssist;
import com.dgg.store.util.pojo.CustomerAssistUser;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

/**
 * 客户协助控制器
 */
@Controller
public class CustomerAssistController
{
    @Autowired
    private CustomerAssistService service;

    /**
     * 添加协助申请
     *
     * @param request 用户参数
     * @param assist  申请的参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/saveCustomerAssist", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveCustomerAssist(HttpServletRequest request, CustomerAssist assist)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCustomerAssist(sessionVO, assist);
    }

    /**
     * 申请者获取协助列表
     *
     * @param request 用户参数
     * @param pageVO  分页参数
     * @return 申请协助列表
     */
    @RequestMapping(value = "/s/listCustomerAssistByProposer", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCustomerAssistByProposer(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCustomerAssistByProposer(sessionVO, pageVO);
    }

    /**
     * 协助者获取协助列表
     *
     * @param request 用户参数
     * @param assist  筛选条件
     * @param pageVO  分页参数
     * @return 申请协助列表
     */
    @RequestMapping(value = "/s/listCustomerAssistByHelper", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCustomerAssistByHelper(HttpServletRequest request, CustomerAssist assist, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCustomerAssistByHelper(sessionVO, assist, pageVO);
    }

    /**
     * 获取申请详情
     *
     * @param request 用户参数
     * @param assist  申请的Id
     * @return 申请详情
     */
    @RequestMapping(value = "/s/getCustomerAssist", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getCustomerAssist(HttpServletRequest request, CustomerAssist assist)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getCustomerAssist(sessionVO, assist);
    }

    /**
     * 协助者更新协助结果
     *
     * @param request    用户参数
     * @param assistUser 协助的参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCustomerAssistResult", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomerAssistResult(HttpServletRequest request, CustomerAssistUser assistUser)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomerAssistResult(sessionVO, assistUser);
    }

    /**
     * 上传证明图片
     *
     * @param file    图片文件
     * @param request 用户参数
     * @param assist  申请的Id
     * @return 图片的Id
     */
    @RequestMapping(value = "/s/saveAssistImage", method = POST)
    @ResponseBody
    public String saveAssistImage(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request, CustomerAssist assist)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertAssistImage(sessionVO, file, request.getSession().getServletContext().getRealPath(SymbolConstant.SYSTEM_SLASH), assist);
    }

}
