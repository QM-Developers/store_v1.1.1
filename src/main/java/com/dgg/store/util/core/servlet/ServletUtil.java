package com.dgg.store.util.core.servlet;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ServletUtil
{
    public static final void printData(HttpServletResponse response, Object data)
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = null;
        try
        {
            out = response.getWriter();
            out.print(data);
        }catch (IOException e)
        {
            e.printStackTrace();
        }finally
        {
            out.flush();
            out.close();
        }
    }
}
