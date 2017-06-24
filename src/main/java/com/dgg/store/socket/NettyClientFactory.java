package com.dgg.store.socket;

import java.io.IOException;
import java.util.Properties;

public class NettyClientFactory
{
    private static NettyClient instance;
    private static String host;
    private static int port;

    static
    {
        ClassLoader classloader = Thread.currentThread().getContextClassLoader();
        Properties prop = new Properties();
        try
        {
            prop.load(classloader.getResourceAsStream("netty.ini"));
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        host = prop.getProperty("HOST");
        port = Integer.valueOf(prop.getProperty("PORT"));
    }

    private NettyClientFactory()
    {
    }

    public synchronized static NettyClient getInstance()
    {
        if(instance == null)
        {
            instance = new NettyClient();
            try
            {
                instance.connect(port,host);
            } catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        return instance;
    }
}
