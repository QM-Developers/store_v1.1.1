package com.dgg.store.controller.store;

import com.dgg.store.service.store.CustomerService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.CustomerVO;
import com.dgg.store.util.vo.core.PageVO;
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

    @RequestMapping(value = "/s/saveCustomerRecord", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveCustomerRecord(CustomerVO customerVO, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCustomerRecord(customerVO, sessionVO);
    }

    @RequestMapping(value = "/s/listCustomer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCustomer(HttpServletRequest request, PageVO pageVO,CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCustomer(sessionVO,pageVO,customerVO);
    }

    @RequestMapping(value = "/s/updateCustomer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomer(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomer(sessionVO,customerVO);
    }
}