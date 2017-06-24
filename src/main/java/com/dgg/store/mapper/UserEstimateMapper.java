package com.dgg.store.mapper;

import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.UserEstimateVO;

import java.util.List;

public interface UserEstimateMapper
{
    Integer insertEstimate(UserEstimateVO estimate);

    List<UserEstimateVO> findEstimate(UserEstimateVO estimateVO);

    int insertEnshrine(String userId, String goodsId);

    int deleteEnshrine(String userId, String goodsId);

    List<GoodsInfoVO> findEnshrine(String userId);
}