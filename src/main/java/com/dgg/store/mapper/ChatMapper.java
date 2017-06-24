package com.dgg.store.mapper;

import com.dgg.store.util.pojo.ChatHistory;

import java.util.List;

public interface ChatMapper
{
    int insertChatMessage(ChatHistory chatHistory);

    List<ChatHistory> findNotReadChatHistoryCount(ChatHistory condition);

    List<ChatHistory> findChatHistory(ChatHistory condition);

    int updateChatHistory(ChatHistory condition);
}
