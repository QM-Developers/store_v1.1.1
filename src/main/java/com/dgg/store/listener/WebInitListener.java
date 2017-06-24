package com.dgg.store.listener;

import com.dgg.store.socket.NettyClient;
import com.dgg.store.socket.NettyClientFactory;
import com.dgg.store.util.core.constant.Constant;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class WebInitListener implements ServletContextListener
{

    @Override
    public void contextDestroyed(ServletContextEvent context)
    {

    }

    @Override
    public void contextInitialized(ServletContextEvent context)
    {
        Thread nettyClient = new Thread(() ->
        {
            NettyClient instance = NettyClientFactory.getInstance();
            try
            {
                instance.connect(Constant.NETTY_PORT,Constant.NETTY_HOST);
            } catch (Exception e)
            {
                e.printStackTrace();
            }
        });
        nettyClient.setDaemon(true);
        nettyClient.start();
    }
}