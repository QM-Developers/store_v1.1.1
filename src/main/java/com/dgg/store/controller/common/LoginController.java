package com.dgg.store.controller.common;

import com.dgg.store.service.common.LoginService;
import com.dgg.store.util.vo.core.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController
{
    @Autowired
    private LoginService service;

    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String Login(LoginVO loginVO)
    {
        return service.updateLoginInfo(loginVO);
    }

    @RequestMapping(value = "/login_on_browser", method = RequestMethod.POST)
    @ResponseBody
    public String storeLogin(HttpSession session, LoginVO loginVO)
    {
        return service.findUserByLogin(session, loginVO);
    }

}
