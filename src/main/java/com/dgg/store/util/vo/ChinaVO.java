package com.dgg.store.util.vo;

import java.util.List;

public class ChinaVO
{
    private String id;

    private String name;

    private String pid;

    private List<ChinaVO> child;

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getPid()
    {
        return pid;
    }

    public void setPid(String pid)
    {
        this.pid = pid;
    }

    public List<ChinaVO> getChild()
    {
        return child;
    }

    public void setChild(List<ChinaVO> child)
    {
        this.child = child;
    }
}
