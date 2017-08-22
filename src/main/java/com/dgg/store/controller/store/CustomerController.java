package com.dgg.store.controller.store;

import com.dgg.store.service.store.CustomerService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.vo.CustomerVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.IOException;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class CustomerController
{
    @Autowired
    private CustomerService service;

    @RequestMapping(value = "/s/saveCustomerRecord", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveCustomerRecord(CustomerVO customerVO, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCustomerRecord(customerVO, sessionVO);
    }

    @RequestMapping(value = "/s/listCustomer", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCustomer(HttpServletRequest request, PageVO pageVO, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCustomer(sessionVO, pageVO, customerVO);
    }

    @RequestMapping(value = "/s/updateCustomer", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomer(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomer(sessionVO, customerVO);
    }

    @RequestMapping(value = "/s/getCustomer", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getCustomer(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getCustomer(sessionVO, customerVO);
    }

    @RequestMapping(value = "/s/saveFrontImage", method = POST)
    @ResponseBody
    public String saveFrontImage(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertFrontImage(sessionVO, file, request.getSession().getServletContext().getRealPath(SymbolConstant.SLASH), customerVO);
    }

    @RequestMapping(value = "/s/getCustomerIDCard", method = GET)
    public void getCustomerIDCard(HttpServletRequest request, HttpServletResponse response)
    {
        BufferedImage buffImg = null;
        ServletOutputStream sos = null;
        try
        {
            String path = request.getSession().getServletContext().getRealPath(SymbolConstant.SLASH) + SymbolConstant.SLASH + request.getParameter("path");
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
                sos.close();
            } catch (IOException e)
            {
                e.printStackTrace();
            }
        }

    }

    @RequestMapping(value = "/s/saveBackImage", method = POST)
    @ResponseBody
    public String saveBackImage(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertBackImage(sessionVO, file, request.getSession().getServletContext().getRealPath(SymbolConstant.SLASH), customerVO);
    }

    @RequestMapping(value = "/s/saveHandImage", method = POST)
    @ResponseBody
    public String saveHandImage(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertHandImage(sessionVO, file, request.getSession().getServletContext().getRealPath(SymbolConstant.SLASH), customerVO);
    }
}