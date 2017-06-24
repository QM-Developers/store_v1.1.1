package com.dgg.store.service.common;

import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.UserEstimateVO;

public interface UserEstimateService
{

    ResultVO insertEstimate(SessionVO sessionVO, UserEstimateVO estimateVO);

    ResultVO findEstimate(SessionVO sessionVO, UserEstimateVO estimateVO);

    ResultVO insertEnshrine(SessionVO sessionVO, GoodsInfoVO goodsInfoVO);

    ResultVO deleteEnshrine(SessionVO sessionVO, GoodsInfoVO goodsInfoVO);

    ResultVO findEnshrine(SessionVO sessionVO);
}
