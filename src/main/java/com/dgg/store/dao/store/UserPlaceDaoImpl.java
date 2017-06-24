package com.dgg.store.dao.store;

import com.dgg.store.mapper.UserPlaceMapper;
import com.dgg.store.util.pojo.UserBreedType;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.pojo.UserPlaceHardware;
import com.dgg.store.util.vo.UserPlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserPlaceDaoImpl implements UserPlaceDao
{
    @Autowired
    private UserPlaceMapper mapper;

    @Override
    public Integer deleteUserPlace(UserPlace place)
    {
        return mapper.deleteUserPlace(place);
    }

    @Override
    public int insertUserPlace(UserPlace userPlace)
    {
        return mapper.insertUserPlace(userPlace);
    }

    @Override
    public Integer updateUserPlace(UserPlace place)
    {
        return mapper.updateUserPlace(place);
    }

    @Override
    public List<UserPlaceVO> findPlacesTitle(String userId)
    {
        return mapper.findPlacesTitle(userId);
    }

    @Override
    public UserPlaceVO findPlace(String userPlaceId)
    {
        return mapper.findPlace(userPlaceId);
    }

    @Override
    public UserPlaceVO findSinglePlace(String myTeamId, String userPhone)
    {
        return mapper.findSinglePlace(myTeamId,userPhone);
    }

    @Override
    public List<UserPlaceVO> findAllPlace(String myTeamId, String userPhone)
    {
        return mapper.findAllPlace(myTeamId,userPhone);
    }

    @Override
    public UserPlaceHardware findHardwareById(String userHardwareId)
    {
        return mapper.findHardwareById(userHardwareId);
    }

    @Override
    public List<UserPlaceHardware> findPlaceHardware(String userPlaceId)
    {
        return mapper.findPlaceHardware(userPlaceId);
    }

    @Override
    public Integer updateHardwareById(UserPlaceHardware hardware)
    {
        return mapper.updateHardwareById(hardware);
    }

    @Override
    public int insertPlaceHardware(UserPlaceHardware placeHardware)
    {
        return mapper.insertPlaceHardware(placeHardware);
    }

    @Override
    public Integer deletePlaceHardware(UserPlaceHardware placeHardware)
    {
        return mapper.deletePlaceHardware(placeHardware);
    }

    @Override
    public int insertBreedType(UserBreedType type)
    {
        return mapper.insertBreedType(type);
    }

    @Override
    public Integer deleteBreedType(UserBreedType type)
    {
        return mapper.deleteBreedType(type);
    }

    @Override
    public List<UserBreedType> findBreedTypes(String userPlaceId)
    {
        return mapper.findBreedTypes(userPlaceId);
    }

    @Override
    public UserBreedType findBreedTypeById(String userBreedTypeId)
    {
        return mapper.findBreedTypeById(userBreedTypeId);
    }

    @Override
    public Integer updateBreedTypeById(UserBreedType type)
    {
        return mapper.updateBreedTypeById(type);
    }

    @Override
    public Integer insertPlaceHistory(String userPlaceId)
    {
        return mapper.insertPlaceHistory(userPlaceId);
    }

    @Override
    public Integer insertHardwareHistory(String userHardwareId)
    {
        return mapper.insertHardwareHistory(userHardwareId);
    }

    @Override
    public Integer insertBreedHistory(String userBreedTypeId)
    {
        return mapper.insertBreedHistory(userBreedTypeId);
    }
}
