package com.dgg.store.mapper;

import com.dgg.store.util.pojo.ShoppingCart;
import com.dgg.store.util.pojo.ShoppingCartExample;
import java.util.List;

import com.dgg.store.util.vo.cart.ShoppingCartVO;
import org.apache.ibatis.annotations.Param;

public interface ShoppingCartMapper {
    long countByExample(ShoppingCartExample example);

    int deleteByExample(ShoppingCartExample example);

    int insert(ShoppingCart record);

    int insertSelective(ShoppingCart record);

    List<ShoppingCart> selectByExample(ShoppingCartExample example);

    int updateByExampleSelective(@Param("record") ShoppingCart record, @Param("example") ShoppingCartExample example);

    int updateByExample(@Param("record") ShoppingCart record, @Param("example") ShoppingCartExample example);

    List<ShoppingCartVO> listGoodsFromCart(@Param("userId") String userId,@Param("start") int start,@Param("end") int end);

    String getGoodsImg(@Param("goodsId") String goodsId);
}