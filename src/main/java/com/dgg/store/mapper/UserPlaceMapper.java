package com.dgg.store.mapper;

import com.dgg.store.util.pojo.UserBreedType;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.pojo.UserPlaceHardware;
import com.dgg.store.util.vo.UserPlaceVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserPlaceMapper
{

    Integer deleteUserPlace(UserPlace place);

    int insertUserPlace(UserPlace userPlace);

    Integer updateUserPlace(UserPlace place);

    List<UserPlaceVO> findPlacesTitle(@Param("userId") String userId);

    UserPlaceVO findPlace(@Param("placeId") String userPlaceId);

    UserPlaceVO findSinglePlace(@Param("myTeamId") String myTeamId, @Param("userPhone") String userPhone);

    List<UserPlaceVO> findAllPlace(@Param("myTeamId") String myTeamId, @Param("userPhone") String userPhone);

    UserPlaceHardware findHardwareById(@Param("hardwareId") String userHardwareId);

    List<UserPlaceHardware> findPlaceHardware(@Param("placeId") String userPlaceId);

    Integer updateHardwareById(UserPlaceHardware hardware);

    int insertPlaceHardware(UserPlaceHardware placeHardware);

    Integer deletePlaceHardware(UserPlaceHardware placeHardware);

    int insertBreedType(UserBreedType type);

    Integer updateBreedTypeById(UserBreedType type);

    UserBreedType findBreedTypeById(@Param("typeId") String userBreedTypeId);

    List<UserBreedType> findBreedTypes(@Param("placeId") String userPlaceId);

    Integer deleteBreedType(UserBreedType type);

    Integer insertPlaceHistory(@Param("placeId") String userPlaceId);

    Integer insertHardwareHistory(@Param("hardwareId")String userHardwareId);

    Integer insertBreedHistory(@Param("typeId")String userBreedTypeId);
}