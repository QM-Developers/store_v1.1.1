package com.dgg.store.dao.common;

import com.dgg.store.util.pojo.MyOrderList;
import com.dgg.store.util.pojo.ShoppingAddress;
import com.dgg.store.util.pojo.ShoppingCar;
import com.dgg.store.util.vo.goods.MyOrderVO;

import java.util.List;

public interface ShoppingCarDao
{
    Integer insertGoodsToCar(ShoppingCar shoppingCar);

    Integer deleteGoodsFromCar(String goodsId);

    ShoppingAddress findDefaultAddress(String userId);

    List<ShoppingAddress> findShoppingAddresses(String userId);

    ShoppingAddress findShoppingAddress(String userAddressId);

    Integer insertMyOrder(MyOrderVO orderVO);

    Integer insertOrderList(MyOrderList orderList);
}
