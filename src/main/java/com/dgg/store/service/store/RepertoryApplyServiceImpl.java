package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.mapper.RepertoryApplyListMapper;
import com.dgg.store.mapper.RepertoryApplyMapper;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.umeng.push.PushMessageFactory;
import com.dgg.store.util.core.umeng.push.UMengUtil;
import com.dgg.store.util.pojo.*;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class RepertoryApplyServiceImpl implements RepertoryApplyService
{
    private final RepertoryApplyMapper mapper;
    private final RepertoryApplyListMapper listMapper;

    public RepertoryApplyServiceImpl(RepertoryApplyMapper mapper, RepertoryApplyListMapper listMapper)
    {
        this.mapper = mapper;
        this.listMapper = listMapper;
    }

    @Override
    public String listRepertoryChecker(SessionVO sessionVO)
    {
        List<RepertoryApply> result = mapper.listRepertoryChecker(sessionVO.getMyTeamId(), QMPermissionConstant.REPERTORY_CHECK);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String insertRepertoryApply(SessionVO sessionVO, RepertoryApply apply)
    {
        apply.setApplyId(IDGenerator.generator());
        apply.setApplyStatus(RepertoryConstant.STATUS_CHECK);
        apply.setMyTeamId(sessionVO.getMyTeamId());
        apply.setCreateDate(new Date());

        JSONArray jArr = JSONArray.parseArray(apply.getGoodsInfo());
        for (Object json : jArr)
        {
            RepertoryApplyList applyList = JSONObject.parseObject(json.toString(), RepertoryApplyList.class);
            applyList.setApplyId(apply.getApplyId());

            if (listMapper.insert(applyList) < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);
        }

        if (mapper.insert(apply) < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), apply.getApplyId()));
    }

    @Override
    public String listRepertoryApplyByProposer(SessionVO sessionVO, PageVO pageVO)
    {
        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();

        criteria.andProposerIdEqualTo(sessionVO.getUserId());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        List<RepertoryApply> result = mapper.selectByExample(example);
        result = getApplyList(result);

        int pageCount = PagingUtil.getCount((int) mapper.countByExample(example), pageVO.getPageSize());
        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listRepertoryApplyByApprover(SessionVO sessionVO, PageVO pageVO)
    {
        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();

        criteria.andApproverIdEqualTo(sessionVO.getUserId());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        List<RepertoryApply> result = mapper.selectByExample(example);
        result = getApplyList(result);

        int pageCount = PagingUtil.getCount((int) mapper.countByExample(example), pageVO.getPageSize());
        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    private List<RepertoryApply> getApplyList(List<RepertoryApply> result)
    {
        for (RepertoryApply apply : result)
        {
            RepertoryApplyListExample listExample = new RepertoryApplyListExample();
            RepertoryApplyListExample.Criteria listCriteria = listExample.createCriteria();
            listCriteria.andApplyIdEqualTo(apply.getApplyId());
            apply.setApplyList(listMapper.selectByExample(listExample));
        }
        return result;
    }

    @Override
    public String updateRepertoryApplyAccept(SessionVO sessionVO, RepertoryApply apply)
    {
        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();
        criteria.andApproverIdEqualTo(sessionVO.getUserId());
        criteria.andApplyIdEqualTo(apply.getApplyId());

        List<RepertoryApply> result = mapper.selectByExample(example);

        if (result.size() < 1)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
        else
            apply = result.get(0);

        if (!apply.getApplyStatus().equals(RepertoryConstant.STATUS_CHECK))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        RepertoryApplyListExample listExample = new RepertoryApplyListExample();
        RepertoryApplyListExample.Criteria listCriteria = listExample.createCriteria();
        listCriteria.andApplyIdEqualTo(apply.getApplyId());

        apply.setApplyList(listMapper.selectByExample(listExample));

        for (RepertoryApplyList list : apply.getApplyList())
            if (mapper.countFirstBranchGoods(list.getStandardId(), BranchConstant.BRANCH_FIRST) < list.getStandardCount())
                return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        for (RepertoryApplyList list : apply.getApplyList())
            if (mapper.updateSubFirstBranchGoodsCount(list, sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST) < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);

        apply.setApplyStatus(RepertoryConstant.STATUS_DELIVERED);
        apply.setAcceptDate(new Date());
        mapper.updateByPrimaryKeySelective(apply);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateRepertoryApplyFinish(SessionVO sessionVO, RepertoryApply apply)
    {
        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();
        criteria.andProposerIdEqualTo(sessionVO.getUserId());
        criteria.andApplyIdEqualTo(apply.getApplyId());

        List<RepertoryApply> result = mapper.selectByExample(example);

        if (result.size() < 1)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
        else
            apply = result.get(0);

        if (!apply.getApplyStatus().equals(RepertoryConstant.STATUS_DELIVERED))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        RepertoryApplyListExample listExample = new RepertoryApplyListExample();
        RepertoryApplyListExample.Criteria listCriteria = listExample.createCriteria();
        listCriteria.andApplyIdEqualTo(apply.getApplyId());

        apply.setApplyList(listMapper.selectByExample(listExample));

        for (RepertoryApplyList list : apply.getApplyList())
        {
            if (mapper.countBranchGoodsExists(list.getStandardId(), apply.getBranchId()) < 1)
            {
                if (mapper.saveBranchGoods(list, apply.getBranchId()) < 1)
                    throw new RuntimeException(Constant.STR_ADD_FAILED);
            } else
            {
                if (mapper.updateAddGoodsCount(list, apply.getBranchId()) < 1)
                    throw new RuntimeException(Constant.STR_ADD_FAILED);
            }
        }

        apply.setApplyStatus(RepertoryConstant.STATUS_FINISH);
        mapper.updateByPrimaryKeySelective(apply);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }
}
