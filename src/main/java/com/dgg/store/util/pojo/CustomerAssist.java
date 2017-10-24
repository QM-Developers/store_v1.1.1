package com.dgg.store.util.pojo;

import java.util.Date;
import java.util.List;

public class CustomerAssist {
    private String assistId;

    private String assistTitle;

    private String assistReason;

    private String userId;

    private String userName;

    private Date createDate;

    private String customer;

    private String user;

    private String image;

    private Integer status;

    private List<CustomerAssistCustomer> customerList;

    private List<CustomerAssistUser> userList;

    private List<CustomerAssistImage> imageList;

    public String getAssistId() {
        return assistId;
    }

    public void setAssistId(String assistId) {
        this.assistId = assistId == null ? null : assistId.trim();
    }

    public String getAssistTitle() {
        return assistTitle;
    }

    public void setAssistTitle(String assistTitle) {
        this.assistTitle = assistTitle == null ? null : assistTitle.trim();
    }

    public String getAssistReason() {
        return assistReason;
    }

    public void setAssistReason(String assistReason) {
        this.assistReason = assistReason == null ? null : assistReason.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCustomer()
    {
        return customer;
    }

    public void setCustomer(String customer)
    {
        this.customer = customer;
    }

    public String getUser()
    {
        return user;
    }

    public void setUser(String user)
    {
        this.user = user;
    }

    public String getImage()
    {
        return image;
    }

    public void setImage(String image)
    {
        this.image = image;
    }

    public List<CustomerAssistCustomer> getCustomerList()
    {
        return customerList;
    }

    public void setCustomerList(List<CustomerAssistCustomer> customerList)
    {
        this.customerList = customerList;
    }

    public List<CustomerAssistUser> getUserList()
    {
        return userList;
    }

    public void setUserList(List<CustomerAssistUser> userList)
    {
        this.userList = userList;
    }

    public List<CustomerAssistImage> getImageList()
    {
        return imageList;
    }

    public void setImageList(List<CustomerAssistImage> imageList)
    {
        this.imageList = imageList;
    }

    public Integer getStatus()
    {
        return status;
    }

    public void setStatus(Integer status)
    {
        this.status = status;
    }
}