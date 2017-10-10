package com.dgg.store.controller.common;

import com.dgg.store.service.common.MyOrderProofService;
import com.dgg.store.util.core.FilePathUtil;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.RequestConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.servlet.ServletUtil;
import com.dgg.store.util.pojo.MyOrderProof;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

/**
 * 订单凭证控制器
 */
@Controller
public class MyOrderProofController
{
    private final MyOrderProofService service;

    public MyOrderProofController(MyOrderProofService service)
    {
        this.service = service;
    }


    /**
     * 添加订单凭证
     *
     * @param request 当前用户信息
     * @param proof   订单Id
     * @param file    凭证文件
     * @return 操作结果+凭证Id
     */
    @RequestMapping(value = "user_saveOrderProof", method = POST, produces = {RequestConstant.CONTENT_TYPE})
    @ResponseBody
    public String save(HttpServletRequest request, MyOrderProof proof, @RequestParam(value = "img", required = false) MultipartFile file)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.save(sessionVO, request.getSession().getServletContext().getRealPath(SymbolConstant.SYSTEM_SLASH), proof, file);
    }

    /**
     * 获取订单凭证列表
     *
     * @param request 当前用户信息
     * @param proof   订单Id
     * @param pageVO  分页参数
     * @return 订单凭证列表
     */
    @RequestMapping(value = "user_listOrderProof", method = POST, produces = {RequestConstant.CONTENT_TYPE})
    @ResponseBody
    public String list(HttpServletRequest request, MyOrderProof proof, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.list(sessionVO, proof, pageVO);
    }

    /**
     * 删除订单凭证
     *
     * @param request 当前用户信息
     * @param proof   凭证Id
     * @return 操作结果
     */
    @RequestMapping(value = "user_removeOrderProof", method = POST, produces = {RequestConstant.CONTENT_TYPE})
    @ResponseBody
    public String remove(HttpServletRequest request, MyOrderProof proof)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.remove(sessionVO, proof);
    }

    /**
     * 获取凭证图片
     *
     * @param request 当前用户信息
     * @param proof   图片路径
     */
    @RequestMapping(value = "user_getProofImage", method = GET, produces = {RequestConstant.CONTENT_TYPE})
    public void getProofImage(HttpServletRequest request, HttpServletResponse response, MyOrderProof proof)
    {
        String path = FilePathUtil.getPrevPath(request.getSession().getServletContext().getRealPath(SymbolConstant.SYSTEM_SLASH), Constant.PATH_LEVEL) + proof.getProofUrl();
        ServletUtil.printImage(request, response, path);
    }
}
