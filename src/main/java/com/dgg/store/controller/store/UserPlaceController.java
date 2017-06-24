package com.dgg.store.controller.store;

import com.dgg.store.service.store.UserPlaceService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.UserBreedType;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.pojo.UserPlaceHardware;
import com.dgg.store.util.vo.CustomerVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserPlaceController
{
    @Autowired
    private UserPlaceService service;

    @RequestMapping(value = "/s/deleteUserPlace", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deleteUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteUserPlace(sessionVO, place);
    }

    @RequestMapping(value = "/s/addUserPlace", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addUserPlace(HttpServletRequest request, UserPlace userPlace)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertUserPlace(sessionVO, userPlace);
    }

    @RequestMapping(value = "/s/updateUserPlace", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateUserPlace(sessionVO, place);
    }

    @RequestMapping(value = "/s/findPlacesTitle", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findPlacesTitle(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findPlacesTitle(sessionVO, customerVO);
    }

    @RequestMapping(value = "/s/findPlace", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findPlace(sessionVO, place);
    }

    @RequestMapping(value = "/s/findSinglePlace", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findSinglePlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findSinglePlace(sessionVO, place);
    }

    @RequestMapping(value = "/s/findAllPlace", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findAllPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findAllPlace(sessionVO, place);
    }

    @RequestMapping(value = "/s/findHardwareById", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findHardwareById(HttpServletRequest request, UserPlaceHardware hardware)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findHardwareById(sessionVO, hardware);
    }

    @RequestMapping(value = "/s/findPlaceHardware", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findPlaceHardware(HttpServletRequest request, UserPlaceHardware hardware)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findPlaceHardware(sessionVO, hardware);
    }

    @RequestMapping(value = "/s/updateHardwareById", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateHardwareById(HttpServletRequest request, UserPlaceHardware hardware)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateHardwareById(sessionVO, hardware);
    }

    @RequestMapping(value = "/s/addPlaceHardware", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addPlaceHardware(HttpServletRequest request, UserPlaceHardware placeHardware)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertPlaceHardware(sessionVO, placeHardware);
    }

    @RequestMapping(value = "/s/deletePlaceHardware", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deletePlaceHardware(HttpServletRequest request, UserPlaceHardware placeHardware)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deletePlaceHardware(sessionVO, placeHardware);
    }

    @RequestMapping(value = "/s/addBreedType", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addBreedType(HttpServletRequest request, UserBreedType type)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertBreedType(sessionVO, type);
    }

    @RequestMapping(value = "/s/deleteBreedType", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deleteBreedType(HttpServletRequest request, UserBreedType type)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteBreedType(sessionVO, type);
    }

    @RequestMapping(value = "/s/findBreedTypes", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findBreedTypes(HttpServletRequest request, UserBreedType type)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findBreedTypes(sessionVO, type);
    }

    @RequestMapping(value = "/s/findBreedTypeById", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findBreedTypeById(HttpServletRequest request, UserBreedType type)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findBreedTypeById(sessionVO, type);
    }

    @RequestMapping(value = "/s/updateBreedTypeById", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateBreedTypeById(HttpServletRequest request, UserBreedType type)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateBreedTypeById(sessionVO, type);
    }

}
