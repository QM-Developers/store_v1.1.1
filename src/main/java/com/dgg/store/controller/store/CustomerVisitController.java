package com.dgg.store.controller.store;

import com.dgg.store.service.store.CustomerVisitService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.customer.CustomerVO;
import com.dgg.store.util.vo.manage.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CustomerVisitController
{
    @Autowired
    private CustomerVisitService service;

    @RequestMapping(value = "/s/listVisitDepartment", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitDepartment(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitDepartment(sessionVO);
    }

    @RequestMapping(value = "/s/listVisitMember", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitMember(HttpServletRequest request, MemberVO memberVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitMember(sessionVO, memberVO);
    }

    @RequestMapping(value = "/s/listVisitCustomer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitCustomer(HttpServletRequest request, CustomerVO customerVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitCustomer(sessionVO, customerVO, pageVO);
    }

    @RequestMapping(value = "/s/getVisitCustomer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getVisitCustomer(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getVisitCustomer(sessionVO, customerVO);
    }

    @RequestMapping(value = "/s/listVisitUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitUserPlace(HttpServletRequest request, UserPlace place, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitUserPlace(sessionVO, place, pageVO);
    }

    @RequestMapping(value = "/s/getVisitUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getVisitUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getVisitUserPlace(sessionVO, place);
    }

    @RequestMapping(value = "/s/getVisitIDCard", method = RequestMethod.GET)
    public String getVisitIDCard(String path)
    {
        return "forward:" + path;
    }
}
