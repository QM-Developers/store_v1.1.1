package com.dgg.store.util.core.regex;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegExUtil
{
    public static final boolean matcher(String data,String regEx)
    {
        // 编译正则表达式
        Pattern pattern = Pattern.compile(regEx);
        // 忽略大小写的写法
        // Pattern pat = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(data);
        // 字符串是否与正则表达式相匹配
        return matcher.matches();
    }


}
