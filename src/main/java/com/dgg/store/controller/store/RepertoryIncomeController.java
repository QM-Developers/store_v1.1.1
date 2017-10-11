package com.dgg.store.controller.store;

import com.dgg.store.service.store.RepertoryIncomeService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.RequestConstant;
import com.dgg.store.util.pojo.RepertoryIncome;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class RepertoryIncomeController
{
    private final RepertoryIncomeService service;

    public RepertoryIncomeController(RepertoryIncomeService service)
    {
        this.service = service;
    }

    @RequestMapping(value = "/s/saveRepertoryIncome", method = POST, produces = {RequestConstant.CONTENT_TYPE})
    @ResponseBody
    public String saveRepertoryIncome(HttpServletRequest request, RepertoryIncome income)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.saveRepertoryIncome(sessionVO, income);
    }

    @RequestMapping(value = "/s/listRepertoryIncome", method = POST, produces = {RequestConstant.CONTENT_TYPE})
    @ResponseBody
    public String listRepertoryIncome(HttpServletRequest request, RepertoryIncome income, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryIncome(sessionVO, income,pageVO);
    }

    @RequestMapping(value = "/s/getRepertoryIncome", method = POST, produces = {RequestConstant.CONTENT_TYPE})
    @ResponseBody
    public String getRepertoryIncome(HttpServletRequest request, RepertoryIncome income)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getRepertoryIncome(sessionVO, income);
    }

}
