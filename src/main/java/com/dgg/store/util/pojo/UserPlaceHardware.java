package com.dgg.store.util.pojo;

import java.util.Date;

public class UserPlaceHardware {
    private String userHardwareId;

    private String userPlaceId;

    private String userHardwareName;

    private Integer userHardwareNum;

    private Date createDate;

    private Byte isDeleted;

    private Date deleteDate;

    public String getUserHardwareId() {
        return userHardwareId;
    }

    public void setUserHardwareId(String userHardwareId) {
        this.userHardwareId = userHardwareId == null ? null : userHardwareId.trim();
    }

    public String getUserPlaceId() {
        return userPlaceId;
    }

    public void setUserPlaceId(String userPlaceId) {
        this.userPlaceId = userPlaceId == null ? null : userPlaceId.trim();
    }

    public String getUserHardwareName() {
        return userHardwareName;
    }

    public void setUserHardwareName(String userHardwareName) {
        this.userHardwareName = userHardwareName == null ? null : userHardwareName.trim();
    }

    public Integer getUserHardwareNum() {
        return userHardwareNum;
    }

    public void setUserHardwareNum(Integer userHardwareNum) {
        this.userHardwareNum = userHardwareNum;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
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