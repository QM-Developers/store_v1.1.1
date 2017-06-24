package com.dgg.store.service.servicer;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;

public class TestMenu
{
    private static ApplicationContext app;

    @BeforeClass
    public static void setUpSpring()
    {
//        String context = "src/main/webapp/WEB-INF/spring/application-context-test.xml";
//        File file = new File(context);
//        app = new FileSystemXmlApplicationContext(context);
    }

    @Test
    public void testAddAuthority()
    {
    }

    @Test
    public void test()
    {
        System.out.println(System.getProperty("user.dir"));
    }

    @Test
    public void testStoreId()
    {
        ConvertTo36(10007);
        ConvertTo10("00001");
    }

    private final String X36 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    //10进制转换成36进制
    public String ConvertTo36(int val)
    {
        String result = "";
        while (val >= 36)
        {
            result = X36.charAt(val % 36) + result;
            val /= 36;
        }
        if (val >= 0) result = X36.charAt(val) + result;
        while(result.length() < 5)
            result = "0"+result;

        return result;
    }

    //36进制转换成10进制
    public int ConvertTo10(String str)
    {
        int result = 0;
        int len = str.length();
        for (int i = len; i > 0; i--)
            result += X36.indexOf(str.charAt(i - 1)) * Math.pow(36, len - i);

        return result;
    }
}
