package com.dgg.store.util.core.parameter;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class ParameterUtil
{
    public static String getDefault(String value, String defValue)
    {
        return value == null ? defValue : value;
    }

    public static Integer getDefault(Integer value, Integer defValue)
    {
        return value == null ? defValue : value;
    }

    public static boolean objectIsNull(Object obj)
    {
        Class instance = obj.getClass();
        Field[] fields = instance.getDeclaredFields();
        Method get;
        try
        {
            for (Field f : fields)
            {
                get = instance.getMethod("get" + upperCase(f.getName()));
                if (get.invoke(obj) == null)
                    return true;
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    private static String upperCase(String str)
    {
        char[] ch = str.toCharArray();
        if (ch[0] >= 'a' && ch[0] <= 'z')
        {
            ch[0] = (char) (ch[0] - 32);
        }
        return new String(ch);
    }
}
