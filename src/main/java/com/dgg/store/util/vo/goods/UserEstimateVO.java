package com.dgg.store.util.vo.goods;

public class UserEstimateVO
{
    private Integer estimateId;

    private Byte estimateNum;

    private String estimateText;

    private String userId;

    private String userName;

    private String goodsId;

    private int pageSize;

    private int pageNum;

    public Integer getEstimateId() {
        return estimateId;
    }

    public void setEstimateId(Integer estimateId) {
        this.estimateId = estimateId;
    }

    public Byte getEstimateNum() {
        return estimateNum;
    }

    public void setEstimateNum(Byte estimateNum) {
        this.estimateNum = estimateNum;
    }

    public String getEstimateText() {
        return estimateText;
    }

    public void setEstimateText(String estimateText) {
        this.estimateText = estimateText == null ? null : estimateText.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }
}
