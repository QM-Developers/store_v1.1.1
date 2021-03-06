package com.dgg.store.util.vo.goods;

import java.util.List;
import java.util.Set;

public class GoodsTypeVO
{
    private String goodsTypeId;

    private String keyword;

    private String orderBy;

    private String sort;

    private String myTeamId;

    private String goodsTypeName;

    private String goodsTypePid;

    private GoodsTypeVO parent;

    private List<GoodsTypeVO> children;

    private String userId;

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

    public List<GoodsTypeVO> getChildren()
    {
        return children;
    }

    public void setChildren(List<GoodsTypeVO> children)
    {
        this.children = children;
    }

    public String getKeyword()
    {
        return keyword;
    }

    public void setKeyword(String keyword)
    {
        this.keyword = keyword;
    }

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
    }

    public String getOrderBy()
    {
        return orderBy;
    }

    public void setOrderBy(String orderBy)
    {
        this.orderBy = orderBy;
    }

    public String getSort()
    {
        return sort;
    }

    public void setSort(String sort)
    {
        this.sort = sort;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }
}
