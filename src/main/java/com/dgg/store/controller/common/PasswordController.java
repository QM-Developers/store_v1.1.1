package com.dgg.store.controller.common;

import com.dgg.store.util.vo.core.ResultVO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

public class PasswordController
{
    @RequestMapping(value = "passwordVerify",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO passwordVerify(HttpServletRequest request)
    {
        return null;
    }
}
