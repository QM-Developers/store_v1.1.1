package com.dgg.store.util.core.convert;


public class ConvertUtil
{
    private static final String X36 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    //10进制转换成36进制
    public static final String _10ConvertTo36(int val)
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
    public static final Integer _36ConvertTo10(String str)
    {
        int result = 0;
        int len = str.length();
        for (int i = len; i > 0; i--)
            result += X36.indexOf(str.charAt(i - 1)) * Math.pow(36, len - i);

        return result;
    }
}
