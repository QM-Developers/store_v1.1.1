package com.dgg.store.util.core.generator;


import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.date.TimestampUtil;

import java.util.UUID;

public class IDGenerator
{
    public static final String generator()
    {
        return UUID.randomUUID().toString().replaceAll(SymbolConstant.SUBTRACT, Constant.EMPTY);
    }

    public static String getNow()
    {
        long now = System.currentTimeMillis();
        return String.format("%d%d%d", TimestampUtil.getYear(now), TimestampUtil.getMonth(now), TimestampUtil.getDayOfMonth(now));
    }
}
