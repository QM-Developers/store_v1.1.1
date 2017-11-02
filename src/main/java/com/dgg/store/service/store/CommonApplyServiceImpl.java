package com.dgg.store.service.store;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dgg.store.dao.store.CommonApplyDao;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.core.umeng.push.PushMessageFactory;
import com.dgg.store.util.core.umeng.push.UMengUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.pojo.CommonApply;
import com.dgg.store.util.pojo.CommonApplyApprove;
import com.dgg.store.util.pojo.CommonApplyExample;
import com.dgg.store.util.pojo.CommonApplyImage;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CommonApplyServiceImpl implements CommonApplyService
{
    @Autowired
    private CommonApplyDao dao;
    @Autowired
    private PushMessageMapper mapper;

    @Override
    public String insertCommonApplyImage(SessionVO sessionVO, MultipartFile file)
    {
        int result = 0;
        StringBuilder path = new StringBuilder();
        String fileName = null;
        String imageId = IDGenerator.generator();

        try
        {
            path.append(PathConstant.COMMON_APPLY_IMAGE).append(sessionVO.getUserId()).append(SymbolConstant.FORWARD_SLASH);
            fileName = PathConstant.IMAGE_SERVER_NAME + UploadFileUtil.doUpload(file, path.toString(), PathConstant.UPLOAD_BASE_PATH, IDGenerator.generator());
            result = dao.insertCommonApplyImage(imageId, fileName);
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken(), imageId));
    }

    @Override
    public String insertCommonApply(SessionVO sessionVO, CommonApply apply)
    {
        int result = 1;
        int index = 0;
        int count = 3;
        JSONArray jArray;
        CommonApplyApprove approve;
        CommonApplyImage image;
        String approveId = "";

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    apply.setApplyId(IDGenerator.generator());
                    apply.setProposerId(sessionVO.getUserId());
                    apply.setProposerName(dao.getUserNameById(sessionVO.getUserId()));
                    apply.setCreateDate(new Date());
                    apply.setApplyResult(ApplyConstant.APPLY_RESULT_APPROVING);
                    result = dao.insertSelective(apply);
                    break;
                case 1:
                    jArray = JSONArray.parseArray(apply.getCommonApplyApprove());
                    for (int i = 0; i < jArray.size(); i++)
                    {
                        approve = JSONObject.parseObject(jArray.get(i).toString(), CommonApplyApprove.class);
                        approve.setApproveAdvice(ParameterUtil.getDefault(approve.getApproveAdvice(), Constant.EMPTY));
                        approve.setApplyId(apply.getApplyId());
                        approve.setApproveResult(ApplyConstant.APPROVE_RESULT_APPROVING);
                        approve.setApproveAdvice(StringUtil.isEmpty(approve.getApproveAdvice()) ? Constant.EMPTY : approve.getApproveAdvice());
                        result = dao.insertApprove(approve);
                        if (result < 1)
                            throw new RuntimeException(Constant.STR_ADD_FAILED);
                        if (i == 0)
                            approveId = approve.getApproveId();
                    }
                    break;
                case 2:
                    jArray = JSONArray.parseArray(apply.getCommonApplyImage());
                    if (jArray == null)
                        break;
                    for (Object aJArray : jArray)
                    {
                        image = JSONObject.parseObject(aJArray.toString(), CommonApplyImage.class);
                        image.setApplyId(apply.getApplyId());
                        result = dao.updateImage(image);
                        if (result < 1)
                            throw new RuntimeException(Constant.STR_ADD_FAILED);
                    }
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(dao.getDeviceToken(approveId), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.APPLY_NEW));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), apply.getApplyId()));
    }

    @Override
    public String listCommonApplyByProposer(SessionVO sessionVO, CommonApply apply, PageVO pageVO)
    {
        CommonApplyExample example = new CommonApplyExample();
        CommonApplyExample.Criteria criteria = example.createCriteria();

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        example.setOrderByClause("create_date DESC");
        criteria.andProposerIdEqualTo(sessionVO.getUserId());
        if (apply.getApplyResult() != null)
            criteria.andApplyResultIn(getStatusList(apply.getApplyResult()));
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        List<CommonApply> result = dao.selectByExample(example);

        result = listParams(result);

        ResultVO resultVO = new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result, pageCount);

        return JSON.toJSONString(resultVO, SerializerFeature.WriteNullStringAsEmpty);
    }

    private List<CommonApply> listParams(List<CommonApply> result)
    {
        for (CommonApply a : result)
        {
            a.setUserImage(dao.getUserImage(a.getProposerId()));
            List<CommonApplyApprove> approveList = dao.listApprove(a.getApplyId());
            for (CommonApplyApprove approve : approveList)
                approve.setUserImage(dao.getUserImage(approve.getApproveId()));
            a.setApproveList(approveList);
            a.setImageList(dao.listImage(a.getApplyId()));
        }
        return result;
    }

    @Override
    public String listCommonApplyByApprove(SessionVO sessionVO, CommonApply apply, PageVO pageVO)
    {
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();
        int pageCount = PagingUtil.getCount(dao.countCommonApplyByApprove(sessionVO.getUserId()), pageVO.getPageSize());

        List<Byte> statusList = getStatusList(apply.getApplyResult());

        List<CommonApply> result = dao.listCommonApplyByApprove(sessionVO.getUserId(), statusList, pageNum, pageSize);

        result = listParams(result);

        ResultVO resultVO = new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result, pageCount);

        return JSON.toJSONString(resultVO, SerializerFeature.WriteNullStringAsEmpty);
    }

    private List<Byte> getStatusList(Byte applyResult)
    {
        List<Byte> statusList = new ArrayList<>();

        if (applyResult == null)
            return statusList;

        switch (applyResult)
        {
            case ApplyConstant.APPLY_RESULT_PROCESSED:
                statusList.add(ApplyConstant.APPLY_RESULT_SUCCESS);
                statusList.add(ApplyConstant.APPLY_RESULT_FAILED);
                break;
            default:
                statusList.add(applyResult);
                break;
        }

        return statusList;
    }

    @Override
    public String updateCommonApplyAccept(SessionVO sessionVO, CommonApplyApprove approve)
    {
        int result = 0;

        CommonApply apply = dao.selectByPrimaryKey(approve.getApplyId());
        if (!apply.getApplyResult().equals(ApplyConstant.APPLY_RESULT_APPROVING))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        CommonApplyApprove condition = new CommonApplyApprove();
        condition.setApplyId(approve.getApplyId());
        condition.setApproveId(sessionVO.getUserId());
        condition.setApproveSequence(approve.getApproveSequence());

        String advice = approve.getApproveAdvice();
        approve = dao.getApplyApprove(condition);

        if (approve == null)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        approve.setApproveAdvice(advice);
        condition.setApproveId(null);
        condition.setApproveSequence((byte) (approve.getApproveSequence() - 1));
        CommonApplyApprove approvePrev = dao.getApplyApprove(condition);
        condition.setApproveSequence((byte) (approve.getApproveSequence() + 1));
        CommonApplyApprove approveNext = dao.getApplyApprove(condition);


        if (!approve.getApproveResult().equals(ApplyConstant.APPROVE_RESULT_APPROVING))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
        if (approvePrev != null && (ApplyConstant.APPROVE_RESULT_SUCCESS != approvePrev.getApproveResult()))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        approve.setApproveResult(ApplyConstant.APPROVE_RESULT_SUCCESS);
        result = dao.updateCommonApproveResult(approve);
        if (result < 1)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        if (approveNext == null)
        {
            CommonApply applySelective = new CommonApply();
            applySelective.setApplyId(approve.getApplyId());
            applySelective.setApplyResult(ApplyConstant.APPLY_RESULT_SUCCESS);
            result = dao.updateByPrimaryKeySelective(applySelective);
            if (result < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);
            UMengUtil.sendUnicast(dao.getDeviceToken(apply.getProposerId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.APPLY_PASS));
        } else
            UMengUtil.sendUnicast(dao.getDeviceToken(approveNext.getApproveId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.APPLY_NEW));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String updateCommonApplyRefuse(SessionVO sessionVO, CommonApplyApprove approve)
    {
        int result = 0;

        CommonApply apply = dao.selectByPrimaryKey(approve.getApplyId());
        if (!apply.getApplyResult().equals(ApplyConstant.APPLY_RESULT_APPROVING))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        CommonApplyApprove condition = new CommonApplyApprove();
        condition.setApplyId(approve.getApplyId());
        condition.setApproveId(sessionVO.getUserId());
        condition.setApproveSequence(approve.getApproveSequence());

        String advice = approve.getApproveAdvice();
        approve = dao.getApplyApprove(condition);

        if (approve == null)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        approve.setApproveAdvice(advice);
        condition.setApproveId(null);
        condition.setApproveSequence((byte) (approve.getApproveSequence() - 1));
        CommonApplyApprove approvePrev = dao.getApplyApprove(condition);

        if (!approve.getApproveResult().equals(ApplyConstant.APPROVE_RESULT_APPROVING))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
        if (approvePrev != null && (ApplyConstant.APPROVE_RESULT_SUCCESS == approvePrev.getApproveResult()))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        approve.setApproveResult(ApplyConstant.APPROVE_RESULT_FAILED);
        result = dao.updateCommonApproveResult(approve);
        if (result < 1)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        CommonApply applySelective = new CommonApply();
        applySelective.setApplyId(approve.getApplyId());
        applySelective.setApplyResult(ApplyConstant.APPLY_RESULT_FAILED);
        result = dao.updateByPrimaryKeySelective(applySelective);
        if (result < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        UMengUtil.sendUnicast(dao.getDeviceToken(apply.getProposerId()), PushMessageFactory.getInstance(mapper).get(PushMessageConstant.APPLY_REFUSE));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String getCommonApply(SessionVO sessionVO, CommonApply apply)
    {
        CommonApply result = dao.selectByPrimaryKey(apply.getApplyId());

        result.setUserImage(dao.getUserImage(result.getProposerId()));
        List<CommonApplyApprove> approveList = dao.listApprove(result.getApplyId());
        boolean flag = false;
        boolean b;

        CommonApplyApprove prev = new CommonApplyApprove();
        for (int i = 0; i < approveList.size(); i++)
        {
            CommonApplyApprove approve = approveList.get(i);
            approve.setUserImage(dao.getUserImage(approve.getApproveId()));
            approve.setDepartmentName(dao.getDepartmentName(approve.getApproveId()));

            if (i == 0)
            {
                b = ApplyConstant.APPROVE_RESULT_APPROVING == approve.getApproveResult();
                b &= sessionVO.getUserId().equals(approve.getApproveId());
                approve.setApprove((byte) (b ? 1 : 2));
                if (b)
                    flag = true;
            } else
            {
                b = prev.getApproveResult() != null && ApplyConstant.APPROVE_RESULT_APPROVING != prev.getApproveResult();
                b &= prev.getApprove() != null && 1 != prev.getApprove();
                b &= sessionVO.getUserId().equals(approve.getApproveId());
                b &= approve.getApproveResult() != null && ApplyConstant.APPROVE_RESULT_APPROVING == approve.getApproveResult();
                approve.setApprove((byte) (b ? 1 : 2));
                if (b)
                    flag = true;
            }

            prev = approve;
        }

        result.setApprove((byte) (flag ? 1 : 2));
        result.setApproveList(approveList);
        result.setImageList(dao.listImage(result.getApplyId()));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result), SerializerFeature.WriteNullStringAsEmpty);
    }

}
