package com.dgg.store.dao.common;

import com.dgg.store.mapper.ShoppingCarMapper;
import com.dgg.store.util.pojo.MyOrderList;
import com.dgg.store.util.pojo.ShoppingAddress;
import com.dgg.store.util.pojo.ShoppingCar;
import com.dgg.store.util.vo.goods.MyOrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ShoppingCarDaoImpl implements ShoppingCarDao
{
    @Autowired
    private ShoppingCarMapper mapper;

    @Override
    public Integer insertGoodsToCar(ShoppingCar shoppingCar)
    {
        return mapper.insertGoodsToCar(shoppingCar);
    }

    @Override
    public Integer deleteGoodsInCar(String goodsId)
    {
        return mapper.deleteGoodsInCar(goodsId);
    }

    @Override
    public ShoppingAddress findDefaultAddress(String userId)
    {
        return mapper.findDefaultAddress(userId);
    }

    @Override
    public List<ShoppingAddress> findShoppingAddresses(String userId)
    {
        return mapper.findShoppingAddresses(userId);
    }

    @Override
    public ShoppingAddress findShoppingAddress(String userAddressId)
    {
        return mapper.findShoppingAddress(userAddressId);
    }

    @Override
    public Integer insertMyOrder(MyOrderVO orderVO)
    {
        return mapper.insertMyOrder(orderVO);
    }

    @Override
    public Integer insertOrderList(MyOrderList orderList)
    {
        return mapper.insertOrderList(orderList);
    }
}
