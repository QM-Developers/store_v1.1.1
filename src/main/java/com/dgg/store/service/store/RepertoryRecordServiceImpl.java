package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dgg.store.dao.store.RepertoryRecordDao;
import com.dgg.store.mapper.RepertoryRecordListMapper;
import com.dgg.store.util.core.constant.BranchConstant;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.RepertoryConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.pojo.RepertoryRecord;
import com.dgg.store.util.pojo.RepertoryRecordExample;
import com.dgg.store.util.pojo.RepertoryRecordList;
import com.dgg.store.util.pojo.RepertoryRecordListExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class RepertoryRecordServiceImpl implements RepertoryRecordService
{
    private final RepertoryRecordDao dao;
    private final RepertoryRecordListMapper mapper;

    public RepertoryRecordServiceImpl(RepertoryRecordDao dao, RepertoryRecordListMapper mapper)
    {
        this.dao = dao;
        this.mapper = mapper;
    }

//    @Override
//    public String updateRepertoryAddFirst(SessionVO sessionVO, RepertoryRecord repertoryRecord)
//    {
//        repertoryRecord = initRecord(sessionVO, repertoryRecord);
//        int result = 1;
//        int index = 0;
//        int count = 3;
//        int repertory = 0;
//
//        List<RepertoryRecordList> recordList = new ArrayList<>();
//        JSONArray jsonArray = JSONArray.parseArray(repertoryRecord.getGoodsInfo());
//        RepertoryRecordList record = null;
//        for (int i = 0; i < jsonArray.size(); i++)
//        {
//            record = JSONObject.parseObject(jsonArray.get(i).toString(), RepertoryRecordList.class);
//            recordList.add(record);
//        }
//
//        while (result > 0)
//        {
//            switch (index)
//            {
//                case 0:
//                    for (int i = 0; i < recordList.size(); i++)
//                    {
//                        record = recordList.get(i);
//                        repertory = dao.getRepertory(record.getStandardId());
//                        record.setStandardCount(record.getStandardCount() + repertory);
//                        result = dao.updateGoodsCount(record);
//                        if (result < 1)
//                            break;
//                    }
//                    break;
//                case 1:
//                    repertoryRecord.setBranchId(Constant.EMPTY);
//                    repertoryRecord.setBranchName(Constant.EMPTY);
//                    repertoryRecord.setRecordType(RepertoryConstant.TYPE_ADD);
//                    result = dao.insert(repertoryRecord);
//                    break;
//                case 2:
//                    result = dao.insertRecordList(recordList, repertoryRecord.getRecordId());
//                    break;
//                default:
//                    result = 0;
//                    break;
//            }
//            index++;
//        }
//
//        if (index - 1 < count)
//            throw new RuntimeException(Constant.STR_ADD_FAILED);
//
//        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), repertoryRecord.getRecordId()));
//    }
//
//    @Override
//    public String updateRepertorySubFirst(SessionVO sessionVO, RepertoryRecord repertoryRecord)
//    {
//        repertoryRecord = initRecord(sessionVO, repertoryRecord);
//        int result = 1;
//        int index = 0;
//        int count = 3;
//        int repertory = 0;
//
//        List<RepertoryRecordList> recordList = new ArrayList<>();
//        JSONArray jsonArray = JSONArray.parseArray(repertoryRecord.getGoodsInfo());
//        RepertoryRecordList record = null;
//        for (int i = 0; i < jsonArray.size(); i++)
//        {
//            record = JSONObject.parseObject(jsonArray.get(i).toString(), RepertoryRecordList.class);
//            recordList.add(record);
//        }
//
//        while (result > 0)
//        {
//            switch (index)
//            {
//                case 0:
//                    for (int i = 0; i < recordList.size(); i++)
//                    {
//                        record = recordList.get(i);
//                        repertory = dao.getRepertory(record.getStandardId());
//                        record.setStandardCount(repertory - record.getStandardCount());
//
//                        if (record.getStandardCount() < 1)
//                            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
//
//                        result = dao.updateGoodsCount(recordList.get(i));
//                        if (result < 1)
//                            break;
//                    }
//                    break;
//                case 1:
//                    repertoryRecord.setBranchId(Constant.EMPTY);
//                    repertoryRecord.setBranchName(Constant.EMPTY);
//                    repertoryRecord.setRecordType(RepertoryConstant.TYPE_SUB);
//                    result = dao.insert(repertoryRecord);
//                    break;
//                case 2:
//                    result = dao.insertRecordList(recordList, repertoryRecord.getRecordId());
//                    break;
//                default:
//                    result = 0;
//                    break;
//            }
//            index++;
//        }
//
//        if (index - 1 < count)
//            throw new RuntimeException(Constant.STR_ADD_FAILED);
//
//        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), repertoryRecord.getRecordId()));
//    }
//
//    @Override
//    public String updateRepertoryAddSecond(SessionVO sessionVO, RepertoryRecord repertoryRecord)
//    {
//        repertoryRecord = initRecord(sessionVO, repertoryRecord);
//        int result = 1;
//        int index = 0;
//        int count = 3;
//        int repertory = 0;
//
//        List<RepertoryRecordList> recordList = new ArrayList<>();
//        JSONArray jsonArray = JSONArray.parseArray(repertoryRecord.getGoodsInfo());
//        RepertoryRecordList record = null;
//        for (int i = 0; i < jsonArray.size(); i++)
//        {
//            record = JSONObject.parseObject(jsonArray.get(i).toString(), RepertoryRecordList.class);
//            recordList.add(record);
//        }
//
//        while (result > 0)
//        {
//            switch (index)
//            {
//                case 0:
//                    for (int i = 0; i < recordList.size(); i++)
//                    {
//                        record = recordList.get(i);
//                        repertory = dao.getSecondRepertory(record.getStandardId());
//                        record.setStandardCount(repertory + record.getStandardCount());
//
//                        result = dao.updateGoodsSecondCount(recordList.get(i));
//                        if (result < 1)
//                            break;
//                    }
//                    break;
//                case 1:
//                    repertoryRecord.setRecordType(RepertoryConstant.TYPE_ADD);
//                    result = dao.insert(repertoryRecord);
//                    break;
//                case 2:
//                    result = dao.insertRecordList(recordList, repertoryRecord.getRecordId());
//                    break;
//                default:
//                    result = 0;
//                    break;
//            }
//            index++;
//        }
//
//        if (index - 1 < count)
//            throw new RuntimeException(Constant.STR_ADD_FAILED);
//
//        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), repertoryRecord.getRecordId()));
//    }
//
//    @Override
//    public String updateRepertorySubSecond(SessionVO sessionVO, RepertoryRecord repertoryRecord)
//    {
//        repertoryRecord = initRecord(sessionVO, repertoryRecord);
//        int result = 1;
//        int index = 0;
//        int count = 3;
//        int repertory = 0;
//
//        List<RepertoryRecordList> recordList = new ArrayList<>();
//        JSONArray jsonArray = JSONArray.parseArray(repertoryRecord.getGoodsInfo());
//        RepertoryRecordList record = null;
//        for (int i = 0; i < jsonArray.size(); i++)
//        {
//            record = JSONObject.parseObject(jsonArray.get(i).toString(), RepertoryRecordList.class);
//            recordList.add(record);
//        }
//
//        while (result > 0)
//        {
//            switch (index)
//            {
//                case 0:
//                    for (int i = 0; i < recordList.size(); i++)
//                    {
//                        record = recordList.get(i);
//                        repertory = dao.getSecondRepertory(record.getStandardId());
//                        record.setStandardCount(repertory - record.getStandardCount());
//
//                        if (record.getStandardCount() < 1)
//                            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
//
//                        result = dao.updateGoodsSecondCount(recordList.get(i));
//                        if (result < 1)
//                            break;
//                    }
//                    break;
//                case 1:
//                    repertoryRecord.setRecordType(RepertoryConstant.TYPE_SUB);
//                    result = dao.insert(repertoryRecord);
//                    break;
//                case 2:
//                    result = dao.insertRecordList(recordList, repertoryRecord.getRecordId());
//                    break;
//                default:
//                    result = 0;
//                    break;
//            }
//            index++;
//        }
//
//        if (index - 1 < count)
//            throw new RuntimeException(Constant.STR_ADD_FAILED);
//
//        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), repertoryRecord.getRecordId()));
//    }

    @Override
    public String listRepertoryRecord(SessionVO sessionVO, RepertoryRecord repertoryRecord, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        RepertoryRecordExample example = new RepertoryRecordExample();
        RepertoryRecordExample.Criteria criteria = example.createCriteria();

//        repertoryRecord.setBranchId(StringUtil.isEmpty(repertoryRecord.getBranchId()) ? null : repertoryRecord.getRecordId());

        example.setOrderByClause("create_date DESC");
        example.setStart(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setEnd(pageVO.getPageSize());

        if (!StringUtil.isEmpty(repertoryRecord.getBranchId()))
            criteria.andBranchIdEqualTo(repertoryRecord.getBranchId());

        if (repertoryRecord.getCreateDate() != null && repertoryRecord.getFinishDate() != null)
            criteria.andCreateDateBetween(repertoryRecord.getCreateDate(), repertoryRecord.getFinishDate());
        criteria.andMyTeamIdEqualTo(sessionVO.getMyTeamId());

        List<RepertoryRecord> result = dao.selectByExample(example);
        result = getRecord(result, sessionVO);

        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result, pageCount), SerializerFeature.WriteNullStringAsEmpty);
    }

    private List<RepertoryRecord> getRecord(List<RepertoryRecord> result, SessionVO sessionVO)
    {
        for (RepertoryRecord record : result)
        {
            RepertoryRecordListExample listExample = new RepertoryRecordListExample();
            RepertoryRecordListExample.Criteria listCriteria = listExample.createCriteria();
            listCriteria.andRecordIdEqualTo(record.getRecordId());
            List<RepertoryRecordList> recordLists = mapper.selectByExample(listExample);
            recordLists = getRecordList(recordLists, sessionVO);

            record.setRecordList(recordLists);
        }

        return result;
    }

    private List<RepertoryRecordList> getRecordList(List<RepertoryRecordList> recordLists, SessionVO sessionVO)
    {
        for (RepertoryRecordList recordList : recordLists)
        {
            recordList.setGoodsImage(mapper.getGoodsImage(recordList.getGoodsId()));
            recordList.setGoodsCode(mapper.getGoodsCode(recordList.getGoodsId()));
            recordList.setCurrentCount(mapper.getStandardCount(recordList.getStandardId(), sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST));
            recordList.setGoodsType(mapper.getGoodsType(recordList.getGoodsId()));
        }
        return recordLists;
    }

    @Override
    public String updateRepertory(SessionVO sessionVO, RepertoryRecord repertoryRecord)
    {
        repertoryRecord.setRecordCode(getRecordCode(0, repertoryRecord.getBranchId()));
        if (repertoryRecord.getRecordCode() == null)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        repertoryRecord.setMyTeamId(sessionVO.getMyTeamId());
        repertoryRecord.setOperatorId(sessionVO.getUserId());
        repertoryRecord.setOperatorName(dao.getUserName(sessionVO.getUserId()));
        repertoryRecord.setRecordId(IDGenerator.generator());
        repertoryRecord.setCreateDate(new Date());
        repertoryRecord.setRecordRemark(ParameterUtil.getDefault(repertoryRecord.getRecordRemark(), Constant.EMPTY));
        List<RepertoryRecordList> recordList = new ArrayList<>();
        JSONArray jsonArray = JSONArray.parseArray(repertoryRecord.getGoodsInfo());
        RepertoryRecordList record;
        for (Object json : jsonArray)
        {
            record = JSONObject.parseObject(json.toString(), RepertoryRecordList.class);
            recordList.add(record);
        }

        for (RepertoryRecordList list : recordList)
        {
            list.setRecordId(repertoryRecord.getRecordId());
            if (dao.insertRecordList(list) < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);

            int count = dao.getGoodsCount(repertoryRecord.getBranchId(), list.getStandardId());
            count = list.getRecordType().equals(RepertoryConstant.TYPE_ADD) ? count + list.getStandardCount() : count - list.getStandardCount();

            if (count < 0)
                return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

            list.setStandardCount(count);

            if (dao.branchGoodsExists(repertoryRecord.getBranchId(), list.getStandardId()) < 1)
            {
                if (dao.insertBranchGoods(list, repertoryRecord.getBranchId()) < 1)
                    throw new RuntimeException(Constant.STR_ADD_FAILED);
            } else
            {
                if (dao.updateGoodsCount(repertoryRecord.getBranchId(), list.getStandardId(), count) < 1)
                    throw new RuntimeException(Constant.STR_ADD_FAILED);
            }
        }
        if (dao.insert(repertoryRecord) < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), repertoryRecord.getRecordId()));
    }

    @Override
    public String getRepertoryRecord(SessionVO sessionVO, RepertoryRecord repertoryRecord)
    {
        RepertoryRecord result = dao.selectByPrimaryKey(repertoryRecord.getRecordId());

        RepertoryRecordListExample listExample = new RepertoryRecordListExample();
        RepertoryRecordListExample.Criteria listCriteria = listExample.createCriteria();

        listCriteria.andRecordIdEqualTo(result.getRecordId());

        List<RepertoryRecordList> recordLists = mapper.selectByExample(listExample);
        recordLists = getRecordList(recordLists, sessionVO);

        result.setRecordList(recordLists);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result),SerializerFeature.WriteNullStringAsEmpty);
    }

    @Override
    public String listCurrentRepertoryRecord(SessionVO sessionVO, RepertoryRecord repertoryRecord, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        String branchId = dao.getCurrentBranchId(sessionVO.getUserId());

        repertoryRecord.setBranchId(branchId);
        RepertoryRecordExample example = new RepertoryRecordExample();
        RepertoryRecordExample.Criteria criteria = example.createCriteria();

        example.setOrderByClause("create_date DESC");
        example.setStart(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setEnd(pageVO.getPageSize());
        criteria.andBranchIdEqualTo(branchId);
        criteria.andMyTeamIdEqualTo(sessionVO.getMyTeamId());

        if (repertoryRecord.getCreateDate() != null && repertoryRecord.getFinishDate() != null)
            criteria.andCreateDateBetween(repertoryRecord.getCreateDate(), repertoryRecord.getFinishDate());

        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        List<RepertoryRecord> result = dao.selectByExample(example);
        result = getRecord(result, sessionVO);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result, pageCount), SerializerFeature.WriteNullStringAsEmpty);
    }

    private String getRecordCode(int i, String branchId)
    {
        String recordCode = IDGenerator.getNow() + String.format("%04d", (int) (Math.random() * 10000));
        RepertoryRecordExample example = new RepertoryRecordExample();
        RepertoryRecordExample.Criteria criteria = example.createCriteria();

        criteria.andRecordCodeEqualTo(recordCode);
        criteria.andBranchIdEqualTo(branchId);

        if (i > 10)
            return null;

        if (dao.countByExample(example) > 0)
            getRecordCode(i++, branchId);

        return recordCode;
    }

//    private RepertoryRecord initRecord(SessionVO sessionVO, RepertoryRecord repertoryRecord)
//    {
//        repertoryRecord.setRecordId(IDGenerator.generator());
//        repertoryRecord.setOperatorId(sessionVO.getUserId());
//        repertoryRecord.setMyTeamId(sessionVO.getMyTeamId());
//        repertoryRecord.setOperatorName(dao.getUserNameById(sessionVO.getUserId()));
//        repertoryRecord.setCreateDate(new Date());
//
//        return repertoryRecord;
//    }

}
