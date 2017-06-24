package com.dgg.store.controller.store;

import com.dgg.store.service.store.CustomerService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.MyTeam;
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
public class CustomerController
{
    @Autowired
    private CustomerService service;

    @RequestMapping(value = "/s/addUserByStore", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addUserByStore(CustomerVO customerVO, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertStoreUser(customerVO, sessionVO);
    }

    @RequestMapping(value = "/s/addCooperation", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addCooperation(HttpServletRequest request, MyTeam myTeam)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCooperation(sessionVO, myTeam);
    }

    @RequestMapping(value = "/s/addCustomerToCooper", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addCustomerToCooper(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCustomerToCooper(sessionVO, customerVO);
    }

    @RequestMapping(value = "/s/updateCustomer", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateCustomer(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomer(sessionVO, customerVO);
    }

    @RequestMapping(value = "/s/findCooperation", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findCooperation(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findCooperation(sessionVO);
    }

    @RequestMapping(value = "/s/findCustomerGroup", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findCustomerGroup(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findCustomerGroup(sessionVO);
    }

    @RequestMapping(value = "/s/findCustomerByGroup", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findCustomerByGroup(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findCustomerByGroup(sessionVO, customerVO);
    }

    @RequestMapping(value = "/s/findCustomerInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findCustomerInfo(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findCustomerInfo(sessionVO, customerVO);
    }

    @RequestMapping(value = "/s/findPartner", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findPartner(HttpServletRequest request)
    {
        String cooperId = request.getParameter("cooperId");
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findPartner(sessionVO, cooperId);
    }

}