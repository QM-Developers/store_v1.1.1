package com.dgg.store.util.pojo;

public class CommonApplyImage {
    private String applyId;

    private String imageId;

    private String imagePath;

    private Byte imageSort;

    public String getApplyId() {
        return applyId;
    }

    public void setApplyId(String applyId) {
        this.applyId = applyId == null ? null : applyId.trim();
    }

    public String getImageId() {
        return imageId;
    }

    public void setImageId(String imageId) {
        this.imageId = imageId == null ? null : imageId.trim();
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath == null ? null : imagePath.trim();
    }

    public Byte getImageSort() {
        return imageSort;
    }

    public void setImageSort(Byte imageSort) {
        this.imageSort = imageSort;
    }
}