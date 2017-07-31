package com.dgg.store.service.common;

import com.dgg.store.util.pojo.ChatHistory;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.friend.FriendVO;

public interface ChatService
{
    ResultVO insertChatMessage(SessionVO sessionVO, ChatHistory chatHistory);

    ResultVO findNotReadChatHistoryCount(SessionVO sessionVO);

    ResultVO findNotReadChatHistory(SessionVO sessionVO);

    ResultVO updateChatHistoryIsRead(SessionVO sessionVO);

    ResultVO findUserChatInfoById(SessionVO sessionVO);

    ResultVO updateReceivedMessage(SessionVO sessionVO, ChatHistory chatHistory);

    ResultVO countNoReceivedMessage(SessionVO sessionVO, ChatHistory chatHistory);

    ResultVO updateAllReceivedMessage(SessionVO sessionVO, ChatHistory chatHistory);
}
