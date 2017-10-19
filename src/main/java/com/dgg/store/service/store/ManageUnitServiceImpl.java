package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.ManageUnitDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.ManageUnit;
import com.dgg.store.util.pojo.ManageUnitExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManageUnitServiceImpl implements ManageUnitService
{
    @Autowired
    private ManageUnitDao dao;

    @Override
    public String insertManageUnit(SessionVO sessionVO, ManageUnit unit)
    {
        unit.setManageId(IDGenerator.generator());
        int result = dao.insertSelective(unit);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken(), unit.getManageId()));

        return json.toJSONString();
    }

    @Override
    public String listManageUnit(SessionVO sessionVO, ManageUnit unit, PageVO pageVO)
    {
        ManageUnitExample example = new ManageUnitExample();
        ManageUnitExample.Criteria criteria = example.createCriteria();

        criteria.andCustomerIdEqualTo(unit.getCustomerId());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        List<ManageUnit> result = dao.selectByExample(example);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String updateManageUnit(SessionVO sessionVO, ManageUnit unit)
    {
        unit.setCustomerId(null);

        int result = dao.updateByPrimaryKeySelective(unit);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));

        return json.toJSONString();
    }

    @Override
    public String deleteManageUnit(SessionVO sessionVO, ManageUnit unit)
    {
        int result = dao.deleteByPrimaryKey(unit.getManageId());

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));

        return json.toJSONString();
    }

    @Override
    public String getManageUnit(SessionVO sessionVO, ManageUnit unit)
    {
        ManageUnit result = dao.selectByPrimaryKey(unit.getManageId());

        int flag = result == null ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS;

        return JSONObject.toJSONString(new ResultVO(flag, sessionVO.getToken(), result));
    }
}
