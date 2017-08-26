package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.RepertoryRecordDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.RepertoryConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.RepertoryRecord;
import com.dgg.store.util.pojo.RepertoryRecordExample;
import com.dgg.store.util.pojo.RepertoryRecordList;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class RepertoryRecordServiceImpl implements RepertoryRecordService
{
    @Autowired
    private RepertoryRecordDao dao;

    @Override
    public String updateRepertoryAddFirst(SessionVO sessionVO, RepertoryRecord repertoryRecord)
    {
        repertoryRecord = initRecord(sessionVO, repertoryRecord);
        int result = 1;
        int index = 0;
        int count = 3;
        int repertory = 0;

        List<RepertoryRecordList> recordList = new ArrayList<>();
        JSONArray jsonArray = JSONArray.parseArray(repertoryRecord.getGoodsInfo());
        RepertoryRecordList record = null;
        for (int i = 0; i < jsonArray.size(); i++)
        {
            record = JSONObject.parseObject(jsonArray.get(i).toString(), RepertoryRecordList.class);
            recordList.add(record);
        }

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    for (int i = 0; i < recordList.size(); i++)
                    {
                        record = recordList.get(i);
                        repertory = dao.getRepertory(record.getStandardId());
                        record.setStandardCount(record.getStandardCount() + repertory);
                        result = dao.updateGoodsCount(record);
                        if (result < 1)
                            break;
                    }
                    break;
                case 1:
                    repertoryRecord.setBranchId(Constant.EMPTY);
                    repertoryRecord.setBranchName(Constant.EMPTY);
                    repertoryRecord.setRecordType(RepertoryConstant.TYPE_ADD);
                    result = dao.insert(repertoryRecord);
                    break;
                case 2:
                    result = dao.insertRecordList(recordList, repertoryRecord.getRecordId());
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), repertoryRecord.getRecordId()));
    }

    @Override
    public String updateRepertorySubFirst(SessionVO sessionVO, RepertoryRecord repertoryRecord)
    {
        repertoryRecord = initRecord(sessionVO, repertoryRecord);
        int result = 1;
        int index = 0;
        int count = 3;
        int repertory = 0;

        List<RepertoryRecordList> recordList = new ArrayList<>();
        JSONArray jsonArray = JSONArray.parseArray(repertoryRecord.getGoodsInfo());
        RepertoryRecordList record = null;
        for (int i = 0; i < jsonArray.size(); i++)
        {
            record = JSONObject.parseObject(jsonArray.get(i).toString(), RepertoryRecordList.class);
            recordList.add(record);
        }

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    for (int i = 0; i < recordList.size(); i++)
                    {
                        record = recordList.get(i);
                        repertory = dao.getRepertory(record.getStandardId());
                        record.setStandardCount(repertory - record.getStandardCount());

                        if (record.getStandardCount() < 1)
                            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

                        result = dao.updateGoodsCount(recordList.get(i));
                        if (result < 1)
                            break;
                    }
                    break;
                case 1:
                    repertoryRecord.setBranchId(Constant.EMPTY);
                    repertoryRecord.setBranchName(Constant.EMPTY);
                    repertoryRecord.setRecordType(RepertoryConstant.TYPE_SUB);
                    result = dao.insert(repertoryRecord);
                    break;
                case 2:
                    result = dao.insertRecordList(recordList, repertoryRecord.getRecordId());
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), repertoryRecord.getRecordId()));
    }

    @Override
    public String updateRepertoryAddSecond(SessionVO sessionVO, RepertoryRecord repertoryRecord)
    {
        repertoryRecord = initRecord(sessionVO, repertoryRecord);
        int result = 1;
        int index = 0;
        int count = 3;
        int repertory = 0;

        List<RepertoryRecordList> recordList = new ArrayList<>();
        JSONArray jsonArray = JSONArray.parseArray(repertoryRecord.getGoodsInfo());
        RepertoryRecordList record = null;
        for (int i = 0; i < jsonArray.size(); i++)
        {
            record = JSONObject.parseObject(jsonArray.get(i).toString(), RepertoryRecordList.class);
            recordList.add(record);
        }

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    for (int i = 0; i < recordList.size(); i++)
                    {
                        record = recordList.get(i);
                        repertory = dao.getSecondRepertory(record.getStandardId());
                        record.setStandardCount(repertory + record.getStandardCount());

                        result = dao.updateGoodsSecondCount(recordList.get(i));
                        if (result < 1)
                            break;
                    }
                    break;
                case 1:
                    repertoryRecord.setRecordType(RepertoryConstant.TYPE_ADD);
                    result = dao.insert(repertoryRecord);
                    break;
                case 2:
                    result = dao.insertRecordList(recordList, repertoryRecord.getRecordId());
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), repertoryRecord.getRecordId()));
    }

    @Override
    public String updateRepertorySubSecond(SessionVO sessionVO, RepertoryRecord repertoryRecord)
    {
        repertoryRecord = initRecord(sessionVO, repertoryRecord);
        int result = 1;
        int index = 0;
        int count = 3;
        int repertory = 0;

        List<RepertoryRecordList> recordList = new ArrayList<>();
        JSONArray jsonArray = JSONArray.parseArray(repertoryRecord.getGoodsInfo());
        RepertoryRecordList record = null;
        for (int i = 0; i < jsonArray.size(); i++)
        {
            record = JSONObject.parseObject(jsonArray.get(i).toString(), RepertoryRecordList.class);
            recordList.add(record);
        }

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    for (int i = 0; i < recordList.size(); i++)
                    {
                        record = recordList.get(i);
                        repertory = dao.getSecondRepertory(record.getStandardId());
                        record.setStandardCount(repertory - record.getStandardCount());

                        if (record.getStandardCount() < 1)
                            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

                        result = dao.updateGoodsSecondCount(recordList.get(i));
                        if (result < 1)
                            break;
                    }
                    break;
                case 1:
                    repertoryRecord.setRecordType(RepertoryConstant.TYPE_SUB);
                    result = dao.insert(repertoryRecord);
                    break;
                case 2:
                    result = dao.insertRecordList(recordList, repertoryRecord.getRecordId());
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), repertoryRecord.getRecordId()));
    }

    @Override
    public String listRepertoryRecord(SessionVO sessionVO, RepertoryRecord repertoryRecord, PageVO pageVO)
    {
        RepertoryRecordExample example = new RepertoryRecordExample();
        RepertoryRecordExample.Criteria criteria = example.createCriteria();

        example.setStart(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setEnd(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        criteria.andMyTeamIdEqualTo(sessionVO.getMyTeamId());

        List<RepertoryRecord> result = dao.selectByExample(example);

        for (RepertoryRecord record : result)
            record.setRecordList(dao.getRepertoryRecordList(record.getRecordId()));

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    private RepertoryRecord initRecord(SessionVO sessionVO, RepertoryRecord repertoryRecord)
    {
        repertoryRecord.setRecordId(IDGenerator.generator());
        repertoryRecord.setOperatorId(sessionVO.getUserId());
        repertoryRecord.setMyTeamId(sessionVO.getMyTeamId());
        repertoryRecord.setOperatorName(dao.getUserNameById(sessionVO.getUserId()));
        repertoryRecord.setCreateDate(new Date());

        return repertoryRecord;
    }
}
