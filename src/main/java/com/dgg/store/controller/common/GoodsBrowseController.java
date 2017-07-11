package com.dgg.store.controller.common;

import com.dgg.store.service.common.GoodsBrowseService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class GoodsBrowseController
{
    @Autowired
    private GoodsBrowseService service;

    @RequestMapping(value = "/user_findGoodsType",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findGoodsType(HttpServletRequest request, GoodsTypeVO goodsTypeVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsType(sessionVO,goodsTypeVO);
    }

    @RequestMapping(value = "user_findGoodsList",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findGoodsList(HttpServletRequest request,GoodsTypeVO goodsTypeVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsList(sessionVO,goodsTypeVO);
    }

    @RequestMapping(value = "user_findGoodsDetail",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findGoodsDetail(HttpServletRequest request,GoodsDetailVO goodsDetailVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsDetail(sessionVO,goodsDetailVO);
    }

    @RequestMapping(value = "user_findGoodsDescribe",method = RequestMethod.GET)
    public String findGoodsDescribe(HttpServletRequest request,String goodsId)
    {
        request.setAttribute("images",service.findGoodsDescribe(goodsId));

        return "pages/mall/goods/backup/innerView";
    }

    @RequestMapping(value = "user_findGoodsStandard",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findGoodsStandard(HttpServletRequest request, GoodsStandard standard)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findGoodsStandard(sessionVO,standard);
    }
}
