package com.dgg.store.controller.common;

import com.dgg.store.service.common.FriendsService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.FriendRequest;
import com.dgg.store.util.vo.friend.FriendVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FriendsController
{
    @Autowired
    private FriendsService service;

    @RequestMapping(value = "user_findFriendRequest", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findFriendRequest(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findFriendRequest(sessionVO);
    }

    @RequestMapping(value = "user_findFriendRequestById",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findFriendRequestById(HttpServletRequest request,FriendRequest friendRequest)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findFriendRequestById(sessionVO,friendRequest);
    }

    @RequestMapping(value = "user_addFriendRequest", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addFriendRequest(HttpServletRequest request, FriendRequest friendRequest)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertFriendRequest(sessionVO, friendRequest);
    }

    @RequestMapping(value = "user_findUserByPhone", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findUserByPhone(HttpServletRequest request, FriendVO friendsVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findUserByPhone(sessionVO, friendsVO);
    }

    @RequestMapping(value = "user_findUserByPhoneOrName", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findUserByPhoneOrName(HttpServletRequest request, FriendVO friendsVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findUserByPhoneOrName(sessionVO, friendsVO);
    }

    @RequestMapping(value = "user_findFriendRequestCount",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findFriendRequestCount(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findFriendRequestCount(sessionVO);
    }

    @RequestMapping(value = "user_updateRequestIsRead",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateRequestIsRead(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateRequestIsRead(sessionVO);
    }

    @RequestMapping(value = "user_agreeFriendRequest",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO agreeFriendRequest(HttpServletRequest request,FriendRequest friendRequest)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertAgreeRequest(sessionVO,friendRequest);
    }

    @RequestMapping(value = "user_negativeFriendRequest",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO negativeFriendRequest(HttpServletRequest request,FriendRequest friendRequest)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertNegativeRequest(sessionVO,friendRequest);
    }

    @RequestMapping(value = "user_findFriendList",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findFriendList(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findFriendList(sessionVO);
    }

    @RequestMapping(value = "user_findFriendData",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findFriendData(HttpServletRequest request,FriendVO friendVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findFriendData(sessionVO,friendVO);
    }

    @RequestMapping(value = "user_findFriendDataById",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findFriendDataById(HttpServletRequest request,FriendVO friendVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findFriendDataById(sessionVO,friendVO);
    }

    @RequestMapping(value = "user_updateFriendRemark",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateFriendRemark(HttpServletRequest request,FriendVO friendVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateFriendRemark(sessionVO,friendVO);
    }
}
