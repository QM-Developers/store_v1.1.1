package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dgg.store.dao.common.GoodsBrowseDao;
import com.dgg.store.dao.store.BranchDao;
import com.dgg.store.util.core.GoodsUtil;
import com.dgg.store.util.core.constant.BranchConstant;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.string.StringUtil;
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
import java.util.Set;

@Service
public class BranchServiceImpl implements BranchService
{
    @Autowired
    private BranchDao dao;

    @Autowired
    private GoodsBrowseDao browseDao;

    @Override
    public String insertBranch(SessionVO sessionVO, BranchVO branchVO)
    {
        BranchVO condition = new BranchVO();
        condition.setDepartmentId(branchVO.getDepartmentId());
        if (dao.countBranch(condition) > 0)
            return JSONObject.toJSONString(new ResultVO(3, sessionVO.getToken()));

        branchVO.setBranchId(IDGenerator.generator());
        branchVO.setMyTeamId(sessionVO.getMyTeamId());
        branchVO.setBranchType(BranchConstant.BRANCH_SECOND);
        int result = dao.insertBranch(branchVO);

        return JSONObject.toJSONString(new ResultVO(result == 0 ? 2 : 1, sessionVO.getToken(), branchVO.getBranchId()));
    }

    @Override
    public String listBranch(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        BranchVO condition = new BranchVO();
        condition.setMyTeamId(sessionVO.getMyTeamId());
        condition.setBranchType(BranchConstant.BRANCH_SECOND);
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        int pageCount = dao.countBranch(condition);
        List<BranchVO> result = dao.listBranch(condition, start, end);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result, pageCount), SerializerFeature.WriteNullStringAsEmpty);
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
    public String getBranch(SessionVO sessionVO, BranchVO branchVO)
    {
        BranchVO result = dao.getBranch(branchVO.getBranchId());

        return JSONObject.toJSONString(new ResultVO(result == null ? 2 : 1, sessionVO.getToken(), result));
    }

    @Override
    public String updateBranch(SessionVO sessionVO, BranchVO branchVO)
    {
        int result = dao.updateBranch(branchVO);

        return JSONObject.toJSONString(new ResultVO(result == 0 ? 2 : 1, sessionVO.getToken(), result));
    }

    @Override
    public String listGoods(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

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

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result, pageCount), SerializerFeature.WriteNullStringAsEmpty);
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
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        BranchVO condition = new BranchVO();
        condition.setBranchId(branchVO.getBranchId());
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();

        Set<String> childType = null;
        if (!StringUtil.isEmpty(branchVO.getGoodsTypeId()))
        {
            childType = GoodsUtil.findChildTypeId(branchVO.getGoodsTypeId(), browseDao);
            childType.add(branchVO.getGoodsTypeId());
        }

        condition.setMyTeamId(sessionVO.getMyTeamId());
        int pageCount = dao.countBranchGoods(condition, childType);

        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());
        List<GoodsDetailVO> result = dao.listBranchGoods(condition, childType, start, end);

        for (GoodsDetailVO vo : result)
        {
            vo.setGoodsImage(dao.getGoodsImage(vo.getGoodsId()));
            vo.setStandards(dao.listBranchStandards(vo.getGoodsId(), condition.getBranchId()));
        }

        return JSONObject.toJSONString(new Result(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result, pageCount, branchVO.getBranchId(), dao.getBranchName(branchVO.getBranchId())), SerializerFeature.WriteNullStringAsEmpty);
    }

    private class Result extends ResultVO
    {
        private String branchId;
        private String branchName;

        public Result(Integer state, String token, Object result, Integer pageCount, String branchId, String branchName)
        {
            super(state, token, result, pageCount);
            this.branchId = branchId;
            this.branchName = branchName;
        }

        public String getBranchId()
        {
            return branchId;
        }

        public void setBranchId(String branchId)
        {
            this.branchId = branchId;
        }

        public String getBranchName()
        {
            return branchName;
        }

        public void setBranchName(String branchName)
        {
            this.branchName = branchName;
        }
    }

    @Override
    public String getRepertory(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        branchVO.setBranchId(dao.getCurrentBranchId(sessionVO.getUserId()));

        return listBranchGoods(sessionVO, branchVO, pageVO);
    }

    @Override
    public String getFirstRepertory(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        branchVO.setBranchId(dao.getFirstBranchId(sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST));

        return listBranchGoods(sessionVO, branchVO, pageVO);
    }

    @Override
    public String listRepertoryByKeyword(SessionVO sessionVO, BranchVO branchVO, PageVO pageVO)
    {
        if (StringUtil.isEmpty(branchVO.getBranchId()) || StringUtil.isEmpty(branchVO.getKeyword()))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));

        branchVO.setMyTeamId(sessionVO.getMyTeamId());
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();

        int pageCount = PagingUtil.getCount(dao.countGoodsByKeyword(branchVO), pageSize);

        List<GoodsDetailVO> result = dao.listGoodsByKeyword(branchVO, pageNum, pageSize);

        for (GoodsDetailVO vo : result)
        {
            vo.setGoodsImage(dao.getGoodsImage(vo.getGoodsId()));
            vo.setStandards(dao.listBranchStandards(vo.getGoodsId(), branchVO.getBranchId()));
        }

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result, pageCount), SerializerFeature.WriteNullStringAsEmpty);
    }

    @Override
    public String getFirstBranchId(SessionVO sessionVO)
    {
        BranchVO branchVO = dao.getBranch(dao.getFirstBranchId(sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), branchVO));
    }
}
