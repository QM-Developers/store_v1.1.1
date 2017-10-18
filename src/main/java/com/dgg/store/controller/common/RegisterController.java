package com.dgg.store.controller.common;

import com.dgg.store.service.common.RegisterService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.RequestConstant;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.register.RegisterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户注册控制器
 */
@Controller
public class RegisterController
{
    @Autowired
    private RegisterService service;

    /**
     * 上传身份证正面照
     *
     * @param file    图片文件
     * @param request 用户参数
     * @return 图片的物理地址
     */
    @RequestMapping(value = "insertCardFront", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertCardFront(@RequestParam(value = "cardFront", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCardFront(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    /**
     * 上传身份证背面照
     *
     * @param file    图片文件
     * @param request 用户参数
     * @return 图片的物理地址
     */
    @RequestMapping(value = "insertCardBack", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertCardBack(@RequestParam(value = "cardBack", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCardBack(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    /**
     * 上传手持身份证照
     *
     * @param file    图片文件
     * @param request 用户参数
     * @return 图片的物理地址
     */
    @RequestMapping(value = "insertCardHand", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertCardHand(@RequestParam(value = "cardHand", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCardHand(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    /**
     * 获取验证码
     *
     * @param registerVO 用户信息
     * @return 操作的结果
     */
    @RequestMapping(value = "registerGetVerify", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO getRegisterVerify(RegisterVO registerVO)
    {
        return service.getRegisterVerify(registerVO);
    }

    /**
     * 验证短信验证码
     *
     * @param registerVO 验证码
     * @return 操作的结果
     */
    @RequestMapping(value = "registerVerify", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO registerVerify(RegisterVO registerVO)
    {
        return service.registerVerify(registerVO);
    }

    /**
     * 发起激活
     *
     * @param request    用户信息
     * @param registerVO 用户信息
     * @return 用户详细信息
     */
    @RequestMapping(value = "register", method = RequestMethod.POST, produces = {RequestConstant.CONTENT_TYPE})
    @ResponseBody
    public String register(HttpServletRequest request, RegisterVO registerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRegisterUser(sessionVO, registerVO);
    }

}
