package com.dgg.store.util.core;

import org.apache.log4j.Logger;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LoggerUtil
{
    private static SimpleDateFormat simpleDateFormat;

    private static String getDate()
    {
        if (simpleDateFormat == null)
            simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return simpleDateFormat.format(new Date());
    }

    public static void error(String method, Class clazz, Object e)
    {
        Logger.getLogger(clazz).error(getDate() + " [ " + method + " ] " + e);
    }
}
