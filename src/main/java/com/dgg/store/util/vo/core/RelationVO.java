package com.dgg.store.util.vo.core;

public class RelationVO
{
    private String singleId;
    private String multiId;

    public RelationVO()
    {
    }

    public RelationVO(String singleId, String multiId)
    {
        this.singleId = singleId;
        this.multiId = multiId;
    }

    public String getSingleId()
    {
        return singleId;
    }

    public void setSingleId(String singleId)
    {
        this.singleId = singleId;
    }

    public String getMultiId()
    {
        return multiId;
    }

    public void setMultiId(String multiId)
    {
        this.multiId = multiId;
    }
}
