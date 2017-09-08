package com.dgg.store.controller.store;

import com.dgg.store.service.store.MyTeamService;
import com.dgg.store.util.core.constant.Constant;
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

@Controller
public class MyTeamController
{
    @Autowired
    private MyTeamService service;

    @RequestMapping(value = "/s/listTeamDepartment", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listTeamDepartment(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listTeamDepartment(sessionVO);
    }

    @RequestMapping(value = "/s/findDepartmentDetail", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDepartmentDetail(HttpServletRequest request, TeamDepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDepartmentDetail(sessionVO, department);
    }

    @RequestMapping(value = "/s/findDepartmentMember", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDepartmentMember(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDepartmentMember(sessionVO, member);
    }

    @RequestMapping(value = "/s/getDepartmentMember", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getDepartmentMember(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getDepartmentMember(sessionVO, member);
    }

    @RequestMapping(value = "/s/findMemberByNameOrPhone", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findMemberByNameOrPhone(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMemberByNameOrPhone(sessionVO, member);
    }
}
