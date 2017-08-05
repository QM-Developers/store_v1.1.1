package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.BranchDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.vo.branch.BranchGoodsVO;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BranchServiceImpl implements BranchService
{
    @Autowired
    private BranchDao dao;

    @Override
    public ResultVO insertBranch(SessionVO sessionVO, BranchVO branchVO)
    {
        branchVO.setBranchId(IDGenerator.generator());
        branchVO.setMyTeamId(sessionVO.getMyTeamId());
        int result = dao.insertBranch(branchVO);

        ResultVO resultVO = new ResultVO(result == 0 ? 2 : 1, sessionVO.getToken(), branchVO.getBranchId());

        return resultVO;
    }

    @Override
    public String listBranch(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO)
    {
        BranchVO condition = new BranchVO();
        condition.setMyTeamId(sessionVO.getMyTeamId());
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        int pageCount = dao.countBranch(condition);
        List<BranchVO> result = dao.listBranch(condition, start, end);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put("pageCount", pageCount);

        return json.toJSONString();
    }

    @Override
    public ResultVO deleteBranch(SessionVO sessionVO, BranchVO branchVO)
    {
        BranchVO condition = new BranchVO();
        condition.setBranchId(branchVO.getBranchId());

        int result = dao.deleteBranch(condition);

        ResultVO resultVO = new ResultVO(result == 0 ? 2 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO getBranch(SessionVO sessionVO, BranchVO branchVO)
    {
        BranchVO result = dao.getBranch(branchVO.getBranchId());

        ResultVO resultVO = new ResultVO(result == null ? 2 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateBranch(SessionVO sessionVO, BranchVO branchVO)
    {
        int result = dao.updateBranch(branchVO);

        ResultVO resultVO = new ResultVO(result == 0 ? 2 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public String listGoods(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO)
    {
        BranchVO condition = new BranchVO();
        condition.setMyTeamId(sessionVO.getMyTeamId());
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        int pageCount = dao.countGoods(condition);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());
        List<GoodsDetailVO> result = dao.listGoods(condition, start, end);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put("pageCount", pageCount);

        return json.toJSONString();
    }

    @Override
    public ResultVO updateBranchGoods(SessionVO sessionVO, BranchGoodsVO branchGoodsVO)
    {
        int result = 1;
        int index = 0;
        int count = 3;
        Integer branchInventory;
        int inventory = 0;

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    BranchGoodsVO condition = new BranchGoodsVO();
                    condition.setBranchId(branchGoodsVO.getBranchId());
                    condition.setStandardId(branchGoodsVO.getStandardId());

                    branchInventory = dao.getBranchInventory(condition);
                    inventory = dao.getGoodsInventory(branchGoodsVO.getStandardId());

                    if (branchInventory != null)
                    {
                        inventory += branchInventory;
                        result = dao.deleteBranchGoods(condition);
                    }
                    break;
                case 1:
                    result = inventory = inventory - branchGoodsVO.getStandardCount();
                    break;
                case 2:
                    result = dao.insertBranchGoods(branchGoodsVO);
                    break;
                case 3:
                    result = dao.updateGoodsInventory(branchGoodsVO.getStandardId(), inventory);
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public String listBranchGoods(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO)
    {
        BranchVO condition = new BranchVO();
        condition.setBranchId(branchVO.getBranchId());
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        int pageCount = dao.countBranchGoods(condition);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());
        List<GoodsDetailVO> result = dao.listBranchGoods(condition,start,end);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put("pageCount", pageCount);

        return json.toJSONString();
    }
}
