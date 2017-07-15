package com.dgg.store.controller.store;

import com.dgg.store.service.store.GoodsManageService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
public class GoodsManageController
{
    @Autowired
    private GoodsManageService service;

    @RequestMapping(value = "/s/findTypeAndParents",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findTypeAndParents(HttpServletRequest request,GoodsTypeinfo typeinfo)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findTypeAndParents(sessionVO,typeinfo);
    }

    @RequestMapping(value = "/s/findTypeAttr")
    @ResponseBody
    public ResultVO findTypeAttr(HttpServletRequest request, GoodsTypeAttr typeAttr)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findTypeAttr(sessionVO,typeAttr);
    }

    @RequestMapping(value = "/s/uploadToImgSpace",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO uploadToImgSpace(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertImgToSpace(sessionVO,file,request.getSession().getServletContext().getRealPath("/"));
    }

    @RequestMapping(value = "/s/goodsRelease",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO goodsRelease(HttpServletRequest request,GoodsInfoVO goodsinfo)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertGoodsinfo(sessionVO,goodsinfo);
    }

    @RequestMapping(value = "/s/saveGoodsDraft",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO saveGoodsDraft(HttpServletRequest request,GoodsInfoVO goodsinfo)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertGoodsinfo(sessionVO,goodsinfo);
    }

    @RequestMapping(value = "/s/findImages",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findImages(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findImages(sessionVO);
    }

    @RequestMapping(value = "/s/findGoodsList",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findGoodsList(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsList(sessionVO);
    }

    @RequestMapping(value = "/s/findGoodsInfo",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findGoodsInfo(HttpServletRequest request,GoodsInfoVO infoVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsInfo(sessionVO,infoVO);
    }
}
