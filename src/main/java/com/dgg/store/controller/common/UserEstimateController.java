package com.dgg.store.controller.common;

import com.dgg.store.service.common.UserEstimateService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.UserEstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserEstimateController
{
    @Autowired
    private UserEstimateService service;

    @RequestMapping(value = "user_addEstimate", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addEstimate(HttpServletRequest request,UserEstimateVO estimateVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertEstimate(sessionVO,estimateVO);
    }

    @RequestMapping(value = "user_findEstimate",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findEstimate(HttpServletRequest request,UserEstimateVO estimateVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findEstimate(sessionVO,estimateVO);
    }

    @RequestMapping(value = "user_addEnshrine",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addEnshrine(HttpServletRequest request, GoodsInfoVO goodsInfoVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertEnshrine(sessionVO,goodsInfoVO);
    }

    @RequestMapping(value = "user_deleteEnshrine",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deleteEnshrine(HttpServletRequest request,GoodsInfoVO goodsInfoVO)
    {
        SessionVO sessionVO = (SessionVO)request.getAttribute(Constant.LOGININFO);

        return service.deleteEnshrine(sessionVO,goodsInfoVO);
    }

    @RequestMapping(value = "user_findEnshrine",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findEnshrine(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findEnshrine(sessionVO);
    }
}
