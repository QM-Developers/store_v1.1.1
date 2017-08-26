package com.dgg.store.dao.store;

import com.dgg.store.mapper.RepertoryApplyMapper;
import com.dgg.store.util.pojo.RepertoryApply;
import com.dgg.store.util.pojo.RepertoryApplyExample;
import com.dgg.store.util.pojo.RepertoryApplyList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RepertoryApplyDaoImpl implements RepertoryApplyDao
{
    @Autowired
    private RepertoryApplyMapper mapper;

    @Override
    public long countByExample(RepertoryApplyExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(RepertoryApplyExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(RepertoryApply record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(RepertoryApply record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<RepertoryApply> selectByExample(RepertoryApplyExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public RepertoryApply selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(RepertoryApply record, RepertoryApplyExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(RepertoryApply record, RepertoryApplyExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(RepertoryApply record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(RepertoryApply record)
    {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public List<RepertoryApply> listRepertoryChecker(String permissionId, String myTeamId)
    {
        return mapper.listRepertoryChecker(permissionId,myTeamId);
    }

    @Override
    public int insertApplyList(List<RepertoryApplyList> applyList, String applyId)
    {
        return mapper.insertApplyList(applyList,applyId);
    }

    @Override
    public List<RepertoryApplyList> listApplyList(String applyId)
    {
        return mapper.listApplyList(applyId);
    }

    @Override
    public int getRepertory(String standardId)
    {
        return mapper.getRepertory(standardId);
    }

    @Override
    public int updateGoodsCount(String standardId, int count)
    {
        return mapper.updateGoodsCount(standardId,count);
    }

    @Override
    public int getSecondRepertory(String branchId, String standardId)
    {
        return mapper.getSecondRepertory(branchId,standardId);
    }

    @Override
    public int deleteSecondStandard(String branchId, String standardId)
    {
        return mapper.deleteSecondStandard(branchId,standardId);
    }

    @Override
    public int insertSecondRepertory(List<RepertoryApplyList> applyList, String branchId)
    {
        return mapper.insertSecondRepertory(applyList,branchId);
    }
}
