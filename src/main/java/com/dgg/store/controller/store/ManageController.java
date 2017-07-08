package com.dgg.store.controller.store;

import com.dgg.store.service.store.ManageService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.LoginVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.manage.DepartmentVO;
import com.dgg.store.util.vo.manage.MemberVO;
import com.dgg.store.util.vo.manage.PositionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ManageController
{
    @Autowired
    private ManageService service;

    @RequestMapping(value = "/s/login", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO login(HttpServletRequest request, LoginVO loginVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findLoginUser(sessionVO, loginVO);
    }

    @RequestMapping(value = "/s/findTeamAndMemberCount", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findTeamAndMemberCount(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findTeamAndMemberCount(sessionVO);
    }

    @RequestMapping(value = "/s/findMemberList", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findMemberList(HttpServletRequest request, MemberVO memberVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMemberList(sessionVO, memberVO);
    }

    @RequestMapping(value = "/s/findDepartmentList", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDepartmentList(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDepartmentList(sessionVO, department);
    }

    @RequestMapping(value = "/s/addDepartment", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addDepartment(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertDepartment(sessionVO, department);
    }



    @RequestMapping(value = "/s/addMember", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addMember(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertMember(sessionVO, member);
    }

    @RequestMapping(value = "/s/updateMember",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateMember(HttpServletRequest request,MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateMember(sessionVO,member);
    }

    @RequestMapping(value = "/s/updateDepartment", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateDepartment(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateDepartment(sessionVO, department);
    }

    @RequestMapping(value = "/s/findDepartmentInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDepartmentInfo(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDepartmentInfo(sessionVO, department);
    }

    @RequestMapping(value = "/s/deleteDepartment", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deleteDepartment(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteDepartment(sessionVO, department);
    }

    @RequestMapping(value = "/s/findPositionList", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findPositionList(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findPositionList(sessionVO, department);
    }

    @RequestMapping(value = "/s/findMemberInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findMemberInfo(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMemberInfo(sessionVO, member);
    }

    @RequestMapping(value = "/s/countPositionMember", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO countPositionMember(HttpServletRequest request, PositionVO position)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.countPositionMember(sessionVO, position);
    }

    @RequestMapping(value = "/s/insertCardFront", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertCardFront(@RequestParam(value = "cardFront", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCardFront(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    @RequestMapping(value = "/s/insertCardBack", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertCardBack(@RequestParam(value = "cardBack", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCardBack(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    @RequestMapping(value = "/s/getCardImage", method = RequestMethod.GET)
    public String getCardFront(String path)
    {
        return "forward:" + path;
    }

}
