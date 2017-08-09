package com.dgg.store.util.pojo;

public class ManageUnit {
    private String manageId;

    private String manageName;

    private String manageAddress;

    private Integer manageAcreage;

    private String manageType;

    public String getManageId() {
        return manageId;
    }

    public void setManageId(String manageId) {
        this.manageId = manageId == null ? null : manageId.trim();
    }

    public String getManageName() {
        return manageName;
    }

    public void setManageName(String manageName) {
        this.manageName = manageName == null ? null : manageName.trim();
    }

    public String getManageAddress() {
        return manageAddress;
    }

    public void setManageAddress(String manageAddress) {
        this.manageAddress = manageAddress == null ? null : manageAddress.trim();
    }

    public Integer getManageAcreage() {
        return manageAcreage;
    }

    public void setManageAcreage(Integer manageAcreage) {
        this.manageAcreage = manageAcreage;
    }

    public String getManageType() {
        return manageType;
    }

    public void setManageType(String manageType) {
        this.manageType = manageType == null ? null : manageType.trim();
    }
}