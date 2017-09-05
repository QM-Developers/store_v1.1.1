package com.dgg.store.controller.store;

import com.dgg.store.service.store.ManageUnitService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.ManageUnit;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ManageUnitController
{
    @Autowired
    private ManageUnitService service;

    @RequestMapping(value = "/s/saveManageUnit", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveUserBreed(HttpServletRequest request, ManageUnit unit)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertManageUnit(sessionVO,unit);
    }

    @RequestMapping(value = "/s/listManageUnit", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listManageUnit(HttpServletRequest request, ManageUnit unit, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listManageUnit(sessionVO,unit,pageVO);
    }

    @RequestMapping(value = "/s/updateManageUnit", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateManageUnit(HttpServletRequest request, ManageUnit unit)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateManageUnit(sessionVO,unit);
    }

    @RequestMapping(value = "/s/removeManageUnit", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String removeManageUnit(HttpServletRequest request, ManageUnit unit)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteManageUnit(sessionVO,unit);
    }
}
