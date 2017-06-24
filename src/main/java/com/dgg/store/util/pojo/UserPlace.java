package com.dgg.store.util.pojo;

import java.util.Date;

public class UserPlace {
    private String userPlaceId;

    private String customerId;

    private String userPlaceName;

    private Integer userPlaceAcreage;

    private Integer userEmployeeNum;

    private String userPlaceAddress;

    private String userPlaceArea;

    private String userPlaceType;

    public String getUserPlaceId() {
        return userPlaceId;
    }

    public void setUserPlaceId(String userPlaceId) {
        this.userPlaceId = userPlaceId == null ? null : userPlaceId.trim();
    }

    public String getUserPlaceName() {
        return userPlaceName;
    }

    public void setUserPlaceName(String userPlaceName) {
        this.userPlaceName = userPlaceName == null ? null : userPlaceName.trim();
    }

    public Integer getUserPlaceAcreage() {
        return userPlaceAcreage;
    }

    public void setUserPlaceAcreage(Integer userPlaceAcreage) {
        this.userPlaceAcreage = userPlaceAcreage;
    }

    public Integer getUserEmployeeNum() {
        return userEmployeeNum;
    }

    public void setUserEmployeeNum(Integer userEmployeeNum) {
        this.userEmployeeNum = userEmployeeNum;
    }

    public String getUserPlaceAddress() {
        return userPlaceAddress;
    }

    public void setUserPlaceAddress(String userPlaceAddress) {
        this.userPlaceAddress = userPlaceAddress == null ? null : userPlaceAddress.trim();
    }

    public String getUserPlaceArea() {
        return userPlaceArea;
    }

    public void setUserPlaceArea(String userPlaceArea) {
        this.userPlaceArea = userPlaceArea == null ? null : userPlaceArea.trim();
    }

    public String getUserPlaceType() {
        return userPlaceType;
    }

    public void setUserPlaceType(String userPlaceType) {
        this.userPlaceType = userPlaceType == null ? null : userPlaceType.trim();
    }

    public String getCustomerId()
    {
        return customerId;
    }

    public void setCustomerId(String customerId)
    {
        this.customerId = customerId;
    }
}