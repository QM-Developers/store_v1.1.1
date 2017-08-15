package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.ManageUnitDao;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.pojo.ManageUnit;
import com.dgg.store.util.pojo.ManageUnitExample;
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
        int result = dao.insert(unit);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken(), unit.getManageId()));

        return json.toJSONString();
    }

    @Override
    public String listManageUnit(SessionVO sessionVO, ManageUnit unit)
    {
        ManageUnitExample example = new ManageUnitExample();
        ManageUnitExample.Criteria criteria = example.createCriteria();

        criteria.andCustomerIdEqualTo(unit.getCustomerId());

        List<ManageUnit> result = dao.selectByExample(example);

        return JSONObject.toJSONString(new ResultVO(1, sessionVO.getToken(), result));
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
}
