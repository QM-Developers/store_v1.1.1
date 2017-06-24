package com.dgg.store.util.vo.core;

import java.util.List;

public class TreeVO
{
    private String id;
    private String name;
    private boolean checked;
    private String pId;
    private String url;
    private List<TreeVO> children;

    public TreeVO()
    {
    }

    public TreeVO(String id, String name)
    {
        this.id = id;
        this.name = name;
    }

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

    public boolean isChecked()
    {
        return checked;
    }

    public void setChecked(boolean checked)
    {
        this.checked = checked;
    }

    public String getpId()
    {
        return pId;
    }

    public void setpId(String pId)
    {
        this.pId = pId;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    public List<TreeVO> getChildren()
    {
        return children;
    }

    public void setChildren(List<TreeVO> children)
    {
        this.children = children;
    }
}
