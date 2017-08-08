package com.dgg.store.service.common;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.ShoppingCarDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.pojo.MyOrderList;
import com.dgg.store.util.pojo.ShoppingAddress;
import com.dgg.store.util.pojo.ShoppingCar;
import com.dgg.store.util.vo.goods.MyOrderVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShoppingCarServiceImpl implements ShoppingCarService
{
    @Autowired
    private ShoppingCarDao dao;

    @Override
    public String insertGoodsToCar(SessionVO sessionVO, ShoppingCar shoppingCar)
    {
//        int inventory = dao.countGoodsInventory(shoppingCar.getGoodsId());

        Integer result = dao.insertGoodsToCar(shoppingCar);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result, sessionVO.getToken(), result));

        return json.toJSONString();
    }

    @Override
    public ResultVO deleteGoodsInCar(SessionVO sessionVO, ShoppingCar shoppingCar)
    {
        Integer result = dao.deleteGoodsInCar(shoppingCar.getGoodsId());

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findDefaultAddress(SessionVO sessionVO)
    {
        ShoppingAddress result = dao.findDefaultAddress(sessionVO.getUserId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findShoppingAddresses(SessionVO sessionVO)
    {
        List<ShoppingAddress> result = dao.findShoppingAddresses(sessionVO.getUserId());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findShoppingAddress(SessionVO sessionVO, ShoppingAddress shoppingAddress)
    {
        ShoppingAddress result = dao.findShoppingAddress(shoppingAddress.getUserAddressId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertMyOrder(SessionVO sessionVO, MyOrderVO orderVO)
    {
        orderVO.setUserId(sessionVO.getUserId());
        orderVO.setOrderStatus(Constant.WAITING_PAY);
        orderVO.setOrderId(IDGenerator.generator());
        Integer result = dao.insertMyOrder(orderVO);

        List<MyOrderList> orderLists = JSONArray.parseArray(orderVO.getGoodsList(), MyOrderList.class);
        for (MyOrderList orderList : orderLists)
        {
            orderList.setOrderListId(IDGenerator.generator());
            orderList.setOrderId(orderVO.getOrderId());
            if (result > 0)
                result = dao.insertOrderList(orderList);
            else
                throw new RuntimeException("插入失败");
        }

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }
}
