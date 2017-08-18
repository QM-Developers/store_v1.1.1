package com.dgg.store.service.common;

import com.dgg.store.util.pojo.ShoppingCart;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface ShoppingCartService
{
    String insertGoodsToCart(SessionVO sessionVO, ShoppingCart shoppingCart);

    String listGoodsFromCart(SessionVO sessionVO, PageVO pageVO);

    String updateGoodsInCart(SessionVO sessionVO, ShoppingCart shoppingCart);

    String deleteGoodsFromCart(SessionVO sessionVO, ShoppingCart shoppingCart);
}
