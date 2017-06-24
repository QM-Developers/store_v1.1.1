package com.dgg.store.util.pojo;

public class UserPlaceHardware {
    private String userHardwareId;

    private String userPlaceId;

    private String userHardwareName;

    private Integer userHardwareNum;

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
}