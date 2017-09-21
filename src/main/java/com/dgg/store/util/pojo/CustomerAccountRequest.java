package com.dgg.store.util.pojo;

import java.util.Date;

public class CustomerAccountRequest {
    private String requestId;

    private String proposerId;

    private String proposerName;

    private String customerId;

    private String customerName;

    private String merchandiserId;

    private String merchandiserName;

    private String checkerId;

    private String checkerName;

    private Byte requestStatus;

    private Date createDate;

    private String requestReason;

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId == null ? null : requestId.trim();
    }

    public String getProposerId() {
        return proposerId;
    }

    public void setProposerId(String proposerId) {
        this.proposerId = proposerId == null ? null : proposerId.trim();
    }

    public String getProposerName() {
        return proposerName;
    }

    public void setProposerName(String proposerName) {
        this.proposerName = proposerName == null ? null : proposerName.trim();
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

    public String getMerchandiserId() {
        return merchandiserId;
    }

    public void setMerchandiserId(String merchandiserId) {
        this.merchandiserId = merchandiserId == null ? null : merchandiserId.trim();
    }

    public String getMerchandiserName() {
        return merchandiserName;
    }

    public void setMerchandiserName(String merchandiserName) {
        this.merchandiserName = merchandiserName == null ? null : merchandiserName.trim();
    }

    public String getCheckerId() {
        return checkerId;
    }

    public void setCheckerId(String checkerId) {
        this.checkerId = checkerId == null ? null : checkerId.trim();
    }

    public String getCheckerName() {
        return checkerName;
    }

    public void setCheckerName(String checkerName) {
        this.checkerName = checkerName == null ? null : checkerName.trim();
    }

    public Byte getRequestStatus() {
        return requestStatus;
    }

    public void setRequestStatus(Byte requestStatus) {
        this.requestStatus = requestStatus;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getRequestReason()
    {
        return requestReason;
    }

    public void setRequestReason(String requestReason)
    {
        this.requestReason = requestReason;
    }
}