package com.dgg.store.socket;

public class NettyClientFactory
{
    private static NettyClient instance;

    private NettyClientFactory()
    {
    }

    public synchronized static NettyClient getInstance()
    {
        if(instance == null)
            instance = new NettyClient();
        return instance;
    }
}
