package com.dgg.store.exception.resolver;

import com.dgg.store.util.core.LoggerUtil;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyExceptionHandler implements HandlerExceptionResolver
{
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object o, Exception e)
    {
        LoggerUtil.error(request.getRequestURI(), o.getClass(), e);

        return null;
    }
}
