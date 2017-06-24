package com.dgg.store.util.pojo;

import java.util.Date;

public class GoodsTypeinfo {
    private String goodsTypeId;

    private String goodsTypeName;

    private String goodsTypePid;

    private Byte isDeleted;

    private Date deleteDate;

    public String getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(String goodsTypeId) {
        this.goodsTypeId = goodsTypeId == null ? null : goodsTypeId.trim();
    }

    public String getGoodsTypeName() {
        return goodsTypeName;
    }

    public void setGoodsTypeName(String goodsTypeName) {
        this.goodsTypeName = goodsTypeName == null ? null : goodsTypeName.trim();
    }

    public String getGoodsTypePid() {
        return goodsTypePid;
    }

    public void setGoodsTypePid(String goodsTypePid) {
        this.goodsTypePid = goodsTypePid == null ? null : goodsTypePid.trim();
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