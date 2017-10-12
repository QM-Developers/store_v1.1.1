package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.FarmerDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.Farmer;
import com.dgg.store.util.pojo.FarmerExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FarmerServiceImpl implements FarmerService
{
    @Autowired
    private FarmerDao dao;

    @Override
    public String insertFarmer(SessionVO sessionVO, Farmer farmer)
    {
        farmer.setFarmerId(IDGenerator.generator());

        int result = dao.insert(farmer);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken(), farmer.getFarmerId()));

        return json.toJSONString();
    }

    @Override
    public String listFarmer(SessionVO sessionVO, Farmer farmer, PageVO pageVO)
    {
        FarmerExample example = new FarmerExample();
        FarmerExample.Criteria criteria = example.createCriteria();

        criteria.andCustomerIdEqualTo(farmer.getCustomerId());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(),pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example),pageVO.getPageSize());

        List<Farmer> result = dao.selectByExample(example);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT,pageCount);

        return json.toJSONString();
    }

    @Override
    public String updateFarmer(SessionVO sessionVO, Farmer farmer)
    {
        int result = dao.updateByPrimaryKeySelective(farmer);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));

        return json.toJSONString();
    }

    @Override
    public String deleteFarmer(SessionVO sessionVO, Farmer farmer)
    {
        Integer result = 1;
        int index = 0;
        int count = 3;

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    dao.deleteBreed(farmer);
                    break;
                case 1:
                    dao.deletePlace(farmer);
                    break;
                case 2:
                    result = dao.deleteByPrimaryKey(farmer.getFarmerId());
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result, sessionVO.getToken()));

        return json.toJSONString();
    }
}
