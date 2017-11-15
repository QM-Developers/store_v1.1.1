package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dgg.store.mapper.RepertoryIncomeListMapper;
import com.dgg.store.mapper.RepertoryIncomeMapper;
import com.dgg.store.util.core.constant.BranchConstant;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.pojo.*;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class RepertoryIncomeServiceImpl implements RepertoryIncomeService
{
    private final RepertoryIncomeMapper mapper;
    private final RepertoryIncomeListMapper listMapper;

    public RepertoryIncomeServiceImpl(RepertoryIncomeMapper mapper, RepertoryIncomeListMapper listMapper)
    {
        this.mapper = mapper;
        this.listMapper = listMapper;
    }

    @Override
    public String saveRepertoryIncome(SessionVO sessionVO, RepertoryIncome income)
    {
        income.setBranchId(mapper.getFirstBranchId(sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST));
        income.setRecordId(IDGenerator.generator());
        income.setCreateDate(new Date());
        income.setRecordCode(getRecordCode(0, income.getBranchId()));
        income.setMyTeamId(sessionVO.getMyTeamId());
        income.setOperatorId(sessionVO.getUserId());
        income.setOperatorName(sessionVO.getUserName());
        income.setRecordRemark(ParameterUtil.getDefault(income.getApplyRemark(), Constant.EMPTY));
        JSONArray jArr = JSONArray.parseArray(income.getGoodsInfo());

        for (Object json : jArr)
        {
            RepertoryIncomeList incomeList = JSONObject.parseObject(json.toString(), RepertoryIncomeList.class);
            incomeList.setRecordId(income.getRecordId());
            if (listMapper.insert(incomeList) < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);
            if (mapper.countBranchGoodsExists(income.getBranchId(), incomeList.getStandardId()) < 1)
            {
                if (mapper.saveBranchGoods(incomeList, income.getBranchId()) < 1)
                    throw new RuntimeException(Constant.STR_ADD_FAILED);
            } else
            {
                if (mapper.updateGoodsCount(incomeList, income.getBranchId()) < 1)
                    throw new RuntimeException(Constant.STR_ADD_FAILED);
            }
        }

        if (mapper.insert(income) < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), income.getRecordId()));
    }

    @Override
    public String listRepertoryIncome(SessionVO sessionVO, RepertoryIncome income, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        if (StringUtil.isEmpty(income.getBranchId()))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        RepertoryIncomeExample example = new RepertoryIncomeExample();
        RepertoryIncomeExample.Criteria criteria = example.createCriteria();

        if (income.getCreateDate() != null && income.getFinishDate() != null)
            criteria.andCreateDateBetween(income.getCreateDate(), income.getFinishDate());

        example.setOrderByClause("create_date DESC");
        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        criteria.andBranchIdEqualTo(income.getBranchId());

        int pageCount = PagingUtil.getCount((int) mapper.countByExample(example), pageVO.getPageSize());

        List<RepertoryIncome> result = mapper.selectByExample(example);
        result = getIncome(sessionVO, result);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result,pageCount), SerializerFeature.WriteNullStringAsEmpty);
    }

    private List<RepertoryIncomeList> dataTransform(List<RepertoryIncomeList> incomeLists)
    {
        List<RepertoryIncomeList> resultLists = new ArrayList<>();
        resultLists.addAll(incomeLists);

        for (RepertoryIncomeList resultList : resultLists)
        {
            List<GoodsStandard> standardList = new ArrayList<>();
            for (int j = 0; j < incomeLists.size(); j++)
            {
                if (resultList.getGoodsId().equals(incomeLists.get(j).getGoodsId()))
                {
                    RepertoryIncomeList item = incomeLists.remove(j);
                    GoodsStandard standard = new GoodsStandard();
                    standard.setStandardId(item.getStandardId());
                    standard.setStandardName(item.getStandardName());
                    standard.setStandardCount(item.getStandardCount());
                    standardList.add(standard);
                    j--;
                }
            }
            resultList.setStandardList(standardList);
        }

        for (int i = 0; i < resultLists.size(); i++)
        {
            if (resultLists.get(i).getStandardList().size() < 1)
            {
                resultLists.remove(i);
                i--;
            } else
            {
                resultLists.get(i).setStandardId(null);
                resultLists.get(i).setStandardName(null);
                resultLists.get(i).setStandardCount(null);
            }
        }
        return resultLists;
    }

    private List<RepertoryIncomeList> getGoodsImage(List<RepertoryIncomeList> repertoryIncomeLists)
    {
        for (RepertoryIncomeList incomeList : repertoryIncomeLists)
            incomeList.setGoodsImage(mapper.getGoodsImage(incomeList.getGoodsId()));

        return repertoryIncomeLists;
    }

    @Override
    public String getRepertoryIncome(SessionVO sessionVO, RepertoryIncome income)
    {
        RepertoryIncome result = mapper.selectByPrimaryKey(income.getRecordId());

        RepertoryIncomeListExample listExample = new RepertoryIncomeListExample();
        RepertoryIncomeListExample.Criteria listCriteria = listExample.createCriteria();

        listCriteria.andRecordIdEqualTo(result.getRecordId());

        List<RepertoryIncomeList> incomeLists = getGoodsImage(listMapper.selectByExample(listExample));
        for (RepertoryIncomeList list : incomeLists)
        {
            list.setGoodsCode(mapper.getGoodsCode(list.getGoodsId()));
            list.setCurrentCount(mapper.getStandardCount(list.getStandardId(), sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST));
            list.setGoodsType(mapper.getGoodsType(list.getGoodsId()));
        }

        result.setIncomeList(incomeLists);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result),SerializerFeature.WriteNullStringAsEmpty);
    }

    @Override
    public String listCurrentRepertoryIncome(SessionVO sessionVO, RepertoryIncome income, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

//        String branchId = mapper.getCurrentBranchId(sessionVO.getUserId());
        String branchId = mapper.getFirstBranchId(sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST);
        if (branchId == null)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        income.setBranchId(branchId);
        RepertoryIncomeExample example = new RepertoryIncomeExample();
        RepertoryIncomeExample.Criteria criteria = example.createCriteria();

        if (income.getCreateDate() != null && income.getFinishDate() != null)
            criteria.andCreateDateBetween(income.getCreateDate(), income.getFinishDate());

        example.setOrderByClause("create_date DESC");
        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        criteria.andBranchIdEqualTo(income.getBranchId());

        int pageCount = PagingUtil.getCount((int) mapper.countByExample(example), pageVO.getPageSize());

        List<RepertoryIncome> result = mapper.selectByExample(example);
        result = getIncome(sessionVO, result);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result,pageCount), SerializerFeature.WriteNullStringAsEmpty);
    }

    private List<RepertoryIncome> getIncome(SessionVO sessionVO, List<RepertoryIncome> result)
    {
        for (RepertoryIncome r : result)
        {
            RepertoryIncomeListExample listExample = new RepertoryIncomeListExample();
            RepertoryIncomeListExample.Criteria listCriteria = listExample.createCriteria();

            listCriteria.andRecordIdEqualTo(r.getRecordId());

            List<RepertoryIncomeList> incomeLists = getGoodsImage(listMapper.selectByExample(listExample));
            for (RepertoryIncomeList list : incomeLists)
            {
                list.setGoodsCode(mapper.getGoodsCode(list.getGoodsId()));
                list.setCurrentCount(mapper.getStandardCount(list.getStandardId(), sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST));
                list.setGoodsType(mapper.getGoodsType(list.getGoodsId()));
            }
//            incomeLists = dataTransform(incomeLists);

            r.setIncomeList(incomeLists);
        }
        return result;
    }

    private String getRecordCode(int i, String branchId)
    {
        String recordCode = IDGenerator.getNow() + String.format("%04d", (int) (Math.random() * 10000));
        RepertoryIncomeExample example = new RepertoryIncomeExample();
        RepertoryIncomeExample.Criteria criteria = example.createCriteria();

        criteria.andRecordCodeEqualTo(recordCode);
        criteria.andBranchIdEqualTo(branchId);

        if (i > 10)
            return null;

        if (mapper.countByExample(example) > 0)
            getRecordCode(i++, branchId);

        return recordCode;
    }
}
