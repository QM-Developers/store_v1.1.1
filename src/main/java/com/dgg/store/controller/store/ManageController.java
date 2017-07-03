package com.dgg.store.controller.store;

import com.dgg.store.service.store.ManageService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.LoginVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.manage.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ManageController
{
    @Autowired
    private ManageService service;

    @RequestMapping(value = "/s/login",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO login(HttpServletRequest request, LoginVO loginVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findLoginUser(sessionVO,loginVO);
    }

    @RequestMapping(value = "/s/findTeamAndMemberCount",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findTeamAndMemberCount(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findTeamAndMemberCount(sessionVO);
    }

    @RequestMapping(value = "/s/findMemberList",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findMemberList(HttpServletRequest request, MemberVO memberVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMemberList(sessionVO,memberVO);
    }
}
