package com.dgg.store.util.pojo;

public class ShoppingCar
{
    private String userId;
    private String goodsId;
    private String standardId;
    private Integer goodsNum;

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
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

    public Integer getGoodsNum()
    {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum)
    {
        this.goodsNum = goodsNum;
    }
}
