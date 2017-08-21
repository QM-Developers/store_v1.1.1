package com.dgg.store.dao.common;

import com.dgg.store.mapper.GoodsBrowseMapper;
import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public class GoodsBrowseDaoImpl implements GoodsBrowseDao
{
    @Autowired
    private GoodsBrowseMapper mapper;

    @Override
    public List<GoodsTypeVO> findGoodsType(String goodsTypePid)
    {
        return mapper.findGoodsType(goodsTypePid);
    }

    @Override
    public List<GoodsInfoVO> findGoodsList(GoodsTypeVO goodsType, int pageNum, int pageSize, Set<String> childType)
    {
        return mapper.findGoodsList(goodsType, pageNum, pageSize, childType);
    }

    @Override
    public GoodsDetailVO findGoodsDetail(String goodsId)
    {
        return mapper.findGoodsDetail(goodsId);
    }

    @Override
    public GoodsStandard findGoodsStandard(String standardId)
    {
        return mapper.findGoodsStandard(standardId);
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

    @Override
    public List<GoodsTypeVO> findAllGoodsType()
    {
        return mapper.findAllGoodsType();
    }

    @Override
    public Set<String> findChildTypeId(String typeId)
    {
        return mapper.findChildTypeId(typeId);
    }

    @Override
    public int countGoodsByType(GoodsTypeVO goodsType)
    {
        return mapper.countGoodsByType(goodsType);
    }

}
