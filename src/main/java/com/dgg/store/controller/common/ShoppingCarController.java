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


}
