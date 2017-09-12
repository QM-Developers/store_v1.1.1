package com.dgg.store.controller.store;

import com.dgg.store.service.store.CustomerVisitService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.CustomerFollow;
import com.dgg.store.util.pojo.Farmer;
import com.dgg.store.util.pojo.ManageUnit;
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

/**
 * 查看其它人客户控制器
 */
@Controller
public class CustomerVisitController
{
    @Autowired
    private CustomerVisitService service;

    /**
     * 获取部门列表
     *
     * @param request 用户参数
     * @return 部门列表
     */
    @RequestMapping(value = "/s/listVisitDepartment", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitDepartment(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitDepartment(sessionVO);
    }

    /**
     * 获取部门下的成员列表
     *
     * @param request  用户参数
     * @param memberVO 部门Id
     * @return 成员列表
     */
    @RequestMapping(value = "/s/listVisitMember", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitMember(HttpServletRequest request, MemberVO memberVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitMember(sessionVO, memberVO);
    }

    /**
     * 获取成员的客户列表
     *
     * @param request    用户参数
     * @param customerVO 业务员的用户Id
     * @param pageVO     分页参数
     * @return 客户列表
     */
    @RequestMapping(value = "/s/listVisitCustomer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitCustomer(HttpServletRequest request, CustomerVO customerVO, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitCustomer(sessionVO, customerVO, pageVO);
    }

    /**
     * 获取客户详情
     *
     * @param request    用户参数
     * @param customerVO 客户Id
     * @return 客户详情
     */
    @RequestMapping(value = "/s/getVisitCustomer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getVisitCustomer(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getVisitCustomer(sessionVO, customerVO);
    }

    /**
     * 获取场地列表
     *
     * @param request 用户参数
     * @param place   客户Id或农户Id
     * @param pageVO  分页参数
     * @return 场地列表
     */
    @RequestMapping(value = "/s/listVisitUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitUserPlace(HttpServletRequest request, UserPlace place, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitUserPlace(sessionVO, place, pageVO);
    }

    /**
     * 获取场地详情
     *
     * @param request 用户参数
     * @param place   场地Id
     * @return 场地详情
     */
    @RequestMapping(value = "/s/getVisitUserPlace", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getVisitUserPlace(HttpServletRequest request, UserPlace place)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getVisitUserPlace(sessionVO, place);
    }

    /**
     * 获取养殖信息列表
     *
     * @param request 用户参数
     * @param place   场地Id或农户经验Id
     * @param pageVO  分页参数
     * @return 养殖信息列表
     */
    @RequestMapping(value = "/s/listVisitUserBreed", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitUserBreed(HttpServletRequest request, UserPlace place, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitUserBreed(sessionVO, place, pageVO);
    }

    /**
     * 获取农户列表
     *
     * @param request 用户参数
     * @param farmer  客户Id
     * @param pageVO  分页参数
     * @return 农户列表
     */
    @RequestMapping(value = "/s/listVisitFarmer", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitFarmer(HttpServletRequest request, Farmer farmer, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitFarmer(sessionVO, farmer, pageVO);
    }

    /**
     * 获取经营单位列表
     *
     * @param request 用户参数
     * @param unit    客户Id
     * @param pageVO  分页参数
     * @return 营单位列表
     */
    @RequestMapping(value = "/s/listVisitManageUnit", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitManageUnit(HttpServletRequest request, ManageUnit unit, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitManageUnit(sessionVO, unit, pageVO);
    }

    /**
     * 获取跟进列表
     *
     * @param request 用户参数
     * @param follow  客户Id
     * @param pageVO  分页参数
     * @return 跟进列表
     */
    @RequestMapping(value = "/s/listVisitCustomerFollow", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listVisitCustomerFollow(HttpServletRequest request, CustomerFollow follow, PageVO pageVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listVisitCustomerFollow(sessionVO, follow, pageVO);
    }

    /**
     * 获取跟进详情
     *
     * @param request 用户参数
     * @param follow  跟进Id
     * @return 跟进详情
     */
    @RequestMapping(value = "/s/getVisitCustomerFollow", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getVisitCustomerFollow(HttpServletRequest request, CustomerFollow follow)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getVisitCustomerFollow(sessionVO, follow);
    }

    /**
     * 获取图片
     *
     * @param path 图片物理地址
     * @return 图片文件
     */
    @RequestMapping(value = "/s/getVisitIDCard", method = RequestMethod.GET)
    public String getVisitIDCard(String path)
    {
        return "forward:" + path;
    }
}
