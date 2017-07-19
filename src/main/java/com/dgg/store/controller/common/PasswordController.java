package com.dgg.store.controller.common;

import com.dgg.store.service.common.PasswordService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.password.PasswordVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PasswordController
{
    @Autowired
    private PasswordService service;

    @RequestMapping(value = "retrieveGetPasswordVerify",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO getPasswordVerify(PasswordVO passwordVO)
    {
        return service.getPasswordVerify(passwordVO);
    }

    @RequestMapping(value = "retrievePasswordVerify",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO passwordVerify(PasswordVO passwordVO)
    {
        return service.passwordVerify(passwordVO);
    }

    @RequestMapping(value = "updatePassword",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updatePassword(HttpServletRequest request,PasswordVO passwordVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updatePassword(sessionVO,passwordVO);
    }
}
