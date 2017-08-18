package com.dgg.store.dao.common;

import com.dgg.store.util.pojo.ShoppingCart;
import com.dgg.store.util.pojo.ShoppingCartExample;
import com.dgg.store.util.vo.cart.ShoppingCartVO;

import java.util.List;

public interface ShoppingCartDao
{
    long countByExample(ShoppingCartExample example);

    int deleteByExample(ShoppingCartExample example);

    int insert(ShoppingCart record);

    int insertSelective(ShoppingCart record);

    List<ShoppingCart> selectByExample(ShoppingCartExample example);

    int updateByExampleSelective(ShoppingCart record, ShoppingCartExample example);

    int updateByExample(ShoppingCart record, ShoppingCartExample example);

    List<ShoppingCartVO> listGoodsFromCart(String userId, int start, int end);

    String getGoodsImg(String goodsId);
}
