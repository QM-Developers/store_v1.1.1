package com.dgg.store.service.common;

import com.dgg.store.util.pojo.ShoppingAddress;
import com.dgg.store.util.pojo.ShoppingCar;
import com.dgg.store.util.vo.goods.MyOrderVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface ShoppingCarService
{

    String insertGoodsToCar(SessionVO sessionVO, ShoppingCar shoppingCar);

    ResultVO deleteGoodsInCar(SessionVO sessionVO, ShoppingCar shoppingCar);

    ResultVO findDefaultAddress(SessionVO sessionVO);

    ResultVO findShoppingAddresses(SessionVO sessionVO);

    ResultVO findShoppingAddress(SessionVO sessionVO, ShoppingAddress shoppingAddress);

    ResultVO insertMyOrder(SessionVO sessionVO, MyOrderVO orderVO);
}
