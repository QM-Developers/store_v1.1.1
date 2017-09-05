package com.dgg.store.util.core.umeng.push;

import com.dgg.store.mapper.PushMessageMapper;
import com.dgg.store.util.pojo.PushMessage;
import com.dgg.store.util.pojo.PushMessageExample;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PushMessageFactory
{
    private static Map<String,PushMessage> instance;

    private PushMessageFactory()
    {
    }

    public static final Map<String,PushMessage> getInstance(PushMessageMapper mapper)
    {
        if (instance == null)
        {
            PushMessageExample example = new PushMessageExample();
            List<PushMessage> result = mapper.selectByExample(example);
            instance = new HashMap<>();
            for (PushMessage msg : result)
                instance.put(msg.getMsgId(),msg);
        }
        return instance;
    }
}
