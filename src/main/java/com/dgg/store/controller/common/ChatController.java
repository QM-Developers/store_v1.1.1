package com.dgg.store.controller.common;

import com.dgg.store.service.common.ChatService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.pojo.ChatHistory;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.friend.FriendVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ChatController
{
    @Autowired
    private ChatService service;

    @RequestMapping(value = "user_addChatMessage", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO addChatMessage(HttpServletRequest request, ChatHistory chatHistory)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertChatMessage(sessionVO, chatHistory);
    }

    @RequestMapping(value = "user_countNoReceivedMessage", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO countNoReceivedMessage(HttpServletRequest request, ChatHistory chatHistory)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.countNoReceivedMessage(sessionVO, chatHistory);
    }

    @RequestMapping(value = "user_listNoReceivedMessage", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO listNoReceivedMessage(HttpServletRequest request, ChatHistory chatHistory)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listNoReceivedMessage(sessionVO, chatHistory);
    }

    @RequestMapping(value = "user_updateReceivedMessage", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateReceivedMessage(HttpServletRequest request, ChatHistory chatHistory)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateReceivedMessage(sessionVO, chatHistory);
    }

    @RequestMapping(value = "user_updateAllReceivedMessage", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateAllReceivedMessage(HttpServletRequest request, ChatHistory chatHistory)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateAllReceivedMessage(sessionVO, chatHistory);
    }

    @RequestMapping(value = "user_findNotReadChatHistoryCount", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findNotReadChatHistoryCount(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findNotReadChatHistoryCount(sessionVO);
    }

    @RequestMapping(value = "user_findNotReadChatHistory", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findNotReadChatHistory(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findNotReadChatHistory(sessionVO);
    }

    @RequestMapping(value = "user_updateChatHistoryIsRead", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateChatHistoryIsRead(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateChatHistoryIsRead(sessionVO);
    }

    @RequestMapping(value = "user_findUserChatInfoById", method = RequestMethod.POST)
    @ResponseBody
    public ResultVO findUserChatInfoById(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.findUserChatInfoById(sessionVO);
    }
}
