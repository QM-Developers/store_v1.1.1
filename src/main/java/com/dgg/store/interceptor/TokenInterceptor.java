package com.dgg.store.interceptor;


import com.dgg.store.service.user.UserService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.token.TokenUtil;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TokenInterceptor implements HandlerInterceptor
{
    @Autowired
    private UserService service;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        String userId = request.getParameter("userId");
        String teamId = request.getParameter("myTeamId");
        String token = request.getParameter("token");

        HttpSession session = request.getSession();
        SessionVO sessionVO = (SessionVO) session.getAttribute(Constant.LOGININFO);

        if (sessionVO == null)
        {
            sessionVO = service.findUserSessionVOById(userId);
            sessionVO.setMyTeamId(teamId);
            if (sessionVO.getToken().equals(token))
            {
                token = TokenUtil.getToken();
//                service.updateUserById(sessionVO.getUserId(),token);
                sessionVO.setToken(token);
            }
        }

//        service.updateLastLoginTimeById(userId == null?sessionVO.getUserId():userId);
        request.setAttribute(Constant.LOGININFO, sessionVO);

        return true;
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
