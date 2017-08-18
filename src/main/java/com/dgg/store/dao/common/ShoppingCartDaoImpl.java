package com.dgg.store.dao.common;

import com.dgg.store.mapper.ShoppingCartMapper;
import com.dgg.store.util.pojo.ShoppingCart;
import com.dgg.store.util.pojo.ShoppingCartExample;
import com.dgg.store.util.vo.cart.ShoppingCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ShoppingCartDaoImpl implements ShoppingCartDao
{
    @Autowired
    private ShoppingCartMapper mapper;

    @Override
    public long countByExample(ShoppingCartExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(ShoppingCartExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int insert(ShoppingCart record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(ShoppingCart record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<ShoppingCart> selectByExample(ShoppingCartExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public int updateByExampleSelective(ShoppingCart record, ShoppingCartExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(ShoppingCart record, ShoppingCartExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public List<ShoppingCartVO> listGoodsFromCart(String userId, int start, int end)
    {
        return mapper.listGoodsFromCart(userId, start, end);
    }

    @Override
    public String getGoodsImg(String goodsId)
    {
        return mapper.getGoodsImg(goodsId);
    }
}
