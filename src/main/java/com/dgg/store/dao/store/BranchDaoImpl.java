package com.dgg.store.dao.store;

import com.dgg.store.mapper.BranchMapper;
import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.branch.BranchGoodsVO;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BranchDaoImpl implements BranchDao
{
    @Autowired
    private BranchMapper mapper;

    @Override
    public int insertBranch(BranchVO branchVO)
    {
        return mapper.insertBranch(branchVO);
    }

    @Override
    public List<BranchVO> listBranch(BranchVO branchVO, int start, int end)
    {
        return mapper.listBranch(branchVO, start, end);
    }

    @Override
    public int deleteBranch(BranchVO condition)
    {
        return mapper.deleteBranch(condition);
    }

    @Override
    public BranchVO getBranch(String branchId)
    {
        return mapper.getBranch(branchId);
    }

    @Override
    public int updateBranch(BranchVO branchVO)
    {
        return mapper.updateBranch(branchVO);
    }

    @Override
    public List<GoodsDetailVO> listGoods(BranchVO condition, int start, int end)
    {
        return mapper.listGoods(condition, start, end);
    }

    @Override
    public int getGoodsInventory(String standardId)
    {
        return mapper.getGoodsInventory(standardId);
    }

    @Override
    public int updateGoodsInventory(String standardId, int inventory)
    {
        return mapper.updateGoodsInventory(standardId, inventory);
    }

    @Override
    public int deleteBranchGoods(BranchGoodsVO condition)
    {
        return mapper.deleteBranchGoods(condition);
    }

    @Override
    public int insertBranchGoods(BranchGoodsVO branchGoodsVO)
    {
        return mapper.insertBranchGoods(branchGoodsVO);
    }

    @Override
    public Integer getBranchInventory(BranchGoodsVO condition)
    {
        return mapper.getBranchInventory(condition);
    }

    @Override
    public List<GoodsDetailVO> listBranchGoods(BranchVO condition, int start, int end)
    {
        return mapper.listBranchGoods(condition, start, end);
    }

    @Override
    public int countBranch(BranchVO condition)
    {
        return mapper.countBranch(condition);
    }

    @Override
    public int countGoods(BranchVO condition)
    {
        return mapper.countGoods(condition);
    }

    @Override
    public int countBranchGoods(BranchVO condition)
    {
        return mapper.countBranchGoods(condition);
    }

    @Override
    public List<GoodsStandard> listStandards(GoodsDetailVO vo)
    {
        return mapper.listStandards(vo);
    }

    @Override
    public List<GoodsStandard> listBranchStandards(String goodsId, String branchId)
    {
        return mapper.listBranchStandards(goodsId, branchId);
    }

    @Override
    public int countBranchStandard(String standardId, String branchId)
    {
        return mapper.countBranchStandard(standardId,branchId);
    }
}
