package com.dgg.store.service.store;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dgg.store.mapper.RepertoryApplyListMapper;
import com.dgg.store.mapper.RepertoryApplyMapper;
import com.dgg.store.util.core.constant.BranchConstant;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.QMPermissionConstant;
import com.dgg.store.util.core.constant.RepertoryConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.pojo.RepertoryApply;
import com.dgg.store.util.pojo.RepertoryApplyExample;
import com.dgg.store.util.pojo.RepertoryApplyList;
import com.dgg.store.util.pojo.RepertoryApplyListExample;
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
        apply.setApplyCode(getRecordCode(0, apply.getBranchId()));
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
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();

        criteria.andProposerIdEqualTo(sessionVO.getUserId());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        List<RepertoryApply> result = mapper.selectByExample(example);
        result = getApplyList(result, sessionVO);

        int pageCount = PagingUtil.getCount((int) mapper.countByExample(example), pageVO.getPageSize());
        ResultVO resultVO = new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result);
        resultVO.setPageCount(pageCount);

        return JSON.toJSONString(resultVO, SerializerFeature.WriteNullStringAsEmpty);
    }

    @Override
    public String listRepertoryApplyByApprover(SessionVO sessionVO, RepertoryApply apply, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();

        criteria.andApproverIdEqualTo(sessionVO.getUserId());
        if (apply.getCreateDate() != null && apply.getFinishDate() != null)
            criteria.andCreateDateBetween(apply.getCreateDate(), apply.getFinishDate());
        if (!StringUtil.isEmpty(apply.getBranchId()))
            criteria.andBranchIdEqualTo(apply.getBranchId());
        if (apply.getApplyStatus() != null)
            criteria.andApplyStatusEqualTo(apply.getApplyStatus());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        List<RepertoryApply> result = mapper.selectByExample(example);
        result = getApplyList(result, sessionVO);

        int pageCount = PagingUtil.getCount((int) mapper.countByExample(example), pageVO.getPageSize());
        ResultVO resultVO = new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result);
        resultVO.setPageCount(pageCount);

        return JSON.toJSONString(resultVO, SerializerFeature.WriteNullStringAsEmpty);
    }

    private List<RepertoryApply> getApplyList(List<RepertoryApply> result, SessionVO sessionVO)
    {
        for (RepertoryApply apply : result)
        {
            RepertoryApplyListExample listExample = new RepertoryApplyListExample();
            RepertoryApplyListExample.Criteria listCriteria = listExample.createCriteria();
            listCriteria.andApplyIdEqualTo(apply.getApplyId());
            List<RepertoryApplyList> applyLists = listMapper.selectByExample(listExample);

            for (RepertoryApplyList applyList : applyLists)
            {
                applyList.setGoodsImage(mapper.getGoodsImage(applyList.getGoodsId()));
                applyList.setGoodsCode(mapper.getGoodsCode(applyList.getGoodsId()));
                applyList.setCurrentCount(mapper.getStandardCount(applyList.getStandardId(), sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST));
                applyList.setGoodsType(mapper.getGoodsType(applyList.getGoodsId()));
            }

            apply.setApplyList(applyLists);
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
        apply.setReceiveDate(new Date());
        mapper.updateByPrimaryKeySelective(apply);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String getRepertoryApply(SessionVO sessionVO, RepertoryApply apply)
    {
        apply = mapper.selectByPrimaryKey(apply.getApplyId());
        List<RepertoryApply> result = new ArrayList<>();
        result.add(apply);
        getApplyList(result, sessionVO);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result.get(0)));
    }

    @Override
    public String listRepertoryApply(SessionVO sessionVO, RepertoryApply apply, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();

        criteria.andMyTeamIdEqualTo(sessionVO.getMyTeamId());
        if (apply.getCreateDate() != null && apply.getFinishDate() != null)
            criteria.andCreateDateBetween(apply.getCreateDate(), apply.getFinishDate());
        if (!StringUtil.isEmpty(apply.getBranchId()))
            criteria.andBranchIdEqualTo(apply.getBranchId());
        if (apply.getApplyStatus() != null)
            criteria.andApplyStatusEqualTo(apply.getApplyStatus());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        List<RepertoryApply> result = mapper.selectByExample(example);
        result = getApplyList(result, sessionVO);

        int pageCount = PagingUtil.getCount((int) mapper.countByExample(example), pageVO.getPageSize());
        ResultVO resultVO = new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result);
        resultVO.setPageCount(pageCount);

        return JSON.toJSONString(resultVO, SerializerFeature.WriteNullStringAsEmpty);
    }

    @Override
    public String listCurrentRepertoryApply(SessionVO sessionVO, RepertoryApply apply, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        String branchId = mapper.getCurrentBranchId(sessionVO.getUserId());
        if (StringUtil.isEmpty(branchId))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();


        criteria.andBranchIdEqualTo(branchId);
        if (apply.getCreateDate() != null && apply.getFinishDate() != null)
            criteria.andCreateDateBetween(apply.getCreateDate(), apply.getFinishDate());
        if (!StringUtil.isEmpty(apply.getBranchId()))
            criteria.andBranchIdEqualTo(apply.getBranchId());
        if (apply.getApplyStatus() != null)
            criteria.andApplyStatusEqualTo(apply.getApplyStatus());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        List<RepertoryApply> result = mapper.selectByExample(example);
        result = getApplyList(result, sessionVO);

        int pageCount = PagingUtil.getCount((int) mapper.countByExample(example), pageVO.getPageSize());
        ResultVO resultVO = new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result);
        resultVO.setPageCount(pageCount);

        return JSON.toJSONString(resultVO, SerializerFeature.WriteNullStringAsEmpty);
    }

    private String getRecordCode(int i, String branchId)
    {
        String recordCode = IDGenerator.getNow() + String.format("%04d", (int) (Math.random() * 10000));
        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();

        criteria.andApplyCodeEqualTo(recordCode);
        criteria.andBranchIdEqualTo(branchId);

        if (i > 10)
            return null;

        if (mapper.countByExample(example) > 0)
            getRecordCode(i++, branchId);

        return recordCode;
    }
}
