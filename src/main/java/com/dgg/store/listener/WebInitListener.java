package com.dgg.store.listener;

import com.dgg.store.socket.NettyClientFactory;

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
        new Thread(new Runnable()
        {
            @Override
            public void run()
            {
                NettyClientFactory.getInstance();
            }
        }).start();
    }
}