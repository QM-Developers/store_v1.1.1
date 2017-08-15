package com.dgg.store.controller.store;

import com.dgg.store.service.store.UserBreedService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.UserBreed;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserBreedController
{
    @Autowired
    private UserBreedService service;

    @RequestMapping(value = "/s/saveUserBreed", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveUserBreed(HttpServletRequest request, UserBreed breed)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertUserBreed(sessionVO,breed);
    }

    @RequestMapping(value = "/s/listUserBreed", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listUserBreed(HttpServletRequest request, UserBreed breed)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listUserBreed(sessionVO,breed);
    }

    @RequestMapping(value = "/s/updateUserBreed", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateUserBreed(HttpServletRequest request, UserBreed breed)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateUserBreed(sessionVO,breed);
    }

    @RequestMapping(value = "/s/removeUserBreed", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removeUserBreed(HttpServletRequest request, UserBreed breed)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteUserBreed(sessionVO,breed);
    }
}
