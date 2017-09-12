package com.dgg.store.controller.store;

import com.dgg.store.service.store.CustomerFollowService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.CustomerFollow;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 客户跟进控制器
 */
@Controller
public class CustomerFollowController
{
    @Autowired
    private CustomerFollowService service;

    /**
     * 添加客户跟进
     *
     * @param request 用户参数
     * @param follow  跟进信息
     * @return 跟进Id
     */
    @RequestMapping(value = "/s/saveCustomerFollow", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveCustomerFollow(HttpServletRequest request, CustomerFollow follow)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCustomerFollow(sessionVO, follow);
    }

    /**
     * 获取跟进列表
     *
     * @param request 用户参数
     * @param follow  客户Id
     * @param pageVO  分页参数
     * @return 跟进列表
     */
    @RequestMapping(value = "/s/listCustomerFollow", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCustomerFollow(HttpServletRequest request, CustomerFollow follow, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCustomerFollow(sessionVO, follow, pageVO);
    }

    /**
     * 获取跟进详情
     *
     * @param request 用户参数
     * @param follow  跟进Id
     * @return 跟进详情
     */
    @RequestMapping(value = "/s/getCustomerFollow", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getCustomerFollow(HttpServletRequest request, CustomerFollow follow)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getCustomerFollow(sessionVO, follow);
    }

    /**
     * 更新跟进信息
     * @param request 用户参数
     * @param follow 跟进信息
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCustomerFollow", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomerFollow(HttpServletRequest request, CustomerFollow follow)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomerFollow(sessionVO, follow);
    }

}
