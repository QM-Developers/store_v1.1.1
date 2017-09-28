package com.dgg.store.dao.store;

import com.dgg.store.mapper.StoreGoodsBrowseMapper;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public class StoreGoodsBrowseDaoImpl implements StoreGoodsBrowseDao
{
    private final StoreGoodsBrowseMapper mapper;

    public StoreGoodsBrowseDaoImpl(StoreGoodsBrowseMapper mapper)
    {
        this.mapper = mapper;
    }

    @Override
    public int countGoodsByType(GoodsTypeVO goodsTypeVO)
    {
        return mapper.countGoodsByType(goodsTypeVO);
    }

    @Override
    public List<GoodsInfoVO> findGoodsList(GoodsTypeVO goodsTypeVO, int start, int end, Set<String> childType)
    {
        return mapper.findGoodsList(goodsTypeVO,start,end,childType);
    }

    @Override
    public Set<String> findChildTypeId(String goodsTypeId)
    {
        return mapper.findChildTypeId(goodsTypeId);
    }

    @Override
    public GoodsDetailVO findGoodsDetail(GoodsDetailVO goodsDetailVO)
    {
        return mapper.findGoodsDetail(goodsDetailVO);
    }

    @Override
    public String findGoodsDescribe(String goodsId)
    {
        return mapper.findGoodsDescribe(goodsId);
    }

    @Override
    public String findGoodsDescribeImg(String id)
    {
        return mapper.findGoodsDescribeImg(id);
    }
}
