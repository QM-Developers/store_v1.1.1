package com.dgg.store.controller.store;

import com.dgg.store.service.store.FreightTempService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.FreightTemp;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FreightTempController
{
    @Autowired
    private FreightTempService service;

    @RequestMapping(value = "/s/saveFreightTemp", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveFreightTemp(HttpServletRequest request, FreightTemp freightTemp)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertFreightTemp(sessionVO, freightTemp);
    }

    @RequestMapping(value = "/s/removeFreightTemp", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removeFreightTemp(HttpServletRequest request, FreightTemp freightTemp)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteFreightTemp(sessionVO, freightTemp);
    }

    @RequestMapping(value = "/s/updateFreightTemp", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateFreightTemp(HttpServletRequest request, FreightTemp freightTemp)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFreightTemp(sessionVO, freightTemp);
    }

    @RequestMapping(value = "/s/listFreightTemp", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listFreightTemp(HttpServletRequest request, FreightTemp freightTemp, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listFreightTemp(sessionVO, freightTemp, pageVO);
    }
}
