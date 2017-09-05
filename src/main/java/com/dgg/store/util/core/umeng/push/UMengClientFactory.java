package com.dgg.store.util.core.umeng.push;

public class UMengClientFactory
{
    private static PushClient instance;

    private UMengClientFactory()
    {
    }

    public static final PushClient getInstance()
    {
        if (instance == null)
            instance = new PushClient();
        return instance;
    }
}
