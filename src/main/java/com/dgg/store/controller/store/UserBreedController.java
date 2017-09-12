package com.dgg.store.controller.store;

import com.dgg.store.service.store.UserBreedService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.UserBreed;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 养殖信息控制器
 */
@Controller
public class UserBreedController
{
    @Autowired
    private UserBreedService service;

    /**
     * 添加养殖信息
     *
     * @param request 用户参数
     * @param breed   养殖信息参数
     * @return 养殖信息Id
     */
    @RequestMapping(value = "/s/saveUserBreed", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveUserBreed(HttpServletRequest request, UserBreed breed)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertUserBreed(sessionVO, breed);
    }

    /**
     * 获取养殖信息列表
     *
     * @param request 用户参数
     * @param breed   场地Id或农户经验Id
     * @param pageVO  分页参数
     * @return 养殖信息列表
     */
    @RequestMapping(value = "/s/listUserBreed", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listUserBreed(HttpServletRequest request, UserBreed breed, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listUserBreed(sessionVO, breed, pageVO);
    }

    /**
     * 修改养殖信息
     *
     * @param request 用户参数
     * @param breed   养殖信息参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateUserBreed", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateUserBreed(HttpServletRequest request, UserBreed breed)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateUserBreed(sessionVO, breed);
    }

    /**
     * 删除养殖信息
     *
     * @param request 用户参数
     * @param breed   养殖信息Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/removeUserBreed", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removeUserBreed(HttpServletRequest request, UserBreed breed)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteUserBreed(sessionVO, breed);
    }
}
