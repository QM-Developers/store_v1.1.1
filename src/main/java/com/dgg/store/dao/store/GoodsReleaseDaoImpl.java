package com.dgg.store.dao.store;

import com.dgg.store.mapper.GoodsinfoMapper;
import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.ImageSpace;
import com.dgg.store.util.vo.goods.GoodsImgVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GoodsReleaseDaoImpl implements GoodsReleaseDao
{
    @Autowired
    private GoodsinfoMapper mapper;

    @Override
    public int insertGoodsinfo(GoodsInfoVO goodsinfo)
    {
        return mapper.insertGoodsinfo(goodsinfo);
    }

    @Override
    public int insertImgToSpace(String imgId, String path, String teamId)
    {
        return mapper.insertImgToSpace(imgId,path,teamId);
    }

    @Override
    public GoodsTypeVO findTypeAndParent(String goodsTypePid)
    {
        return mapper.findTypeAndParent(goodsTypePid);
    }

    @Override
    public GoodsTypeVO findGoodsType(String goodsTypeId)
    {
        return mapper.findGoodsType(goodsTypeId);
    }

    @Override
    public List<GoodsTypeAttr> findTypeAttr(String goodsTypeId)
    {
        return mapper.findTypeAttr(goodsTypeId);
    }

    @Override
    public Integer insertImgToGoods(GoodsImgVO imgVO)
    {
        return mapper.insertImgToGoods(imgVO);
    }

    @Override
    public List<ImageSpace> findImages(String myTeamId)
    {
        return mapper.findImages(myTeamId);
    }

    @Override
    public Integer insertStandardToGoods(GoodsStandard standard)
    {
        return mapper.insertStandardToGoods(standard);
    }
}
