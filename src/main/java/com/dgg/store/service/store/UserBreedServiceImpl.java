package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.UserBreedDao;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.reflect.ReflectUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.pojo.UserBreed;
import com.dgg.store.util.pojo.UserBreedExample;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserBreedServiceImpl implements UserBreedService
{
    @Autowired
    private UserBreedDao dao;

    @Override
    public String insertUserBreed(SessionVO sessionVO, UserBreed breed)
    {
        breed.setBreedId(IDGenerator.generator());
        int result = dao.insertSelective(breed);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken(), breed.getBreedId()));

        return json.toJSONString();
    }

    @Override
    public String listUserBreed(SessionVO sessionVO, UserBreed breed)
    {
        UserBreedExample example = new UserBreedExample();
        UserBreedExample.Criteria criteria = example.createCriteria();

        criteria.andUserPlaceIdEqualTo(breed.getUserPlaceId());

        List<UserBreed> result = dao.selectByExample(example);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));

        return json.toJSONString();
    }

    @Override
    public String updateUserBreed(SessionVO sessionVO, UserBreed breed)
    {
        breed.setUserPlaceId(null);

        int result = dao.updateByPrimaryKeySelective(breed);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));

        return json.toJSONString();
    }

    @Override
    public String deleteUserBreed(SessionVO sessionVO, UserBreed breed)
    {
        int result = dao.deleteByPrimaryKey(breed.getBreedId());

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));

        return json.toJSONString();
    }
}
