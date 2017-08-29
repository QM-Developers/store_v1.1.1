package com.dgg.store.util.vo.order;

public class MyOrderListVO
{
    private String orderId;

    private String standardId;

    private String goodsName;

    private Float goodsPrice;

    private String goodsImage;

    private String goodsDescribe;

    private String standardName;

    private Integer buyNum;

    private Integer refundNum;

    private Integer repertory;

    public String getOrderId()
    {
        return orderId;
    }

    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }

    public String getStandardId()
    {
        return standardId;
    }

    public void setStandardId(String standardId)
    {
        this.standardId = standardId;
    }

    public String getGoodsName()
    {
        return goodsName;
    }

    public void setGoodsName(String goodsName)
    {
        this.goodsName = goodsName;
    }

    public Float getGoodsPrice()
    {
        return goodsPrice;
    }

    public void setGoodsPrice(Float goodsPrice)
    {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsImage()
    {
        return goodsImage;
    }

    public void setGoodsImage(String goodsImage)
    {
        this.goodsImage = goodsImage;
    }

    public String getGoodsDescribe()
    {
        return goodsDescribe;
    }

    public void setGoodsDescribe(String goodsDescribe)
    {
        this.goodsDescribe = goodsDescribe;
    }

    public String getStandardName()
    {
        return standardName;
    }

    public void setStandardName(String standardName)
    {
        this.standardName = standardName;
    }

    public Integer getBuyNum()
    {
        return buyNum;
    }

    public void setBuyNum(Integer buyNum)
    {
        this.buyNum = buyNum;
    }

    public Integer getRefundNum()
    {
        return refundNum;
    }

    public void setRefundNum(Integer refundNum)
    {
        this.refundNum = refundNum;
    }

    public Integer getRepertory()
    {
        return repertory;
    }

    public void setRepertory(Integer repertory)
    {
        this.repertory = repertory;
    }
}
