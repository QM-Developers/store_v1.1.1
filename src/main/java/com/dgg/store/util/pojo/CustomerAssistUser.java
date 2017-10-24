package com.dgg.store.util.pojo;

public class CustomerAssistUser {
    private String assistId;

    private String assistResult;

    private String userId;

    private String userName;

    private String departmentName;

    private Byte status;

    public String getAssistId() {
        return assistId;
    }

    public void setAssistId(String assistId) {
        this.assistId = assistId == null ? null : assistId.trim();
    }

    public String getAssistResult() {
        return assistResult;
    }

    public void setAssistResult(String assistResult) {
        this.assistResult = assistResult == null ? null : assistResult.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName == null ? null : departmentName.trim();
    }

    public Byte getStatus()
    {
        return status;
    }

    public void setStatus(Byte status)
    {
        this.status = status;
    }
}