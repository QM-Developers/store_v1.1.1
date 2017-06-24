package com.dgg.store.service.store;

import com.dgg.store.util.pojo.UserBreedType;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.pojo.UserPlaceHardware;
import com.dgg.store.util.vo.CustomerVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface UserPlaceService
{
    ResultVO deleteUserPlace(SessionVO sessionVO, UserPlace place);

    ResultVO insertUserPlace(SessionVO sessionVO, UserPlace userPlace);

    ResultVO updateUserPlace(SessionVO sessionVO, UserPlace place);

    ResultVO findPlacesTitle(SessionVO sessionVO, CustomerVO customerVO);

    ResultVO findPlace(SessionVO sessionVO, UserPlace place);

    ResultVO findSinglePlace(SessionVO sessionVO, UserPlace place);

    ResultVO findAllPlace(SessionVO sessionVO, UserPlace place);

    ResultVO findHardwareById(SessionVO sessionVO, UserPlaceHardware hardware);

    ResultVO findPlaceHardware(SessionVO sessionVO, UserPlaceHardware hardware);

    ResultVO updateHardwareById(SessionVO sessionVO, UserPlaceHardware hardware);

    ResultVO insertPlaceHardware(SessionVO sessionVO, UserPlaceHardware placeHardware);

    ResultVO deletePlaceHardware(SessionVO sessionVO, UserPlaceHardware placeHardware);

    ResultVO insertBreedType(SessionVO sessionVO, UserBreedType type);

    ResultVO deleteBreedType(SessionVO sessionVO, UserBreedType type);

    ResultVO findBreedTypes(SessionVO sessionVO, UserBreedType type);

    ResultVO findBreedTypeById(SessionVO sessionVO, UserBreedType type);

    ResultVO updateBreedTypeById(SessionVO sessionVO, UserBreedType type);
}
