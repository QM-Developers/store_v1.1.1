package com.dgg.store.controller.common;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.service.common.LoginService;
import com.dgg.store.util.core.constant.Constant;
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

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Object Login(LoginVO loginVO)
    {
        return service.updateAndFindLoginUser(loginVO);
    }

    @RequestMapping(value = "/login_on_browser",method = RequestMethod.POST)
    @ResponseBody
    public Object storeLogin(HttpSession session, LoginVO loginVO)
    {
        Object obj = service.findUserByLogin(loginVO);
        Object status = new Object();

        if (obj != null)
        {   // 如果登录成功，就把用户数据存入 session
            session.setAttribute(Constant.LOGININFO,obj);
            status = 1;
        } else
        {   // 登录失败则返回 错误信息
            JSONObject json = new JSONObject();
            json.put("hint", "用户名或密码错误");
            status = json;
        }

        return status;
    }

}
