package com.dgg.store.dao.store;

import com.dgg.store.mapper.UserPlaceMapper;
import com.dgg.store.util.pojo.PlaceImage;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.pojo.UserPlaceExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserPlaceDaoImpl implements UserPlaceDao
{
    @Autowired
    private UserPlaceMapper mapper;

    @Override
    public long countByExample(UserPlaceExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(UserPlaceExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(UserPlace record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(UserPlace record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<UserPlace> selectByExample(UserPlaceExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public UserPlace selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(UserPlace record, UserPlaceExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(UserPlace record, UserPlaceExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(UserPlace record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(UserPlace record)
    {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public int insertPlaceImage(PlaceImage placeImage)
    {
        return mapper.insertPlaceImage(placeImage);
    }

    @Override
    public int updatePlaceImage(List<String> images, String userPlaceId)
    {
        return mapper.updatePlaceImage(images,userPlaceId);
    }

    @Override
    public int deletePlaceImage(PlaceImage placeImage)
    {
        return mapper.deletePlaceImage(placeImage);
    }

    @Override
    public List<UserPlace> listUserPlace(UserPlace place)
    {
        return mapper.listUserPlace(place);
    }
}
