package com.dgg.store.mapper;

import com.dgg.store.util.pojo.MyOrderList;
import com.dgg.store.util.pojo.ShoppingAddress;
import com.dgg.store.util.pojo.ShoppingCar;
import com.dgg.store.util.vo.goods.MyOrderVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShoppingCarMapper
{
    Integer insertGoodsToCar(ShoppingCar shoppingCar);

    Integer deleteGoodsInCar(@Param("goodsId") String goodsId);

    ShoppingAddress findDefaultAddress(@Param("userId") String userId);

    List<ShoppingAddress> findShoppingAddresses(@Param("userId") String userId);

    ShoppingAddress findShoppingAddress(@Param("addressId") String userAddressId);

    Integer insertMyOrder(MyOrderVO orderVO);

    Integer insertOrderList(MyOrderList orderList);
}
