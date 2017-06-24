package com.dgg.store.util.factory;

import com.dgg.store.util.vo.ChinaVO;

import java.util.ArrayList;
import java.util.List;

public class ChinaFactory
{
    private static List<ChinaVO> instance;

    private ChinaFactory()
    {
    }

    public synchronized static List<ChinaVO> getInstance()
    {
        if(instance == null)
            instance = new ArrayList<>();
        return instance;
    }
}
