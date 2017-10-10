package com.dgg.store.util.core;

import com.dgg.store.dao.common.GoodsBrowseDao;

import java.util.Set;

public class GoodsUtil
{
    public static Set<String> findChildTypeId(String typeId, GoodsBrowseDao dao)
    {
        Set<String> childTypeId = dao.findChildTypeId(typeId);

        for (String s : childTypeId)
            childTypeId.addAll(findChildTypeId(s, dao));

        return childTypeId;
    }
}
