package com.dgg.store.service.common;

import com.dgg.store.util.pojo.ChatHistory;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface ChatService
{
    ResultVO insertChatMessage(SessionVO sessionVO, ChatHistory chatHistory);

    ResultVO findNotReadChatHistoryCount(SessionVO sessionVO);

    ResultVO findNotReadChatHistory(SessionVO sessionVO);

    ResultVO updateChatHistoryIsRead(SessionVO sessionVO);
}
