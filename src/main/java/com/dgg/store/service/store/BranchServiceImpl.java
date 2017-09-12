package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.BranchDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.GoodsStandard;
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

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

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

        for (GoodsDetailVO vo : result)
        {
            vo.setStandards(dao.listStandards(vo));
            for (GoodsStandard s : vo.getStandards())
                s.setBranchStandardCount(dao.countBranchStandard(s.getStandardId(), branchVO.getBranchId()));
        }


        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public ResultVO updateBranchGoods(SessionVO sessionVO, BranchGoodsVO branchGoodsVO)
    {
        int result = 1;
        BranchGoodsVO condition = new BranchGoodsVO();
        int count = 3;
        int index;
        int inventory;

        String[] standardIdArray = branchGoodsVO.getStandardId().split(SymbolConstant.COMMA);
        String[] goodsIdArray = branchGoodsVO.getGoodsId().split(SymbolConstant.COMMA);
        String[] standardCountArray = branchGoodsVO.getStandardCount().split(SymbolConstant.COMMA);

        condition.setBranchId(branchGoodsVO.getBranchId());
        for (int i = 0; i < standardIdArray.length; i++)
        {
            Integer branchInventory;
            inventory = 0;
            index = 0;

            condition.setStandardId(standardIdArray[i]);
            condition.setGoodsId(goodsIdArray[i]);
            condition.setStandardCount(standardCountArray[i]);

            while (result > 0)
            {
                switch (index)
                {
                    case 0: // 删除销售点库存
                        branchInventory = dao.getBranchInventory(condition);
                        inventory = dao.getGoodsInventory(condition.getStandardId());

                        if (branchInventory != null)
                        {
                            inventory += branchInventory;
                            result = dao.deleteBranchGoods(condition);
                        }
                        break;
                    case 1: // 计算总库存
                        result = (inventory = inventory - Integer.parseInt(condition.getStandardCount())) >= 0 ? 1 : 0;
                        break;
                    case 2: // 插入销售点商品
                        if (condition.getStandardCount() != null && Integer.parseInt(condition.getStandardCount()) > 1)
                            result = dao.insertBranchGoods(condition);
                        break;
                    case 3: // 更新总库存
                        result = dao.updateGoodsInventory(condition.getStandardId(), inventory);
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
        }


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
        List<GoodsDetailVO> result = dao.listBranchGoods(condition, start, end);

        for (GoodsDetailVO vo : result)
            vo.setStandards(dao.listBranchStandards(vo.getGoodsId(), condition.getBranchId()));

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }
}
