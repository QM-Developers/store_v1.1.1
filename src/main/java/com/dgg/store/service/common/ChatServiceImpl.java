package com.dgg.store.service.common;

import com.dgg.store.dao.common.ChatDao;
import com.dgg.store.util.pojo.ChatHistory;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.friend.FriendVO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatServiceImpl implements ChatService
{
    @Autowired
    private ChatDao dao;

    @Override
    public ResultVO insertChatMessage(SessionVO sessionVO, ChatHistory chatHistory)
    {
        chatHistory.setSendUserId(sessionVO.getUserId());
        int result = dao.insertChatMessage(chatHistory);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findNotReadChatHistoryCount(SessionVO sessionVO)
    {
        ChatHistory condition = new ChatHistory();
        condition.setReceiveUserId(sessionVO.getUserId());
        condition.setIsRead(ChatHistory.NOT_READ);
        List<ChatHistory> result = dao.findNotReadChatHistoryCount(condition);

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findNotReadChatHistory(SessionVO sessionVO)
    {
        ChatHistory condition = new ChatHistory();
        condition.setIsRead(ChatHistory.NOT_READ);
        condition.setReceiveUserId(sessionVO.getUserId());
        List<ChatHistory> result = dao.findChatHistory(condition);

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateChatHistoryIsRead(SessionVO sessionVO)
    {
        ChatHistory condition = new ChatHistory();
        condition.setReceiveUserId(sessionVO.getUserId());
        condition.setIsRead(ChatHistory.IS_READ);
        int result = dao.updateChatHistory(condition);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findUserChatInfoById(SessionVO sessionVO)
    {
        FriendVO result = dao.findUserChatInfoById(sessionVO.getUserId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateReceivedMessage(SessionVO sessionVO, ChatHistory chatHistory)
    {
        ChatHistory condition = new ChatHistory();
        condition.setIsReceived(ChatHistory.IS_READ);
        condition.setHistoryId(chatHistory.getHistoryId());

        int result = dao.updateChatHistory(condition);

        ResultVO resultVO = new ResultVO(result,sessionVO.getToken(),result);

        return resultVO;
    }

    @Override
    public ResultVO countNoReceivedMessage(SessionVO sessionVO, ChatHistory chatHistory)
    {
        ChatHistory condition = new ChatHistory();
        condition.setReceiveUserId(sessionVO.getUserId());

        int result = dao.countNoReceivedMessage(condition);

        ResultVO resultVO = new ResultVO(1,sessionVO.getToken(),result);

        return resultVO;
    }

    @Override
    public ResultVO updateAllReceivedMessage(SessionVO sessionVO, ChatHistory chatHistory)
    {
        ChatHistory condition = new ChatHistory();
        condition.setReceiveUserId(chatHistory.getReceiveUserId());
        condition.setIsReceived(ChatHistory.NOT_READ);

        List<ChatHistory> result = dao.findChatHistory(condition);

        condition.setIsReceived(ChatHistory.IS_READ);
        dao.updateChatHistory(condition);

        ResultVO resultVO = new ResultVO(1,sessionVO.getToken(),result);

        return resultVO;
    }

    @Override
    public ResultVO listNoReceivedMessage(SessionVO sessionVO, ChatHistory chatHistory)
    {
        ChatHistory condition = new ChatHistory();
        condition.setReceiveUserId(sessionVO.getUserId());

        List<ChatHistory> result = dao.listNoReceivedMessage(condition);

        ResultVO resultVO = new ResultVO(1,sessionVO.getToken(),result);

        return resultVO;
    }
}
