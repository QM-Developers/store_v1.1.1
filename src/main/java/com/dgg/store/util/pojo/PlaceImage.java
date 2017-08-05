package com.dgg.store.util.pojo;

public class PlaceImage {
    private String imgId;

    private Byte imgType;

    private String userPlaceId;

    private String imgUrl;

    public String getImgId() {
        return imgId;
    }

    public void setImgId(String imgId) {
        this.imgId = imgId == null ? null : imgId.trim();
    }

    public Byte getImgType() {
        return imgType;
    }

    public void setImgType(Byte imgType) {
        this.imgType = imgType;
    }

    public String getUserPlaceId() {
        return userPlaceId;
    }

    public void setUserPlaceId(String userPlaceId) {
        this.userPlaceId = userPlaceId == null ? null : userPlaceId.trim();
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }
}