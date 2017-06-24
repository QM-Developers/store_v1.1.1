package com.dgg.store.service.store;

import com.dgg.store.dao.store.UserPlaceDao;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.pojo.UserBreedType;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.pojo.UserPlaceHardware;
import com.dgg.store.util.vo.CustomerVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.UserPlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserPlaceServiceImpl implements UserPlaceService
{
    @Autowired
    private UserPlaceDao dao;

    @Override
    public ResultVO deleteUserPlace(SessionVO sessionVO, UserPlace place)
    {
        Integer result = dao.deleteUserPlace(place);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO insertUserPlace(SessionVO sessionVO, UserPlace userPlace)
    {
        String placeId = IDGenerator.generator();
        userPlace.setUserPlaceId(placeId);

        int result = dao.insertUserPlace(userPlace);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), placeId);

        return resultVO;
    }

    @Override
    public ResultVO updateUserPlace(SessionVO sessionVO, UserPlace place)
    {
        dao.insertPlaceHistory(place.getUserPlaceId());
        Integer result = dao.updateUserPlace(place);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findPlacesTitle(SessionVO sessionVO, CustomerVO customerVO)
    {
        List<UserPlaceVO> result = dao.findPlacesTitle(customerVO.getCustomerId());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findPlace(SessionVO sessionVO, UserPlace place)
    {
        UserPlaceVO result = dao.findPlace(place.getUserPlaceId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findSinglePlace(SessionVO sessionVO, UserPlace place)
    {
        UserPlaceVO result = dao.findSinglePlace(sessionVO.getMyTeamId(), place.getCustomerId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findAllPlace(SessionVO sessionVO, UserPlace place)
    {
        List<UserPlaceVO> result = dao.findAllPlace(sessionVO.getMyTeamId(), place.getCustomerId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findHardwareById(SessionVO sessionVO, UserPlaceHardware hardware)
    {
        UserPlaceHardware result = dao.findHardwareById(hardware.getUserHardwareId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findPlaceHardware(SessionVO sessionVO, UserPlaceHardware hardware)
    {
        List<UserPlaceHardware> result = dao.findPlaceHardware(hardware.getUserPlaceId());

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateHardwareById(SessionVO sessionVO, UserPlaceHardware hardware)
    {
        dao.insertHardwareHistory(hardware.getUserHardwareId());
        Integer result = dao.updateHardwareById(hardware);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), hardware);

        return resultVO;
    }

    @Override
    public ResultVO insertPlaceHardware(SessionVO sessionVO, UserPlaceHardware placeHardware)
    {
        placeHardware.setUserHardwareId(IDGenerator.generator());

        int result = dao.insertPlaceHardware(placeHardware);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO deletePlaceHardware(SessionVO sessionVO, UserPlaceHardware placeHardware)
    {
        Integer result = dao.deletePlaceHardware(placeHardware);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO insertBreedType(SessionVO sessionVO, UserBreedType type)
    {
        type.setUserBreedTypeId(IDGenerator.generator());

        int result = dao.insertBreedType(type);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO deleteBreedType(SessionVO sessionVO, UserBreedType type)
    {
        Integer result = dao.deleteBreedType(type);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findBreedTypes(SessionVO sessionVO, UserBreedType type)
    {
        List<UserBreedType> result = dao.findBreedTypes(type.getUserPlaceId());

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findBreedTypeById(SessionVO sessionVO, UserBreedType type)
    {
        UserBreedType result = dao.findBreedTypeById(type.getUserBreedTypeId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateBreedTypeById(SessionVO sessionVO, UserBreedType type)
    {
        dao.insertBreedHistory(type.getUserBreedTypeId());
        Integer result = dao.updateBreedTypeById(type);

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken());

        return resultVO;
    }
}
