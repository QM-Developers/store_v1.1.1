package com.dgg.store.controller.common;

import com.dgg.store.service.common.ShoppingCartService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.ShoppingCart;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 购物车控制器
 */
@Controller
public class ShoppingCartController
{
    @Autowired
    private ShoppingCartService service;

    /**
     * 添加商品到购物车
     *
     * @param request      用户参数
     * @param shoppingCart 商品信息
     * @return 操作的结果
     */
    @RequestMapping(value = "user_saveGoodsToCart", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveGoodsToCart(HttpServletRequest request, ShoppingCart shoppingCart)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertGoodsToCart(sessionVO, shoppingCart);
    }

    /**
     * 获取购物车商品列表
     *
     * @param request 用户参数
     * @param pageVO  分页参数
     * @return 商品信息列表
     */
    @RequestMapping(value = "user_listGoodsFromCart", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listGoodsFromCart(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listGoodsFromCart(sessionVO, pageVO);
    }

    /**
     * 修改购物车商品
     *
     * @param request      用户参数
     * @param shoppingCart 商品信息
     * @return 操作的结果
     */
    @RequestMapping(value = "user_updateGoodsInCart", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateGoodsInCart(HttpServletRequest request, ShoppingCart shoppingCart)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateGoodsInCart(sessionVO, shoppingCart);
    }

    /**
     * 删除购物车商品
     *
     * @param request      用户参数
     * @param shoppingCart 商品信息
     * @return 操作的结果
     */
    @RequestMapping(value = "user_removeGoodsFromCart", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String deleteGoodsFromCart(HttpServletRequest request, ShoppingCart shoppingCart)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteGoodsFromCart(sessionVO, shoppingCart);
    }
}
