package com.dgg.store.util.pojo;

import java.util.Date;

public class UserTimeRecord {
    private String userId;

    private Date createRecordTime;

    private Date createAccountTime;

    private Date registerTime;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Date getCreateRecordTime() {
        return createRecordTime;
    }

    public void setCreateRecordTime(Date createRecordTime) {
        this.createRecordTime = createRecordTime;
    }

    public Date getCreateAccountTime() {
        return createAccountTime;
    }

    public void setCreateAccountTime(Date createAccountTime) {
        this.createAccountTime = createAccountTime;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }
}