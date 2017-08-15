package com.dgg.store.util.core.parameter;

public class ParameterUtil
{
    public static int getDefault(Integer param)
    {
        return param == null ? 0 : param;
    }

    public static String getDefault(String param)
    {
        return param == null ? "" : param;
    }

    public static float getDefault(Float param)
    {
        return param == null ? 0 : param;
    }
}
