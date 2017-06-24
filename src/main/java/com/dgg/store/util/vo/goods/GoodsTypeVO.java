package com.dgg.store.util.vo.goods;

import java.util.List;

public class GoodsTypeVO
{
    private String goodsTypeId;

    private String goodsTypeName;

    private String goodsTypePid;

    private GoodsTypeVO parent;

    private List<GoodsTypeVO> children;

    private int pageNum;

    private int pageSize;

    public String getGoodsTypeId()
    {
        return goodsTypeId;
    }

    public void setGoodsTypeId(String goodsTypeId)
    {
        this.goodsTypeId = goodsTypeId;
    }

    public String getGoodsTypeName()
    {
        return goodsTypeName;
    }

    public void setGoodsTypeName(String goodsTypeName)
    {
        this.goodsTypeName = goodsTypeName;
    }

    public String getGoodsTypePid()
    {
        return goodsTypePid;
    }

    public void setGoodsTypePid(String goodsTypePid)
    {
        this.goodsTypePid = goodsTypePid;
    }

    public GoodsTypeVO getParent()
    {
        return parent;
    }

    public void setParent(GoodsTypeVO parent)
    {
        this.parent = parent;
    }

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }

    public List<GoodsTypeVO> getChildren()
    {
        return children;
    }

    public void setChildren(List<GoodsTypeVO> children)
    {
        this.children = children;
    }
}
