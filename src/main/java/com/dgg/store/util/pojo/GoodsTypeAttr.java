package com.dgg.store.util.pojo;

import java.util.Date;

public class GoodsTypeAttr {
    private String goodsTypeAttrId;

    private String goodsTypeId;

    private String goodsTypeAttrName;

    private String goodsTypeAttrValue;

    private String goodsTypeAttrConst;

    private String goodsTypeAttrInputType;

    public String getGoodsTypeAttrId() {
        return goodsTypeAttrId;
    }

    public void setGoodsTypeAttrId(String goodsTypeAttrId) {
        this.goodsTypeAttrId = goodsTypeAttrId == null ? null : goodsTypeAttrId.trim();
    }

    public String getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(String goodsTypeId) {
        this.goodsTypeId = goodsTypeId == null ? null : goodsTypeId.trim();
    }

    public String getGoodsTypeAttrName() {
        return goodsTypeAttrName;
    }

    public void setGoodsTypeAttrName(String goodsTypeAttrName) {
        this.goodsTypeAttrName = goodsTypeAttrName == null ? null : goodsTypeAttrName.trim();
    }

    public String getGoodsTypeAttrValue() {
        return goodsTypeAttrValue;
    }

    public void setGoodsTypeAttrValue(String goodsTypeAttrValue) {
        this.goodsTypeAttrValue = goodsTypeAttrValue == null ? null : goodsTypeAttrValue.trim();
    }

    public String getGoodsTypeAttrConst() {
        return goodsTypeAttrConst;
    }

    public void setGoodsTypeAttrConst(String goodsTypeAttrConst) {
        this.goodsTypeAttrConst = goodsTypeAttrConst == null ? null : goodsTypeAttrConst.trim();
    }

    public String getGoodsTypeAttrInputType() {
        return goodsTypeAttrInputType;
    }

    public void setGoodsTypeAttrInputType(String goodsTypeAttrInputType) {
        this.goodsTypeAttrInputType = goodsTypeAttrInputType == null ? null : goodsTypeAttrInputType.trim();
    }
}