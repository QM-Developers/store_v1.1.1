package com.dgg.store.dao.common;

import com.dgg.store.util.pojo.ChatHistory;
import com.dgg.store.util.vo.friend.FriendVO;

import java.util.List;

public interface ChatDao
{
    int insertChatMessage(ChatHistory chatHistory);

    List<ChatHistory> findNotReadChatHistoryCount(ChatHistory condition);

    List<ChatHistory> findChatHistory(ChatHistory condition);

    int updateChatHistory(ChatHistory condition);

    FriendVO findUserChatInfoById(String friendUserId);

    int countNoReceivedMessage(ChatHistory condition);
}
