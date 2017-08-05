package com.dgg.store.util.core.page;

public class PagingUtil
{
    public static final int getStart(int pageNum, int pageSize)
    {
        return (pageNum - 1) * pageSize;
    }

    public static final int getCount(int rowCount, int pageSize)
    {
        return rowCount % pageSize == 0 ? rowCount / pageSize : rowCount / pageSize + 1;
    }
}
