package com.dgg.store.util.vo.order;

public class MyOrderListVO
{
    private String orderId;

    private String goodsName;

    private Float goodsPrice;

    private String goodsImage;

    private String goodsDescribe;

    private String standardName;

    private int buyNum;

    private int refundNum;

    public String getOrderId()
    {
        return orderId;
    }

    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
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

    public int getBuyNum()
    {
        return buyNum;
    }

    public void setBuyNum(int buyNum)
    {
        this.buyNum = buyNum;
    }

    public int getRefundNum()
    {
        return refundNum;
    }

    public void setRefundNum(int refundNum)
    {
        this.refundNum = refundNum;
    }
}
