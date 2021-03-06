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
public class GoodsManageDaoImpl implements GoodsManageDao
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
        return mapper.insertImgToSpace(imgId, path, teamId);
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

    @Override
    public List<GoodsInfoVO> findGoodsList(GoodsInfoVO condition, int start, int end)
    {
        return mapper.findGoodsList(condition, start, end);
    }

    @Override
    public GoodsInfoVO findGoodsInfo(GoodsInfoVO infoVO)
    {
        return mapper.findGoodsInfo(infoVO);
    }

    @Override
    public List<GoodsImgVO> findGoodsDescribe(String[] ids)
    {
        return mapper.findGoodsDescribe(ids);
    }

    @Override
    public Integer deleteAllStandard(String goodsId)
    {
        return mapper.deleteAllStandard(goodsId);
    }

    @Override
    public Integer deleteAllImg(String goodsId)
    {
        return mapper.deleteAllImg(goodsId);
    }

    @Override
    public Integer updateGoods(GoodsInfoVO goodsInfo)
    {
        return mapper.updateGoods(goodsInfo);
    }

    @Override
    public Integer deleteGoodsInfo(GoodsInfoVO condition)
    {
        return mapper.deleteGoodsInfo(condition);
    }

    @Override
    public int countGoods(GoodsInfoVO condition)
    {
        return mapper.countGoods(condition);
    }

    @Override
    public List<GoodsStandard> listStandards(String goodsId, String branchId)
    {
        return mapper.listStandards(goodsId,branchId);
    }

    @Override
    public List<GoodsImgVO> listImage(String goodsId)
    {
        return mapper.listImage(goodsId);
    }

    @Override
    public String getCurrentBranchId(String userId)
    {
        return mapper.getCurrentBranchId(userId);
    }

    @Override
    public String getFirstBranchId(String myTeamId, byte branchType)
    {
        return mapper.getFirstBranchId(myTeamId,branchType);
    }
}
