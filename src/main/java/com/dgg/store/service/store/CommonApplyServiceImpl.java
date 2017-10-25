package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.CommonApplyDao;
import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.core.FilePathUtil;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
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
    public String insertCommonApplyImage(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        int result = 0;
        StringBuilder path = new StringBuilder();
        String fileName = null;
        String imageId = IDGenerator.generator();

        try
        {
            path.append(PathConstant.COMMON_APPLY_IMAGE).append(sessionVO.getUserId()).append(SymbolConstant.SYSTEM_SLASH);
            realPath = FilePathUtil.getPrevPath(realPath, Constant.PATH_LEVEL);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, IDGenerator.generator());
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
                    for (int i = 0; i < jArray.size(); i++)
                    {
                        image = JSONObject.parseObject(jArray.get(i).toString(), CommonApplyImage.class);
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

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));
    }

    @Override
    public String listCommonApplyByProposer(SessionVO sessionVO, PageVO pageVO)
    {
        CommonApplyExample example = new CommonApplyExample();
        CommonApplyExample.Criteria criteria = example.createCriteria();

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        criteria.andProposerIdEqualTo(sessionVO.getUserId());
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        List<CommonApply> result = dao.selectByExample(example);

        for (CommonApply a : result)
        {
            a.setApproveList(dao.listApprove(a.getApplyId()));
            a.setImageList(dao.listImage(a.getApplyId()));
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String listCommonApplyByApprove(SessionVO sessionVO, PageVO pageVO)
    {
        int pageNum = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int pageSize = pageVO.getPageSize();
        int pageCount = PagingUtil.getCount(dao.countCommonApplyByApprove(sessionVO.getUserId()), pageVO.getPageSize());

        List<CommonApply> result = dao.listCommonApplyByApprove(sessionVO.getUserId(), pageNum, pageSize);

        for (CommonApply a : result)
        {
            a.setApproveList(dao.listApprove(a.getApplyId()));
            a.setImageList(dao.listImage(a.getApplyId()));
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
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
        if (approvePrev != null && !ApplyConstant.APPROVE_RESULT_SUCCESS.equals(approvePrev.getApproveResult()))
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
        if (approvePrev != null && !ApplyConstant.APPROVE_RESULT_SUCCESS.equals(approvePrev.getApproveResult()))
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

}
