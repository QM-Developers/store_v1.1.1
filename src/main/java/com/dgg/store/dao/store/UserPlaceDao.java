package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.UserBreedType;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.pojo.UserPlaceHardware;
import com.dgg.store.util.vo.UserPlaceVO;

import java.util.List;

public interface UserPlaceDao
{
    Integer deleteUserPlace(UserPlace place);

    int insertUserPlace(UserPlace userPlace);

    Integer updateUserPlace(UserPlace place);

    List<UserPlaceVO> findPlacesTitle(String userId);

    UserPlaceVO findPlace(String userPlaceId);

    UserPlaceVO findSinglePlace(String myTeamId, String userPhone);

    List<UserPlaceVO> findAllPlace(String myTeamId, String userPhone);

    UserPlaceHardware findHardwareById(String userHardwareId);

    List<UserPlaceHardware> findPlaceHardware(String userPlaceId);

    Integer updateHardwareById(UserPlaceHardware hardware);

    int insertPlaceHardware(UserPlaceHardware placeHardware);

    Integer deletePlaceHardware(UserPlaceHardware placeHardware);

    int insertBreedType(UserBreedType type);

    Integer deleteBreedType(UserBreedType type);

    List<UserBreedType> findBreedTypes(String userPlaceId);

    UserBreedType findBreedTypeById(String userBreedTypeId);

    Integer updateBreedTypeById(UserBreedType type);

    Integer insertPlaceHistory(String userPlaceId);

    Integer insertHardwareHistory(String userHardwareId);

    Integer insertBreedHistory(String userBreedTypeId);
}
