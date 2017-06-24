package com.dgg.store.util.pojo;

import java.util.Date;

public class GoodsParentTag {
    private String goodsParentTagId;

    private String goodsParentTagText;

    private Byte isDeleted;

    private Date deleteDate;

    public String getGoodsParentTagId() {
        return goodsParentTagId;
    }

    public void setGoodsParentTagId(String goodsParentTagId) {
        this.goodsParentTagId = goodsParentTagId == null ? null : goodsParentTagId.trim();
    }

    public String getGoodsParentTagText() {
        return goodsParentTagText;
    }

    public void setGoodsParentTagText(String goodsParentTagText) {
        this.goodsParentTagText = goodsParentTagText == null ? null : goodsParentTagText.trim();
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