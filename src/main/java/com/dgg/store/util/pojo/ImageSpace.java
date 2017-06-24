package com.dgg.store.util.pojo;

public class ImageSpace
{
    private String imageId;

    private Integer myTeamId;

    private String imagePath;

    public ImageSpace()
    {
    }

    public ImageSpace(String imageId, Integer myTeamId, String imagePath)
    {
        this.imageId = imageId;
        this.myTeamId = myTeamId;
        this.imagePath = imagePath;
    }

    public String getImageId() {
        return imageId;
    }

    public void setImageId(String imageId) {
        this.imageId = imageId == null ? null : imageId.trim();
    }

    public Integer getMyTeamId() {
        return myTeamId;
    }

    public void setMyTeamId(Integer myTeamId) {
        this.myTeamId = myTeamId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath == null ? null : imagePath.trim();
    }
}