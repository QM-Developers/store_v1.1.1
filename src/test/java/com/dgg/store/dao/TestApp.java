package com.dgg.store.dao;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class TestApp
{
    @Test
    public void test()
    {
        ApplicationContext app = new FileSystemXmlApplicationContext("src/main/webapp/WEB-INF/spring/application-context.xml");

    }
}
