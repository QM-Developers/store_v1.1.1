package com.dgg.store.controller.store;

import com.dgg.store.service.store.MyTeamService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.RequestConstant;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.team.MemberVO;
import com.dgg.store.util.vo.team.TeamDepartmentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 团队控制器
 */
@Controller
public class MyTeamController
{
    @Autowired
    private MyTeamService service;

    /**
     * 获取部门列表
     *
     * @param request 用户参数
     * @return 部门列表
     */
    @RequestMapping(value = "/s/listTeamDepartment", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listTeamDepartment(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listTeamDepartment(sessionVO);
    }

    /**
     * 获取部门详情
     *
     * @param request    用户参数
     * @param department 部门Id
     * @return
     */
    @RequestMapping(value = "/s/findDepartmentDetail", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDepartmentDetail(HttpServletRequest request, TeamDepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDepartmentDetail(sessionVO, department);
    }

    /**
     * 获取部门下成员列表
     *
     * @param request 用户参数
     * @param member  部门Id
     * @return 成员列表
     */
    @RequestMapping(value = "/s/findDepartmentMember", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDepartmentMember(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDepartmentMember(sessionVO, member);
    }

    /**
     * 获取所有团队内成员
     *
     * @param request 用户参数
     * @return 成员列表
     */
    @RequestMapping(value = "/s/listAllMember", method = RequestMethod.POST, produces = {RequestConstant.CONTENT_TYPE})
    @ResponseBody
    public String listAllMember(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listAllMember(sessionVO);
    }

    /**
     * 获取成员详情
     *
     * @param request 用户参数
     * @param member  用户Id
     * @return 成员详情
     */
    @RequestMapping(value = "/s/getDepartmentMember", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getDepartmentMember(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getDepartmentMember(sessionVO, member);
    }

    /**
     * 根据手机号或用户名搜索用户
     *
     * @param request 用户参数
     * @param member  搜索关键字
     * @return 成员列表
     */
    @RequestMapping(value = "/s/findMemberByNameOrPhone", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findMemberByNameOrPhone(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMemberByNameOrPhone(sessionVO, member);
    }

    /**
     * 获取团队部门及成员
     *
     * @param request 用户参数
     * @return 部门及成员
     */
    @RequestMapping(value = "/s/listDepartmentAndMember", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listDepartmentAndMember(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listDepartmentAndMember(sessionVO);
    }
}
