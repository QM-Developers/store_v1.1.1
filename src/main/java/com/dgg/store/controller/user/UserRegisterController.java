package com.dgg.store.controller.user;


import com.dgg.store.service.user.UserRegisterService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.User;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserRegisterController
{
    @Autowired
    private UserRegisterService service;

    @RequestMapping(value = "user_register", method = RequestMethod.POST)
    @ResponseBody
    public Object register(HttpServletRequest request, User user)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateUserStatus(sessionVO, user);
    }

    @RequestMapping(value = "user_checkUserByPhone", method = RequestMethod.POST)
    @ResponseBody
    public Object checkUserByPhone(HttpServletRequest request, User user)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findUserStatus(sessionVO, user);
    }

}
