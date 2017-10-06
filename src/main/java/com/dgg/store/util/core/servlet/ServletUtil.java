package com.dgg.store.util.core.servlet;

import com.dgg.store.util.core.constant.SymbolConstant;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
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

    public static void printImage(HttpServletRequest request,HttpServletResponse response,String path)
    {
        BufferedImage buffImg = null;
        ServletOutputStream sos = null;
        try
        {
            File file = new File(path);
            if (!file.exists())
                return;
            buffImg = ImageIO.read(new FileInputStream(path));
            // 将四位数字的验证码保存到Session中。
            // 禁止图像缓存。
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType("image/jpeg");
            // 将图像输出到Servlet输出流中。
            sos = response.getOutputStream();
            ImageIO.write(buffImg, "jpeg", sos);
        } catch (IOException e)
        {
            e.printStackTrace();
        } finally
        {
            try
            {
                if (sos != null)
                    sos.close();
            } catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
}
