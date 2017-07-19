package com.dgg.store.controller.common;

import com.dgg.store.service.common.RegisterService;
import com.dgg.store.util.core.constant.Constant;
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

@Controller
public class RegisterController
{
    @Autowired
    private RegisterService service;

    @RequestMapping(value = "insertCardFront", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertCardFront(@RequestParam(value = "cardFront", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCardFront(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    @RequestMapping(value = "insertCardBack", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertCardBack(@RequestParam(value = "cardBack", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCardBack(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    @RequestMapping(value = "insertCardHand", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertCardHand(@RequestParam(value = "cardHand", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCardHand(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    @RequestMapping(value = "registerGetVerify",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO getRegisterVerify(RegisterVO registerVO)
    {
        return service.getRegisterVerify(registerVO);
    }

    @RequestMapping(value ="registerVerify",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO registerVerify(RegisterVO registerVO)
    {
        return service.registerVerify(registerVO);
    }

    @RequestMapping(value = "register",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO register(HttpServletRequest request, RegisterVO registerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRegisterUser(sessionVO,registerVO);
    }

}
