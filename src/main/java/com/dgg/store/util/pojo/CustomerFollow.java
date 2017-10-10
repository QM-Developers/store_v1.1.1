package com.dgg.store.util.pojo;

import java.util.Date;

public class CustomerFollow {
    private String followId;

    private String followTitle;

    private Date followDate;

    private String followContent;

    private String followResult;

    private String customerId;

    private String customerName;

    private String promoterId;

    private String promoterName;

    public String getFollowId() {
        return followId;
    }

    public void setFollowId(String followId) {
        this.followId = followId == null ? null : followId.trim();
    }

    public String getFollowTitle() {
        return followTitle;
    }

    public void setFollowTitle(String followTitle) {
        this.followTitle = followTitle == null ? null : followTitle.trim();
    }

    public Date getFollowDate() {
        return followDate;
    }

    public void setFollowDate(Date followDate) {
        this.followDate = followDate;
    }

    public String getFollowContent() {
        return followContent;
    }

    public void setFollowContent(String followContent) {
        this.followContent = followContent == null ? null : followContent.trim();
    }

    public String getFollowResult() {
        return followResult;
    }

    public void setFollowResult(String followResult) {
        this.followResult = followResult == null ? null : followResult.trim();
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId == null ? null : customerId.trim();
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public String getPromoterId() {
        return promoterId;
    }

    public void setPromoterId(String promoterId) {
        this.promoterId = promoterId == null ? null : promoterId.trim();
    }

    public String getPromoterName() {
        return promoterName;
    }

    public void setPromoterName(String promoterName) {
        this.promoterName = promoterName == null ? null : promoterName.trim();
    }
}