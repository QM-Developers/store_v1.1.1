package com.dgg.store.util.pojo;

import java.util.Date;

public class GoodsAttr {
    private String goodsAttrId;

    private String goodsId;

    private String goodsAttrName;

    private String goodsAttrType;

    private Byte isDeleted;

    private Date deleteDate;

    public String getGoodsAttrId() {
        return goodsAttrId;
    }

    public void setGoodsAttrId(String goodsAttrId) {
        this.goodsAttrId = goodsAttrId == null ? null : goodsAttrId.trim();
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getGoodsAttrName() {
        return goodsAttrName;
    }

    public void setGoodsAttrName(String goodsAttrName) {
        this.goodsAttrName = goodsAttrName == null ? null : goodsAttrName.trim();
    }

    public String getGoodsAttrType() {
        return goodsAttrType;
    }

    public void setGoodsAttrType(String goodsAttrType) {
        this.goodsAttrType = goodsAttrType == null ? null : goodsAttrType.trim();
    }

    public Byte getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Byte isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Date getDeleteDate() {
        return deleteDate;
    }

    public void setDeleteDate(Date deleteDate) {
        this.deleteDate = deleteDate;
    }
}