package com.dgg.store.util.pojo;

import java.util.Date;

public class UserBreed {
    private String breedId;

    private String breedCategory;

    private String breedVariety;

    private String breedType;

    private Integer maleNum;

    private Integer femaleNum;

    private Integer obstetricTableNum;

    private Integer shedNum;

    private Integer emptyShedNum;

    private String competitiveBrand;

    private Integer livestockNum;

    private String userPlaceId;

    private Integer breedAge;

    private Integer breedScale;

    private Date createDate;

    private Byte isDeleted;

    private Date deleteDate;

    public String getBreedId() {
        return breedId;
    }

    public void setBreedId(String breedId) {
        this.breedId = breedId == null ? null : breedId.trim();
    }

    public String getBreedCategory() {
        return breedCategory;
    }

    public void setBreedCategory(String breedCategory) {
        this.breedCategory = breedCategory == null ? null : breedCategory.trim();
    }

    public String getBreedVariety() {
        return breedVariety;
    }

    public void setBreedVariety(String breedVariety) {
        this.breedVariety = breedVariety == null ? null : breedVariety.trim();
    }

    public String getBreedType() {
        return breedType;
    }

    public void setBreedType(String breedType) {
        this.breedType = breedType == null ? null : breedType.trim();
    }

    public Integer getMaleNum() {
        return maleNum;
    }

    public void setMaleNum(Integer maleNum) {
        this.maleNum = maleNum;
    }

    public Integer getFemaleNum() {
        return femaleNum;
    }

    public void setFemaleNum(Integer femaleNum) {
        this.femaleNum = femaleNum;
    }

    public Integer getObstetricTableNum() {
        return obstetricTableNum;
    }

    public void setObstetricTableNum(Integer obstetricTableNum) {
        this.obstetricTableNum = obstetricTableNum;
    }

    public Integer getShedNum() {
        return shedNum;
    }

    public void setShedNum(Integer shedNum) {
        this.shedNum = shedNum;
    }

    public Integer getEmptyShedNum() {
        return emptyShedNum;
    }

    public void setEmptyShedNum(Integer emptyShedNum) {
        this.emptyShedNum = emptyShedNum;
    }

    public String getCompetitiveBrand() {
        return competitiveBrand;
    }

    public void setCompetitiveBrand(String competitiveBrand) {
        this.competitiveBrand = competitiveBrand == null ? null : competitiveBrand.trim();
    }

    public Integer getLivestockNum() {
        return livestockNum;
    }

    public void setLivestockNum(Integer livestockNum) {
        this.livestockNum = livestockNum;
    }

    public String getUserPlaceId() {
        return userPlaceId;
    }

    public void setUserPlaceId(String userPlaceId) {
        this.userPlaceId = userPlaceId == null ? null : userPlaceId.trim();
    }

    public Integer getBreedAge() {
        return breedAge;
    }

    public void setBreedAge(Integer breedAge) {
        this.breedAge = breedAge;
    }

    public Integer getBreedScale() {
        return breedScale;
    }

    public void setBreedScale(Integer breedScale) {
        this.breedScale = breedScale;
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