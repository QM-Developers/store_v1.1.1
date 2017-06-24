package com.dgg.store.dao.common;

import com.dgg.store.mapper.UserEstimateMapper;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.UserEstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserEstimateDaoImpl implements UserEstimateDao
{
    @Autowired
    private UserEstimateMapper mapper;

    @Override
    public Integer insertEstimate(UserEstimateVO estimateVO)
    {
        return mapper.insertEstimate(estimateVO);
    }

    @Override
    public List<UserEstimateVO> findEstimate(UserEstimateVO estimateVO)
    {
        return mapper.findEstimate(estimateVO);
    }

    @Override
    public int insertEnshrine(String userId, String goodsId)
    {
        return mapper.insertEnshrine(userId,goodsId);
    }

    @Override
    public int deleteEnshrine(String userId, String goodsId)
    {
        return mapper.deleteEnshrine(userId,goodsId);
    }

    @Override
    public List<GoodsInfoVO> findEnshrine(String userId)
    {
        return mapper.findEnshrine(userId);
    }
}
