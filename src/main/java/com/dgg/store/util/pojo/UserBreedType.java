package com.dgg.store.util.pojo;

public class UserBreedType {
    private String userBreedTypeId;

    private String userPlaceId;

    private String userBreedType;

    private String userBreedVariety;

    private String userBreedNum;

    private String userSellNum;

    private String userBreedStyle;

    private String userFodderType;

    private String userFodderStyle;

    private Integer userFodderNum;

    public String getUserBreedTypeId() {
        return userBreedTypeId;
    }

    public void setUserBreedTypeId(String userBreedTypeId) {
        this.userBreedTypeId = userBreedTypeId == null ? null : userBreedTypeId.trim();
    }

    public String getUserPlaceId() {
        return userPlaceId;
    }

    public void setUserPlaceId(String userPlaceId) {
        this.userPlaceId = userPlaceId == null ? null : userPlaceId.trim();
    }

    public String getUserBreedType() {
        return userBreedType;
    }

    public void setUserBreedType(String userBreedType) {
        this.userBreedType = userBreedType == null ? null : userBreedType.trim();
    }

    public String getUserBreedVariety() {
        return userBreedVariety;
    }

    public void setUserBreedVariety(String userBreedVariety) {
        this.userBreedVariety = userBreedVariety == null ? null : userBreedVariety.trim();
    }

    public String getUserBreedNum() {
        return userBreedNum;
    }

    public void setUserBreedNum(String userBreedNum) {
        this.userBreedNum = userBreedNum == null ? null : userBreedNum.trim();
    }

    public String getUserSellNum() {
        return userSellNum;
    }

    public void setUserSellNum(String userSellNum) {
        this.userSellNum = userSellNum == null ? null : userSellNum.trim();
    }

    public String getUserBreedStyle() {
        return userBreedStyle;
    }

    public void setUserBreedStyle(String userBreedStyle) {
        this.userBreedStyle = userBreedStyle == null ? null : userBreedStyle.trim();
    }

    public String getUserFodderType() {
        return userFodderType;
    }

    public void setUserFodderType(String userFodderType) {
        this.userFodderType = userFodderType == null ? null : userFodderType.trim();
    }

    public String getUserFodderStyle() {
        return userFodderStyle;
    }

    public void setUserFodderStyle(String userFodderStyle) {
        this.userFodderStyle = userFodderStyle == null ? null : userFodderStyle.trim();
    }

    public Integer getUserFodderNum() {
        return userFodderNum;
    }

    public void setUserFodderNum(Integer userFodderNum) {
        this.userFodderNum = userFodderNum;
    }

}