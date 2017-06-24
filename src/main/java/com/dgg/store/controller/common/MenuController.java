package com.dgg.store.controller.common;

import com.dgg.store.service.common.MenuService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MenuController
{
    @Autowired
    private MenuService service;

    @RequestMapping(value = "user_findMenus")
    @ResponseBody
    public ResultVO findMenus(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMenus(sessionVO);
    }
}
