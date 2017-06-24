package com.dgg.store.util.vo;

public class UserPlaceVO
{
    private String userPlaceId;

    private String userId;

    private String userPlaceName;

    private Integer userPlaceAcreage;

    private Integer userReckonFodder;

    private Integer userEmployeeNum;

    private String userPlaceAddress;

    private String userPlaceArea;

    private String userPlaceType;

    private Integer breedCount;

    private Integer hardwareCount;


    public String getUserPlaceId() {
        return userPlaceId;
    }

    public void setUserPlaceId(String userPlaceId) {
        this.userPlaceId = userPlaceId == null ? null : userPlaceId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
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

    public Integer getUserReckonFodder() {
        return userReckonFodder;
    }

    public void setUserReckonFodder(Integer userReckonFodder) {
        this.userReckonFodder = userReckonFodder;
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

    public Integer getBreedCount()
    {
        return breedCount;
    }

    public void setBreedCount(Integer breedCount)
    {
        this.breedCount = breedCount;
    }

    public Integer getHardwareCount()
    {
        return hardwareCount;
    }

    public void setHardwareCount(Integer hardwareCount)
    {
        this.hardwareCount = hardwareCount;
    }
}
