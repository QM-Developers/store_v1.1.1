package com.dgg.store.dao.common;

import com.dgg.store.mapper.ChatMapper;
import com.dgg.store.util.pojo.ChatHistory;
import com.dgg.store.util.vo.friend.FriendVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ChatDaoImpl implements ChatDao
{
    @Autowired
    private ChatMapper mapper;

    @Override
    public int insertChatMessage(ChatHistory chatHistory)
    {
        return mapper.insertChatMessage(chatHistory);
    }

    @Override
    public List<ChatHistory> findNotReadChatHistoryCount(ChatHistory condition)
    {
        return mapper.findNotReadChatHistoryCount(condition);
    }

    @Override
    public List<ChatHistory> findChatHistory(ChatHistory condition)
    {
        return mapper.findChatHistory(condition);
    }

    @Override
    public int updateChatHistory(ChatHistory condition)
    {
        return mapper.updateChatHistory(condition);
    }

    @Override
    public FriendVO findUserChatInfoById(String friendUserId)
    {
        return mapper.findUserChatInfoById(friendUserId);
    }

    @Override
    public int countNoReceivedMessage(ChatHistory condition)
    {
        return mapper.countNoReceivedMessage(condition);
    }
}
