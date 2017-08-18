package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.FreightTempDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.pojo.FreightTempExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreightTempServiceImpl implements FreightTempService
{
    @Autowired
    private FreightTempDao dao;

    @Override
    public String insertFreightTemp(SessionVO sessionVO, FreightTemp freightTemp)
    {
        freightTemp.setUserId(sessionVO.getUserId());
        freightTemp.setMyTeamId(sessionVO.getMyTeamId());
        freightTemp.setFreightId(IDGenerator.generator());
        int result = dao.insert(freightTemp);

        ResultVO resultVO = new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken(), freightTemp.getFreightId());

        return JSONObject.toJSONString(resultVO);
    }

    @Override
    public String deleteFreightTemp(SessionVO sessionVO, FreightTemp freightTemp)
    {
        int result = dao.deleteByPrimaryKey(freightTemp.getFreightId());

        ResultVO resultVO = new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken(), result);

        return JSONObject.toJSONString(resultVO);
    }

    @Override
    public String updateFreightTemp(SessionVO sessionVO, FreightTemp freightTemp)
    {
        int result = dao.updateByPrimaryKeySelective(freightTemp);

        ResultVO resultVO = new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken(), result);

        return JSONObject.toJSONString(resultVO);
    }

    @Override
    public String listFreightTemp(SessionVO sessionVO, FreightTemp freightTemp, PageVO pageVO)
    {
        FreightTempExample example = new FreightTempExample();
        FreightTempExample.Criteria criteria = example.createCriteria();

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());

        criteria.andMyTeamIdEqualTo(sessionVO.getMyTeamId());

        List<FreightTemp> result = dao.selectByExample(example);
        int pageCount = (int) dao.countByExample(example);
        pageCount = PagingUtil.getCount(pageCount, pageVO.getPageSize());

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }


}
