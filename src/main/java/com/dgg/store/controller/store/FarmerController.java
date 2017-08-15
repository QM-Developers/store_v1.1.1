package com.dgg.store.controller.store;

import com.dgg.store.service.store.FarmerService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.Farmer;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FarmerController
{
    @Autowired
    private FarmerService service;

    @RequestMapping(value = "/s/saveFarmer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveFarmer(HttpServletRequest request, Farmer farmer)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertFarmer(sessionVO,farmer);
    }

    @RequestMapping(value = "/s/listFarmer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listFarmer(HttpServletRequest request, Farmer farmer)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listFarmer(sessionVO,farmer);
    }

    @RequestMapping(value = "/s/updateFarmer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateFarmer(HttpServletRequest request, Farmer farmer)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFarmer(sessionVO,farmer);
    }

    @RequestMapping(value = "/s/removeFarmer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removeFarmer(HttpServletRequest request, Farmer farmer)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteFarmer(sessionVO,farmer);
    }
}
