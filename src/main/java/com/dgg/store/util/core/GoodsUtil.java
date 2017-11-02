package com.dgg.store.util.core;

import com.dgg.store.dao.common.GoodsBrowseDao;

import java.util.HashSet;
import java.util.Set;

public class GoodsUtil
{
    public static Set<String> findChildTypeId(String typeId, GoodsBrowseDao dao)
    {
        Set<String> childTypeId = dao.findChildTypeId(typeId);
        Set<String> temp = new HashSet<>();

        for (String s : childTypeId)
            temp.addAll(findChildTypeId(s, dao));
        childTypeId.addAll(temp);

        return childTypeId;
    }
}
