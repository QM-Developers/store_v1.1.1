package com.dgg.store.controller.common;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.service.common.LoginService;
import com.dgg.store.util.core.LoggerUtil;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.LoginVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 用户登陆控制器
 */
@Controller
public class LoginController
{
    @Autowired
    private LoginService service;

    /**
     * 用户登录(手机端)
     *
     * @param loginVO 账号信息
     * @return 用户信息
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String Login(LoginVO loginVO)
    {
        return service.updateLoginInfo(loginVO);
    }

    /**
     * 用户登录
     *
     * @param session 保存登陆状态session
     * @param loginVO 账号信息
     * @return 登陆结果
     */
    @RequestMapping(value = "/login_on_browser", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String storeLogin(HttpSession session, LoginVO loginVO)
    {
        return service.findUserByLogin(session, loginVO);
    }

    /**
     * 用户登出
     *
     * @param session   保存登陆状态session
     * @param sessionVO 账号信息
     * @return 登出结果
     */
    @RequestMapping(value = "/logoutOnBrowser", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String logoutOnBrowser(SessionVO sessionVO, HttpSession session)
    {
        return service.logoutOnBrowser(sessionVO, session);
    }

}
