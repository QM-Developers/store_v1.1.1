package com.dgg.store.dao.common;

import com.dgg.store.mapper.GoodsBrowseMapper;
import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.core.PageVO;
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
    public int countGoodsByType(GoodsTypeVO goodsType, Set<String> childType)
    {
        return mapper.countGoodsByType(goodsType, childType);
    }

    @Override
    public int getRepertoryLevel(String userId, String myTeamId)
    {
        return mapper.getRepertoryLevel(userId,myTeamId);
    }

    @Override
    public int countGoodsByType2(GoodsTypeVO goodsTypeVO, Set<String> childType)
    {
        return mapper.countGoodsByType2(goodsTypeVO, childType);
    }

    @Override
    public List<GoodsInfoVO> findGoodsList2(GoodsTypeVO goodsTypeVO, int start, int end, Set<String> childType)
    {
        return mapper.findGoodsList2(goodsTypeVO, start, end, childType);
    }

    @Override
    public GoodsDetailVO findGoodsDetail_2(String goodsId, String id)
    {
        return mapper.findGoodsDetail_2(goodsId, id);
    }

    @Override
    public String getFirstBranchId(String myTeamId, byte branchType)
    {
        return mapper.getFirstBranchId(myTeamId, branchType);
    }

    @Override
    public int countBranchGoods(GoodsTypeVO goodsTypeVO, Set<String> childType, String branchId)
    {
        return mapper.countBranchGoods(goodsTypeVO, childType, branchId);
    }

    @Override
    public List<GoodsInfoVO> listBranchGoods(GoodsTypeVO goodsTypeVO, Set<String> childType, PageVO pageVO, String branchId)
    {
        return mapper.listBranchGoods(goodsTypeVO, childType, pageVO, branchId);
    }

    @Override
    public String getGoodsImage(String goodsId)
    {
        return mapper.getGoodsImage(goodsId);
    }

    @Override
    public String getCurrentBranchId(String userId)
    {
        return mapper.getCurrentBranchId(userId);
    }

    @Override
    public GoodsDetailVO getGoodsInfo(String goodsId)
    {
        return mapper.getGoodsInfo(goodsId);
    }

    @Override
    public List<GoodsStandard> listGoodsStandard(String goodsId, String branchId)
    {
        return mapper.listGoodsStandard(goodsId,branchId);
    }

    @Override
    public List<String> listGoodsImage(String goodsId)
    {
        return mapper.listGoodsImage(goodsId);
    }

}
