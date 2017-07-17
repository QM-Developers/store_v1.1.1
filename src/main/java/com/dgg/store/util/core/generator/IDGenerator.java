package com.dgg.store.util.core.generator;


import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.SymbolConstant;

import java.util.UUID;

public class IDGenerator
{
    public static final String generator()
    {
        return UUID.randomUUID().toString().replaceAll(SymbolConstant.SUBTRACT, Constant.EMPTY);
    }
}
