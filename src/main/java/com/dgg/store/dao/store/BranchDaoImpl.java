package com.dgg.store.dao.store;

import com.dgg.store.mapper.BranchMapper;
import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.branch.BranchGoodsVO;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

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
    public List<GoodsDetailVO> listBranchGoods(BranchVO condition, Set<String> childType, int start, int end)
    {
        return mapper.listBranchGoods(condition, childType, start, end);
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
    public int countBranchGoods(BranchVO condition, Set<String> childType)
    {
        return mapper.countBranchGoods(condition, childType);
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
        return mapper.countBranchStandard(standardId, branchId);
    }

    @Override
    public String getCurrentBranchId(String userId)
    {
        return mapper.getCurrentBranchId(userId);
    }

    @Override
    public String getFirstBranchId(String myTeamId, byte branchType)
    {
        return mapper.getFirstBranchId(myTeamId, branchType);
    }

    @Override
    public String getBranchName(String branchId)
    {
        return mapper.getBranchName(branchId);
    }

    @Override
    public String getGoodsImage(String goodsId)
    {
        return mapper.getGoodsImage(goodsId);
    }

    @Override
    public int countGoodsByKeyword(BranchVO branchVO)
    {
        return mapper.countGoodsByKeyword(branchVO);
    }

    @Override
    public List<GoodsDetailVO> listGoodsByKeyword(BranchVO branchVO, int pageNum, int pageSize)
    {
        return mapper.listGoodsByKeyword(branchVO, pageNum, pageSize);
    }

    @Override
    public Set<String> findChildTypeId(String typeId)
    {
        return mapper.findChildTypeId(typeId);
    }
}
