package com.dgg.store.util.pojo;

import java.util.List;

public class RepertoryIncomeList {
    private String recordId;

    private String goodsId;

    private String goodsName;

    private String goodsCode;

    private String standardId;

    private String standardName;

    private Integer standardCount;

    private String goodsImage;

    private Integer currentCount;

    private List<GoodsStandard> standardList;
    private String goodsType;

    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId == null ? null : recordId.trim();
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getStandardId() {
        return standardId;
    }

    public void setStandardId(String standardId) {
        this.standardId = standardId == null ? null : standardId.trim();
    }

    public String getStandardName() {
        return standardName;
    }

    public void setStandardName(String standardName) {
        this.standardName = standardName == null ? null : standardName.trim();
    }

    public Integer getStandardCount() {
        return standardCount;
    }

    public void setStandardCount(Integer standardCount) {
        this.standardCount = standardCount;
    }

    public String getGoodsImage()
    {
        return goodsImage;
    }

    public void setGoodsImage(String goodsImage)
    {
        this.goodsImage = goodsImage;
    }

    public List<GoodsStandard> getStandardList()
    {
        return standardList;
    }

    public void setStandardList(List<GoodsStandard> standardList)
    {
        this.standardList = standardList;
    }

    public String getGoodsCode()
    {
        return goodsCode;
    }

    public void setGoodsCode(String goodsCode)
    {
        this.goodsCode = goodsCode;
    }

    public Integer getCurrentCount()
    {
        return currentCount;
    }

    public void setCurrentCount(Integer currentCount)
    {
        this.currentCount = currentCount;
    }

    public void setGoodsType(String goodsType)
    {
        this.goodsType = goodsType;
    }

    public String getGoodsType()
    {
        return goodsType;
    }
}