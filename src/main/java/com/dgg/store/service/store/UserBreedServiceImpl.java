package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.UserBreedDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.*;
import com.dgg.store.util.vo.core.PageVO;
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
    public String listUserBreed(SessionVO sessionVO, UserBreed breed, PageVO pageVO)
    {
        UserBreedExample example = new UserBreedExample();
        UserBreedExample.Criteria criteria = example.createCriteria();

        criteria.andUserPlaceIdEqualTo(breed.getUserPlaceId());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        List<UserBreed> result = dao.selectByExample(example);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

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

    @Override
    public String listBreedType(SessionVO sessionVO, UserBreed breed)
    {
        List<SysBreedType> result = dao.listBreedType(breed.getSelectId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listBreedSelect(SessionVO sessionVO, UserBreed breed)
    {
        List<SysBreedTypeSelect> result = dao.listBreedSelect(breed.getTypeId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String listBreedInfo(SessionVO sessionVO, UserBreed breed)
    {
        List<SysBreedTypeInfo> result = dao.listBreedInfo(breed.getSelectId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String insertUserBreedJson(SessionVO sessionVO, UserBreed breed)
    {
        breed.setBreedId(IDGenerator.generator());
        int result = dao.insertSelective(breed);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken(), breed.getBreedId()));

        return json.toJSONString();
    }

    @Override
    public String updateUserBreedJson(SessionVO sessionVO, UserBreed breed)
    {
        breed.setUserPlaceId(null);

        int result = dao.updateByPrimaryKeySelective(breed);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));

        return json.toJSONString();
    }

    @Override
    public String listUserBreedJson(SessionVO sessionVO, UserBreed breed, PageVO pageVO)
    {
        UserBreedExample example = new UserBreedExample();
        UserBreedExample.Criteria criteria = example.createCriteria();

        criteria.andUserPlaceIdEqualTo(breed.getUserPlaceId());

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount((int) dao.countByExample(example), pageVO.getPageSize());

        List<UserBreed> result = dao.selectByExample(example);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String getUserBreedJson(SessionVO sessionVO, UserBreed breed)
    {
        UserBreed result = dao.selectByPrimaryKey(breed.getBreedId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }
}
