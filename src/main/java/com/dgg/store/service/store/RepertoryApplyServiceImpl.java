package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.RepertoryApplyDao;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.umeng.push.PushMessageFactory;
import com.dgg.store.util.core.umeng.push.UMengUtil;
import com.dgg.store.util.pojo.RepertoryApply;
import com.dgg.store.util.pojo.RepertoryApplyExample;
import com.dgg.store.util.pojo.RepertoryApplyList;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class RepertoryApplyServiceImpl implements RepertoryApplyService
{
    @Autowired
    private RepertoryApplyDao dao;

    @Autowired
    private PushMessageMapper mapper;

    @Override
    public String listRepertoryChecker(SessionVO sessionVO)
    {
        List<RepertoryApply> result = dao.listRepertoryChecker(QMPermissionConstant.REPERTORY_CHECK, sessionVO.getMyTeamId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String insertRepertoryApply(SessionVO sessionVO, RepertoryApply apply)
    {
        int result = 1;
        int index = 0;
        int count = 2;
        apply = initApply(sessionVO, apply);

        List<RepertoryApplyList> applyList = new ArrayList<>();
        JSONArray jsonArray = JSONArray.parseArray(apply.getGoodsInfo());

        for (int i = 0; i < jsonArray.size(); i++)
            applyList.add(JSONObject.parseObject(jsonArray.get(i).toString(), RepertoryApplyList.class));

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    apply.setApplyStatus(RepertoryConstant.STATUS_CHECK);
                    apply.setApplyId(IDGenerator.generator());
                    result = dao.insert(apply);
                    break;
                case 1:
                    result = dao.insertApplyList(applyList, apply.getApplyId());
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(dao.getDeviceToken(apply.getApproverId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.REPERTORY_NEW));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), apply.getApplyId()));
    }

    @Override
    public String listRepertoryApplyByProposer(SessionVO sessionVO, PageVO pageVO)
    {
        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();

        example.setStart(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setEnd(pageVO.getPageSize());
        criteria.andProposerIdEqualTo(sessionVO.getUserId());
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        List<RepertoryApply> result = dao.selectByExample(example);
        for (RepertoryApply apply : result)
            apply.setApplyList(dao.listApplyList(apply.getApplyId()));

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listRepertoryApplyByApprover(SessionVO sessionVO, PageVO pageVO)
    {
        RepertoryApplyExample example = new RepertoryApplyExample();
        RepertoryApplyExample.Criteria criteria = example.createCriteria();

        example.setStart(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setEnd(pageVO.getPageSize());
        criteria.andApproverIdEqualTo(sessionVO.getUserId());
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        List<RepertoryApply> result = dao.selectByExample(example);
        for (RepertoryApply apply : result)
            apply.setApplyList(dao.listApplyList(apply.getApplyId()));

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String updateRepertoryApplyAccept(SessionVO sessionVO, RepertoryApply apply)
    {
        int result = 1;
        int index = 0;
        int count = 2;
        int repertory;

        apply = dao.selectByPrimaryKey(apply.getApplyId());
        if (!apply.getApplyStatus().equals(RepertoryConstant.STATUS_CHECK))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        List<RepertoryApplyList> applyList = dao.listApplyList(apply.getApplyId());

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    for (RepertoryApplyList list : applyList)
                    {
                        repertory = dao.getRepertory(list.getStandardId());
                        if (repertory < list.getStandardCount())
                        {
                            result = 0;
                            break;
                        }
                        result = dao.updateGoodsCount(list.getStandardId(), repertory - list.getStandardCount());
                        if (result < 1)
                            break;
                    }
                    break;
                case 1:
                    RepertoryApply record = new RepertoryApply();
                    record.setApplyId(apply.getApplyId());
                    record.setApplyStatus(RepertoryConstant.STATUS_DELIVERED);

                    result = dao.updateByPrimaryKeySelective(record);
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(dao.getDeviceToken(apply.getProposerId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.REPERTORY_PASS));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), apply.getApplyId()));
    }

    @Override
    public String updateRepertoryApplyFinish(SessionVO sessionVO, RepertoryApply apply)
    {
        int result = 1;
        int index = 0;
        int count = 2;
        int repertory;

        apply = dao.selectByPrimaryKey(apply.getApplyId());
        if (!apply.getApplyStatus().equals(RepertoryConstant.STATUS_DELIVERED))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        List<RepertoryApplyList> applyList = dao.listApplyList(apply.getApplyId());

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    for (RepertoryApplyList list : applyList)
                    {
                        repertory = dao.getSecondRepertory(apply.getBranchId(),list.getStandardId());
                        dao.deleteSecondStandard(apply.getBranchId(),list.getStandardId());
                        list.setStandardCount(repertory + list.getStandardCount());
                    }
                    result = dao.insertSecondRepertory(applyList,apply.getBranchId());
                    break;
                case 1:
                    RepertoryApply record = new RepertoryApply();
                    record.setApplyId(apply.getApplyId());
                    record.setApplyStatus(RepertoryConstant.STATUS_FINISH);

                    result = dao.updateByPrimaryKeySelective(record);
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), apply.getApplyId()));
    }


    private RepertoryApply initApply(SessionVO sessionVO, RepertoryApply apply)
    {
        apply.setApplyId(IDGenerator.generator());
        apply.setCreateDate(new Date());
        apply.setMyTeamId(sessionVO.getMyTeamId());

        return apply;
    }
}
