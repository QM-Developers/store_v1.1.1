package com.dgg.store.service.sys;

import com.dgg.store.util.pojo.PushMessage;
import com.dgg.store.util.vo.core.SessionVO;

public interface PushMessageService
{
    String insertPushMessage(SessionVO sessionVO, PushMessage message);

    String deletePushMessage(SessionVO sessionVO, PushMessage message);

    String updatePushMessage(SessionVO sessionVO, PushMessage message);

    String listPushMessage(SessionVO sessionVO, PushMessage message);
}
