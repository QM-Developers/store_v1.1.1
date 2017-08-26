package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.RepertoryCheckDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RepertoryCheckServiceImpl implements RepertoryCheckService
{
    @Autowired
    private RepertoryCheckDao dao;

    @Override
    public String listRepertoryFirst(SessionVO sessionVO, PageVO pageVO)
    {
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        int pageCount = dao.countGoods(sessionVO.getMyTeamId());
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());

        List<GoodsDetailVO> result = dao.listGoods(sessionVO.getMyTeamId(), start, end);

        for (GoodsDetailVO vo : result)
            vo.setStandards(dao.listStandards(vo));

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getRepertory(SessionVO sessionVO,PageVO pageVO)
    {
        String branchId = dao.getBranchId(sessionVO.getUserId());

        if(branchId == null)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED,sessionVO.getToken()));

        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        int pageCount = dao.countBranchGoods(branchId);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());
        List<GoodsDetailVO> result = dao.listBranchGoods(branchId, start, end);

        for (GoodsDetailVO vo : result)
            vo.setStandards(dao.listBranchStandards(vo.getGoodsId(), branchId));

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

}
