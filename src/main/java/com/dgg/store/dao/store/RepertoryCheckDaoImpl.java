package com.dgg.store.dao.store;

import com.dgg.store.mapper.RepertoryCheckMapper;
import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RepertoryCheckDaoImpl implements RepertoryCheckDao
{
    @Autowired
    private RepertoryCheckMapper mapper;

    @Override
    public int countGoods(String myTeamId)
    {
        return mapper.countGoods(myTeamId);
    }

    @Override
    public List<GoodsDetailVO> listGoods(String myTeamId, int start, int end)
    {
        return mapper.listGoods(myTeamId, start, end);
    }

    @Override
    public List<GoodsStandard> listStandards(GoodsDetailVO vo)
    {
        return mapper.listStandards(vo);
    }

    @Override
    public String getBranchId(String userId)
    {
        return mapper.getBranchId(userId);
    }

    @Override
    public int countBranchGoods(String branchId)
    {
        return mapper.countBranchGoods(branchId);
    }

    @Override
    public List<GoodsDetailVO> listBranchGoods(String branchId, int start, int end)
    {
        return mapper.listBranchGoods(branchId,start,end);
    }

    @Override
    public List<GoodsStandard> listBranchStandards(String goodsId, String branchId)
    {
        return mapper.listBranchStandards(goodsId,branchId);
    }
}
