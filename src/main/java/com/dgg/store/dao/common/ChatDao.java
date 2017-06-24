package com.dgg.store.dao.common;

import com.dgg.store.util.pojo.ChatHistory;

import java.util.List;

public interface ChatDao
{
    int insertChatMessage(ChatHistory chatHistory);

    List<ChatHistory> findNotReadChatHistoryCount(ChatHistory condition);

    List<ChatHistory> findChatHistory(ChatHistory condition);

    int updateChatHistory(ChatHistory condition);
}
