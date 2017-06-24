package com.dgg.store.util.pojo;

public class GoodsStandard
{
    private String standardId;

    private String goodsId;

    private String standardName;

    private Float standardPrice;

    private Integer standardCount;

    public GoodsStandard()
    {
    }

    public GoodsStandard(String goodsId)
    {
        this.goodsId = goodsId;
    }

    public String getStandardId() {
        return standardId;
    }

    public void setStandardId(String standardId) {
        this.standardId = standardId == null ? null : standardId.trim();
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getStandardName() {
        return standardName;
    }

    public void setStandardName(String standardName) {
        this.standardName = standardName == null ? null : standardName.trim();
    }

    public Float getStandardPrice() {
        return standardPrice;
    }

    public void setStandardPrice(Float standardPrice) {
        this.standardPrice = standardPrice;
    }

    public Integer getStandardCount() {
        return standardCount;
    }

    public void setStandardCount(Integer standardCount) {
        this.standardCount = standardCount;
    }
}