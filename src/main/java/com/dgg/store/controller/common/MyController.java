package com.dgg.store.controller.common;

import com.dgg.store.service.common.MyService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.MyAddressVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Hashtable;

@Controller
public class MyController
{
    @Autowired
    private MyService service;

    @RequestMapping(value = "user_findMyInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findMyInfo(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMyInfo(sessionVO);
    }

    @RequestMapping(value = "user_addMyAddress", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addMyAddress(HttpServletRequest request, MyAddressVO addressVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertMyAddress(sessionVO, addressVO);
    }

    @RequestMapping(value = "user_findMyAddress", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findMyAddress(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMyAddress(sessionVO);
    }

    @RequestMapping(value = "user_updateMyAddress", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateMyAddress(HttpServletRequest request, MyAddressVO addressVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateMyAddress(sessionVO, addressVO);
    }

    @RequestMapping(value = "user_deleteMyAddress", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deleteMyAddress(HttpServletRequest request, MyAddressVO addressVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteMyAddress(sessionVO, addressVO);
    }

    @RequestMapping(value = "user_uploadHeadPortrait", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO uploadHeadPortrait(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request)
    {

        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateUserImg(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    @RequestMapping(value = "user_findMyQRCode", method = RequestMethod.GET)
    @ResponseBody
    public void findMyQRCode(HttpServletRequest request, HttpServletResponse response)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
        String keycode = sessionVO.getUserId();
        ServletOutputStream out = null;

        if (keycode != null && !"".equals(keycode))
        {
            try
            {
                int size = 300;
                out = response.getOutputStream();
                Hashtable hints = new Hashtable();
                hints.put(EncodeHintType.CHARACTER_SET, "utf-8");   // 编码
                hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);    // 容错率
                hints.put(EncodeHintType.MARGIN, 0);    // 边框宽度
                QRCodeWriter writer = new QRCodeWriter();
                BitMatrix m = writer.encode(keycode, BarcodeFormat.QR_CODE, size, size, hints);
                MatrixToImageWriter.writeToStream(m, "png", out);
            } catch (IOException e)
            {
                e.printStackTrace();
            } catch (WriterException e)
            {
                e.printStackTrace();
            } finally
            {
                if (out != null)
                {
                    try
                    {
                        out.flush();
                        out.close();
                    } catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}