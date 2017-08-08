package com.dgg.store.controller.common;

import com.dgg.store.service.common.ShoppingCarService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.ShoppingAddress;
import com.dgg.store.util.pojo.ShoppingCar;
import com.dgg.store.util.vo.goods.MyOrderVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ShoppingCarController
{
    @Autowired
    private ShoppingCarService service;

    @RequestMapping(value = "user_saveGoodsToCar", method = RequestMethod.POST)
    @ResponseBody
    public String saveGoodsToCar(HttpServletRequest request, ShoppingCar shoppingCar)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertGoodsToCar(sessionVO, shoppingCar);
    }

    @RequestMapping(value = "user_deleteGoodsInCar", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deleteGoodsInCar(HttpServletRequest request, ShoppingCar shoppingCar)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteGoodsInCar(sessionVO, shoppingCar);
    }

    @RequestMapping(value = "user_findDefaultAddress", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDefaultAddress(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDefaultAddress(sessionVO);
    }

    @RequestMapping(value = "user_findShoppingAddresses",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findShoppingAddresses(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findShoppingAddresses(sessionVO);
    }

    @RequestMapping(value = "user_findShoppingAddress",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findShoppingAddress(HttpServletRequest request, ShoppingAddress shoppingAddress)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findShoppingAddress(sessionVO,shoppingAddress);
    }



    @RequestMapping(value = "user_makeMyOrder",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO makeMyOrder(HttpServletRequest request, MyOrderVO orderVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertMyOrder(sessionVO,orderVO);
    }
}
