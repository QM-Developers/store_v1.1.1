package com.dgg.store.controller.store;

import com.dgg.store.service.store.RepertoryCheckService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.branch.BranchVO;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 库存查看控制器
 */
@Controller
public class RepertoryCheckController
{
    @Autowired
    private RepertoryCheckService service;

    /**
     * 查看一级库存
     *
     * @param request 用户参数
     * @param pageVO  分页参数
     * @return 商品列表
     */
    @RequestMapping(value = "/s/listRepertoryFirst", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listRepertoryFirst(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryFirst(sessionVO, pageVO);
    }

    /**
     * 查看当前销售点库存
     *
     * @param request 用户参数
     * @param pageVO  分页参数
     * @return 商品列表
     */
    @RequestMapping(value = "/s/getRepertory", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getRepertory(HttpServletRequest request, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getRepertory(sessionVO, pageVO);
    }


}
