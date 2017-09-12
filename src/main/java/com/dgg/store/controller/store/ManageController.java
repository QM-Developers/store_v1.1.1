package com.dgg.store.controller.store;

import com.dgg.store.service.store.ManageService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.vo.core.LoginVO;
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

/**
 * 组织管理控制器
 */
@Controller
public class ManageController
{
    @Autowired
    private ManageService service;

    /**
     * 登录后台系统
     *
     * @param request 用户参数
     * @param loginVO 登陆参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/login", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO login(HttpServletRequest request, LoginVO loginVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findLoginUser(sessionVO, loginVO);
    }

    /**
     * 获取部门名称和部门下的成员总数
     *
     * @param request 用户参数
     * @return 部门列表
     */
    @RequestMapping(value = "/s/findTeamAndMemberCount", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findTeamAndMemberCount(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findTeamAndMemberCount(sessionVO);
    }

    /**
     * 获取部门下成员列表
     *
     * @param request  用户参数
     * @param memberVO (暂时没用到)
     * @return 成员列表
     */
    @RequestMapping(value = "/s/findMemberList", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findMemberList(HttpServletRequest request, MemberVO memberVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMemberList(sessionVO, memberVO);
    }

    /**
     * 获取部门列表
     *
     * @param request    用户参数
     * @param department (暂时没用到)
     * @return 部门列表
     */
    @RequestMapping(value = "/s/findDepartmentList", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDepartmentList(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDepartmentList(sessionVO, department);
    }

    /**
     * 添加部门
     *
     * @param request    用户参数
     * @param department 部门参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/addDepartment", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addDepartment(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertDepartment(sessionVO, department);
    }

    /**
     * 添加部门成员
     *
     * @param request 用户参数
     * @param member  成员参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/addMember", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addMember(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertMember(sessionVO, member);
    }

    /**
     * 更新成员信息
     *
     * @param request 用户参数
     * @param member  成员参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateMember", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateMember(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateMember(sessionVO, member);
    }

    /**
     * 更新部门信息
     *
     * @param request    用户参数
     * @param department 部门Id
     * @return 图片路径
     */
    @RequestMapping(value = "/s/updateDepartment", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateDepartment(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateDepartment(sessionVO, department);
    }

    /**
     * 获取部门详情
     *
     * @param request    用户参数
     * @param department 部门Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/findDepartmentInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findDepartmentInfo(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findDepartmentInfo(sessionVO, department);
    }

    /**
     * 删除部门
     *
     * @param request    用户参数
     * @param department 部门Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/deleteDepartment", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deleteDepartment(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteDepartment(sessionVO, department);
    }

    /**
     * 删除部门成员
     *
     * @param request 用户参数
     * @param member  成员的用户Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/deleteMember", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO deleteMember(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.deleteMember(sessionVO, member);
    }

    /**
     * 获取职位列表
     *
     * @param request    用户参数
     * @param department 部门Id
     * @return 职位列表
     */
    @RequestMapping(value = "/s/findPositionList", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findPositionList(HttpServletRequest request, DepartmentVO department)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findPositionList(sessionVO, department);
    }

    /**
     * 获取成员详细信息
     *
     * @param request 用户参数
     * @param member  成员的用户Id
     * @return 成员详细信息
     */
    @RequestMapping(value = "/s/findMemberInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findMemberInfo(HttpServletRequest request, MemberVO member)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findMemberInfo(sessionVO, member);
    }

    /**
     * 获取当前在任职位的总人数
     *
     * @param request  用户参数
     * @param position 职位的Id
     * @return
     */
    @RequestMapping(value = "/s/countPositionMember", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO countPositionMember(HttpServletRequest request, PositionVO position)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.countPositionMember(sessionVO, position);
    }

    /**
     * 上传身份证正面照片
     *
     * @param file    图片文件
     * @param request 用户参数
     * @return 图片文件的物理地址
     */
    @RequestMapping(value = "/s/insertCardFront", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertCardFront(@RequestParam(value = "cardFront", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCardFront(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    /**
     * 上传身份证背面照片
     *
     * @param file    图片文件
     * @param request 用户参数
     * @return 图片文件的物理地址
     */
    @RequestMapping(value = "/s/insertCardBack", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertCardBack(@RequestParam(value = "cardBack", required = false) MultipartFile file, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCardBack(sessionVO, file, request.getSession().getServletContext().getRealPath("/"));
    }

    /**
     * 获取身份证图片
     *
     * @param path 图片路径
     * @return 图片文件
     */
    @RequestMapping(value = "/s/getCardImage", method = RequestMethod.GET)
    public String getCardFront(String path)
    {
        return "forward:" + path;
    }

}
