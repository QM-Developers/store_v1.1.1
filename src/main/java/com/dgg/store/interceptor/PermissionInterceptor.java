package com.dgg.store.interceptor;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.service.store.RoleService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.servlet.ServletUtil;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PermissionInterceptor implements HandlerInterceptor
{
    @Autowired
    private RoleService service;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        boolean flag = service.countPermission(sessionVO, request.getServletPath());

        if (!flag)
            ServletUtil.printData(response, JSONObject.toJSONString(new ResultVO(Constant.REQUEST_NOT_PERMISSION)));

        return flag;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception
    {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception
    {

    }
}
