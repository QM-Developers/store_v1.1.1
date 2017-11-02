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

/**
 * 场地信息控制器
 */
@Controller
public class UserPlaceController
{
    @Autowired
    private UserPlaceService service;

    /**
     * 添加场地
     *
     * @param request 用户参数
     * @param place   场地信息参数
     * @return 场地Id
     */
    @RequestMapping(value = "/s/saveUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertUserPlace(sessionVO, place);
    }

    /**
     * 删除场地
     *
     * @param request 用户参数
     * @param place   场地Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/removeUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removeUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteUserPlace(sessionVO, place);
    }

    /**
     * 修改场地
     *
     * @param request 用户参数
     * @param place   场地信息参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateUserPlace(sessionVO, place);
    }

    /**
     * 获取场地列表
     *
     * @param request 用户参数
     * @param place   客户Id或农户Id
     * @param pageVO  分页参数
     * @return 场地列表
     */
    @RequestMapping(value = "/s/listUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listUserPlace(HttpServletRequest request, UserPlace place, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listUserPlace(sessionVO, place, pageVO);
    }

    /**
     * 上传场地证明图片
     *
     * @param file    图片文件
     * @param request 用户参数
     * @return 图片Id
     */
    @RequestMapping(value = "/s/uploadPlaceCertificate", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String uploadPlaceCertificate(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertPlaceCertificate(sessionVO, file, request.getParameter(KeyConstant.USER_PLACE_ID));
    }

    /**
     * 上传场地环境图片
     *
     * @param file    图片文件
     * @param request 用户参数
     * @return 图片Id
     */
    @RequestMapping(value = "/s/uploadPlaceEnvironment", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String uploadPlaceEnvironment(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertPlaceEnvironment(sessionVO, file, request.getParameter(KeyConstant.USER_PLACE_ID));
    }

    /**
     * 删除场地环境、证明图片
     *
     * @param request    用户参数
     * @param placeImage 图片Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/removePlaceImage", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removePlaceImage(HttpServletRequest request, PlaceImage placeImage)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deletePlaceImage(sessionVO, placeImage);
    }

    /**
     * 获取场地详情
     *
     * @param request 用户参数
     * @param place   场地Id
     * @return 场地详情
     */
    @RequestMapping(value = "/s/getUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getUserPlace(sessionVO, place);
    }

}
