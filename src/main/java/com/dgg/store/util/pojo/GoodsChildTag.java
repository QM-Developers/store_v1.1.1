package com.dgg.store.util.pojo;

import java.util.Date;

public class GoodsChildTag {
    private String goodsChildTagId;

    private String goodsParentTagId;

    private String goodsChildTagText;

    private Byte isDeleted;

    private Date deleteDate;

    public String getGoodsChildTagId() {
        return goodsChildTagId;
    }

    public void setGoodsChildTagId(String goodsChildTagId) {
        this.goodsChildTagId = goodsChildTagId == null ? null : goodsChildTagId.trim();
    }

    public String getGoodsParentTagId() {
        return goodsParentTagId;
    }

    public void setGoodsParentTagId(String goodsParentTagId) {
        this.goodsParentTagId = goodsParentTagId == null ? null : goodsParentTagId.trim();
    }

    public String getGoodsChildTagText() {
        return goodsChildTagText;
    }

    public void setGoodsChildTagText(String goodsChildTagText) {
        this.goodsChildTagText = goodsChildTagText == null ? null : goodsChildTagText.trim();
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