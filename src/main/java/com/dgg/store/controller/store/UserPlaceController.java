package com.dgg.store.controller.store;

import com.dgg.store.service.store.UserPlaceService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.pojo.PlaceImage;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserPlaceController
{
    @Autowired
    private UserPlaceService service;

    @RequestMapping(value = "/s/saveUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertUserPlace(sessionVO,place);
    }

    @RequestMapping(value = "/s/removeUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removeUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteUserPlace(sessionVO,place);
    }

    @RequestMapping(value = "/s/updateUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateUserPlace(sessionVO,place);
    }

    @RequestMapping(value = "/s/listUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listUserPlace(HttpServletRequest request, UserPlace place, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listUserPlace(sessionVO,place,pageVO);
    }

    @RequestMapping(value = "/s/uploadPlaceCertificate", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String uploadPlaceCertificate(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
        String path = request.getSession().getServletContext().getRealPath(SymbolConstant.SYSTEM_SLASH);

        return service.insertPlaceCertificate(sessionVO, file, path, request.getParameter(KeyConstant.USER_PLACE_ID));
    }

    @RequestMapping(value = "/s/uploadPlaceEnvironment", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String uploadPlaceEnvironment(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
        String path = request.getSession().getServletContext().getRealPath(SymbolConstant.SYSTEM_SLASH);

        return service.insertPlaceEnvironment(sessionVO, file, path, request.getParameter(KeyConstant.USER_PLACE_ID));
    }

    @RequestMapping(value = "/s/removePlaceImage", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removePlaceImage(HttpServletRequest request, PlaceImage placeImage)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deletePlaceImage(sessionVO, placeImage);
    }

    @RequestMapping(value = "/s/getUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getUserPlace(sessionVO, place);
    }

}
