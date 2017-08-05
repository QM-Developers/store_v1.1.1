package com.dgg.store.util.vo.branch;

public class BranchGoodsVO
{
    private String branchId;

    private String goodsId;

    private String standardId;

    private int standardCount;

    public String getBranchId()
    {
        return branchId;
    }

    public void setBranchId(String branchId)
    {
        this.branchId = branchId;
    }

    public String getGoodsId()
    {
        return goodsId;
    }

    public void setGoodsId(String goodsId)
    {
        this.goodsId = goodsId;
    }

    public String getStandardId()
    {
        return standardId;
    }

    public void setStandardId(String standardId)
    {
        this.standardId = standardId;
    }

    public int getStandardCount()
    {
        return standardCount;
    }

    public void setStandardCount(int standardCount)
    {
        this.standardCount = standardCount;
    }
}
