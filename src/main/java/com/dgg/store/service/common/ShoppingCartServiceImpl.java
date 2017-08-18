package com.dgg.store.service.common;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.ShoppingCartDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.reflect.ReflectUtil;
import com.dgg.store.util.pojo.ShoppingCart;
import com.dgg.store.util.pojo.ShoppingCartExample;
import com.dgg.store.util.vo.cart.ShoppingCartVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService
{
    @Autowired
    private ShoppingCartDao dao;

    @Override
    public String insertGoodsToCart(SessionVO sessionVO, ShoppingCart shoppingCart)
    {
        int result = 0;

        shoppingCart.setUserId(sessionVO.getUserId());
        shoppingCart.setCreateDate(new Date());

        if (ReflectUtil.hadNull(shoppingCart))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        ShoppingCartExample example = new ShoppingCartExample();
        ShoppingCartExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(sessionVO.getUserId());
        criteria.andGoodsIdEqualTo(shoppingCart.getGoodsId());
        criteria.andStandardIdEqualTo(shoppingCart.getStandardId());

        List<ShoppingCart> goodsList = dao.selectByExample(example);

        if (goodsList.size() > 0)
        {
            ShoppingCart goods = goodsList.get(0);
            goods.setGoodsNum(goods.getGoodsNum() + shoppingCart.getGoodsNum());
            result = dao.updateByExampleSelective(goods, example);
        } else
        {
            result = dao.insert(shoppingCart);
        }

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }


    @Override
    public String listGoodsFromCart(SessionVO sessionVO, PageVO pageVO)
    {
        ShoppingCartExample example = new ShoppingCartExample();
        ShoppingCartExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(sessionVO.getUserId());

        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        List<ShoppingCartVO> result = dao.listGoodsFromCart(sessionVO.getUserId(), start, end);

        for (ShoppingCartVO vo : result)
            vo.setGoodsImg(dao.getGoodsImg(vo.getGoodsId()));

        int pageCount = (int) dao.countByExample(example);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String updateGoodsInCart(SessionVO sessionVO, ShoppingCart shoppingCart)
    {
        int result = 0;

        shoppingCart.setUserId(sessionVO.getUserId());
        shoppingCart.setCreateDate(new Date());

        if (ReflectUtil.hadNull(shoppingCart))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        ShoppingCart record = new ShoppingCart();
        record.setGoodsNum(shoppingCart.getGoodsNum());

        ShoppingCartExample example = new ShoppingCartExample();
        ShoppingCartExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(sessionVO.getUserId());
        criteria.andGoodsIdEqualTo(shoppingCart.getGoodsId());
        criteria.andStandardIdEqualTo(shoppingCart.getStandardId());

        result = dao.updateByExampleSelective(record, example);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));

    }

    @Override
    public String deleteGoodsFromCart(SessionVO sessionVO, ShoppingCart shoppingCart)
    {
        int result = 0;

        shoppingCart.setGoodsNum(0);
        shoppingCart.setUserId(sessionVO.getUserId());
        shoppingCart.setCreateDate(new Date());

        if (ReflectUtil.hadNull(shoppingCart))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        ShoppingCartExample example = new ShoppingCartExample();
        ShoppingCartExample.Criteria criteria = example.createCriteria();

        criteria.andUserIdEqualTo(sessionVO.getUserId());
        criteria.andGoodsIdEqualTo(shoppingCart.getGoodsId());
        criteria.andStandardIdEqualTo(shoppingCart.getStandardId());

        result = dao.deleteByExample(example);

        return JSONObject.toJSONString(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));
    }


}
