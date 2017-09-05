package com.dgg.store.util.pojo;

import java.util.Date;
import java.util.List;

public class UserPlace {
    private String userPlaceId;

    private String customerId;

    private String userPlaceName;

    private Integer userPlaceAcreage;

    private Integer userEmployeeNum;

    private Integer userOwnerNum;

    private Integer userAlreadyUse;

    private String userPlaceAddress;

    private String userPlaceArea;

    private String userPlaceType;

    private Date createDate;

    private Byte isDeleted;

    private Date deleteDate;

    private String environment;

    private String certificate;

    private List<PlaceImage> imageList;

    private List<PlaceImage> environmentList;

    private List<PlaceImage> certificateList;

    private Integer pageNum;

    private Integer pageSize;

    public String getUserPlaceId() {
        return userPlaceId;
    }

    public void setUserPlaceId(String userPlaceId) {
        this.userPlaceId = userPlaceId == null ? null : userPlaceId.trim();
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId == null ? null : customerId.trim();
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

    public Integer getUserOwnerNum() {
        return userOwnerNum;
    }

    public void setUserOwnerNum(Integer userOwnerNum) {
        this.userOwnerNum = userOwnerNum;
    }

    public Integer getUserAlreadyUse() {
        return userAlreadyUse;
    }

    public void setUserAlreadyUse(Integer userAlreadyUse) {
        this.userAlreadyUse = userAlreadyUse;
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

    public String getEnvironment()
    {
        return environment;
    }

    public void setEnvironment(String environment)
    {
        this.environment = environment;
    }

    public String getCertificate()
    {
        return certificate;
    }

    public void setCertificate(String certificate)
    {
        this.certificate = certificate;
    }

    public List<PlaceImage> getImageList()
    {
        return imageList;
    }

    public void setImageList(List<PlaceImage> imageList)
    {
        this.imageList = imageList;
    }

    public List<PlaceImage> getEnvironmentList()
    {
        return environmentList;
    }

    public void setEnvironmentList(List<PlaceImage> environmentList)
    {
        this.environmentList = environmentList;
    }

    public List<PlaceImage> getCertificateList()
    {
        return certificateList;
    }

    public void setCertificateList(List<PlaceImage> certificateList)
    {
        this.certificateList = certificateList;
    }

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = pageSize;
    }
}