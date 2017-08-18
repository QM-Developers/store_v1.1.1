package com.dgg.store.util.core.reflect;

import com.dgg.store.util.core.constant.BaseDataConstant;
import com.dgg.store.util.core.constant.Constant;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class ReflectUtil
{
    public static Object getDefault(Object obj)
    {
        Class clazz = obj.getClass();
        Field[] fields = clazz.getDeclaredFields();
        try
        {
            for (Field f : fields)
            {
                Method get = clazz.getMethod("get" + captureName(f.getName()));
                if (get.invoke(obj) == null)
                {
                    Method set = clazz.getMethod("set" + captureName(f.getName()), f.getType());
                    switch (f.getType().getName())
                    {
                        case BaseDataConstant.INTEGER:
                            set.invoke(obj, Constant.ZERO);
                            break;
                        case BaseDataConstant.BYTE:
                            set.invoke(obj, (byte) Constant.ZERO);
                            break;
                        default:
                            set.invoke(obj, f.getType().newInstance());
                            break;
                    }
                }
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return obj;
    }

    private static String captureName(String name)
    {
        char[] cs = name.toCharArray();
        cs[0] -= 32;
        return String.valueOf(cs);
    }

    public static boolean hadNull(Object obj)
    {
        Class clazz = obj.getClass();
        Field[] fields = clazz.getDeclaredFields();
        try
        {
            for (Field f : fields)
            {
                Method get = clazz.getMethod("get" + captureName(f.getName()));
                if (get.invoke(obj) == null)
                    return true;
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }
}
