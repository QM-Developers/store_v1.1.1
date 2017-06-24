package com.dgg.store.dao.common;

import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.UserEstimateVO;

import java.util.List;

public interface UserEstimateDao
{
    Integer insertEstimate(UserEstimateVO estimateVO);

    List<UserEstimateVO> findEstimate(UserEstimateVO estimateVO);

    int insertEnshrine(String userId, String goodsId);

    int deleteEnshrine(String userId, String goodsId);

    List<GoodsInfoVO> findEnshrine(String userId);
}
