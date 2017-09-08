package com.dgg.store.filter;

import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.regex.RegExUtil;
import com.dgg.store.util.core.string.StringUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Key;
import java.util.Properties;

public class LoginFilter implements Filter
{
    private String[] excludedPageArray;
    private String[] staticFileArray;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException
    {
        ClassLoader classloader = Thread.currentThread().getContextClassLoader();
        Properties prop = new Properties();
        try
        {
            prop.load(classloader.getResourceAsStream("filter.ini"));
            excludedPageArray = prop.getProperty("excludedPages").split(",");
            staticFileArray = prop.getProperty("staticFiles").split(",");
        } catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException
    {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        String path = request.getServletPath();
        String token = request.getParameter(KeyConstant.TOKEN);
        String contentType = request.getHeader(KeyConstant.CONTENT_TYPE);
        if (contentType != null)
            contentType = contentType.split(SymbolConstant.SEMICOLON)[0];
        boolean tokenFlag = StringUtil.isEmpty(token) && (!Constant.MULTIPART_FORM_DATA.equals(contentType));

        for (String stFile : staticFileArray)
            if (path.endsWith(stFile))
            {
                filterChain.doFilter(request, response);
                return;
            }

        for (String page : excludedPageArray)
            if (RegExUtil.matcher(path, page))
            {   //判断是否在过滤url之外
                filterChain.doFilter(request, response);
                return;
            }

        if (session.getAttribute(Constant.LOGININFO) == null && tokenFlag)
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        else
            filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy()
    {
    }
}
