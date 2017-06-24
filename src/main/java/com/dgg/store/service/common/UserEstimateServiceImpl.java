package com.dgg.store.service.common;

import com.dgg.store.dao.common.UserEstimateDao;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.UserEstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserEstimateServiceImpl implements UserEstimateService
{
    @Autowired
    private UserEstimateDao dao;

    @Override
    public ResultVO insertEstimate(SessionVO sessionVO, UserEstimateVO estimateVO)
    {
        estimateVO.setUserId(sessionVO.getUserId());
        Integer result = dao.insertEstimate(estimateVO);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findEstimate(SessionVO sessionVO, UserEstimateVO estimateVO)
    {
        int start = estimateVO.getPageNum() * estimateVO.getPageSize();
        int end = start + estimateVO.getPageSize();
        estimateVO.setPageNum(start);
        estimateVO.setPageSize(end);

        List<UserEstimateVO> result = dao.findEstimate(estimateVO);

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertEnshrine(SessionVO sessionVO, GoodsInfoVO goodsInfoVO)
    {
        int result = dao.insertEnshrine(sessionVO.getUserId(), goodsInfoVO.getGoodsId());

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO deleteEnshrine(SessionVO sessionVO, GoodsInfoVO goodsInfoVO)
    {
        int result = dao.deleteEnshrine(sessionVO.getUserId(), goodsInfoVO.getGoodsId());

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findEnshrine(SessionVO sessionVO)
    {
        List<GoodsInfoVO> result = dao.findEnshrine(sessionVO.getUserId());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }
}
