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

    @RequestMapping(value = "/s/findDepartmentDetail",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDepartmentDetail(HttpServletRequest request,TeamDepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDepartmentDetail(sessionVO,department);
    }

    @RequestMapping(value = "/s/findDepartmentMember",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDepartmentMember(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDepartmentMember(sessionVO,member);
    }

    @RequestMapping(value = "/s/findMemberByNameOrPhone",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findMemberByNameOrPhone(HttpServletRequest request,MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMemberByNameOrPhone(sessionVO,member);
    }


//    @RequestMapping(value = "/s/addMyTeam",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO addMyTeam(HttpServletRequest request, MyTeamVO teamVO)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.insertMyTeam(sessionVO,teamVO);
//    }
//
////    @RequestMapping(value = "/s/addDepartment",method = RequestMethod.POST)
////    @ResponseBody
////    public ResultVO addDepartment(HttpServletRequest request, TeamDepartment department)
////    {
////        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
////
////        return service.insertDepartment(sessionVO,department);
////    }
//
//    @RequestMapping(value = "/s/addDepartmentMember",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO addDepartmentMember(HttpServletRequest request, DepartmentMemberVO memberVO)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.insertDepartmentMember(sessionVO,memberVO);
//    }
//
////    @RequestMapping(value = "/s/findDepartmentList",method = RequestMethod.POST)
////    @ResponseBody
////    public ResultVO findDepartmentList(HttpServletRequest request, MyTeam team)
////    {
////        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
////
////        return service.findDepartmentList(sessionVO,team);
////    }
//
//    @RequestMapping(value = "/s/findCCDepartmentList",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO findCCDepartmentList(HttpServletRequest request, MyTeam team)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.findCCDepartmentList(sessionVO,team);
//    }
//
//    @RequestMapping(value = "/s/findCompanyList",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO findCompanyList(HttpServletRequest request)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.findCompanyList(sessionVO);
//    }
//
//    @RequestMapping(value = "/s/findCompanyInfo",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO findCompanyInfo(HttpServletRequest request,MyTeamVO team)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.findCompanyInfo(sessionVO,team);
//    }
//
//    @RequestMapping(value = "/s/findCDepartmentList",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO findCDepartmentList(HttpServletRequest request,MyTeamVO teamVO)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.findCDepartmentList(sessionVO,teamVO);
//    }
//
//    @RequestMapping(value = "/s/findDepartmentMember",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO findDepartmentMember(HttpServletRequest request,DepartmentMemberVO department)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.findDepartmentMember(sessionVO,department);
//    }
//
//    @RequestMapping(value = "/s/findTeamsByKeyword",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO findTeamsByKeyword(HttpServletRequest request, SearchVO searchVO)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.findTeamsByKeyword(sessionVO,searchVO);
//    }
//
//    @RequestMapping(value = "/s/changePrincipal",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO changePrincipal(HttpServletRequest request,DepartmentMemberVO memberVO)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.updatePrincipal(sessionVO,memberVO);
//    }
//
//    @RequestMapping(value = "/s/changeDepartment",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO changeDepartment(HttpServletRequest request,DepartmentMemberVO memberVO)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.updateDepartment(sessionVO,memberVO);
//    }
//
//    @RequestMapping(value = "/s/findDepartmentMemberInfo",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO findDepartmentMemberInfo(HttpServletRequest request,DepartmentMemberVO memberVO)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.findDepartmentMemberInfo(sessionVO,memberVO);
//    }
//
//    /**
//     * =======================================================================================================
//     */
//    @RequestMapping(value = "/s/findCorporationTree",method = RequestMethod.POST)
//    @ResponseBody
//    public ResultVO findCorporationTree(HttpServletRequest request)
//    {
//        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);
//
//        return service.findCorporationTree(sessionVO);
//    }
}