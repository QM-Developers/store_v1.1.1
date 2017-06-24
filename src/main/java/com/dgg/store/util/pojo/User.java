package com.dgg.store.util.pojo;

import java.util.Date;

public class User {
    private String userId;

    private Integer roleId;

    private String roleName;

    private String userName;

    private String userPassword;

    private String userSex;

    private String userPhone;

    private Date userBirthday;

    private String userAddress;

    private String userArea;

    private String userEmail;

    private Date userCreateDate;

    private Date userLastLoginTime;

    private String userStatus;

    private String userImg;

    private String userNickname;

    private String hxName;

    private String hxPassword;

    private String token;

    private String customerGroupId;

    private String teamClassifyId;

    private String myTeamId;

    private String userQq;

    private String uesrWechat;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex == null ? null : userSex.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public Date getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getUserArea() {
        return userArea;
    }

    public void setUserArea(String userArea) {
        this.userArea = userArea == null ? null : userArea.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public Date getUserCreateDate() {
        return userCreateDate;
    }

    public void setUserCreateDate(Date userCreateDate) {
        this.userCreateDate = userCreateDate;
    }

    public Date getUserLastLoginTime() {
        return userLastLoginTime;
    }

    public void setUserLastLoginTime(Date userLastLoginTime) {
        this.userLastLoginTime = userLastLoginTime;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus == null ? null : userStatus.trim();
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg == null ? null : userImg.trim();
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname == null ? null : userNickname.trim();
    }

    public String getHxName() {
        return hxName;
    }

    public void setHxName(String hxName) {
        this.hxName = hxName == null ? null : hxName.trim();
    }

    public String getHxPassword() {
        return hxPassword;
    }

    public void setHxPassword(String hxPassword) {
        this.hxPassword = hxPassword == null ? null : hxPassword.trim();
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token == null ? null : token.trim();
    }

    public String getRoleName()
    {
        return roleName;
    }

    public void setRoleName(String roleName)
    {
        this.roleName = roleName;
    }

    public String getTeamClassifyId()
    {
        return teamClassifyId;
    }

    public void setTeamClassifyId(String teamClassifyId)
    {
        this.teamClassifyId = teamClassifyId;
    }

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
    }

    public String getUserQq()
    {
        return userQq;
    }

    public void setUserQq(String userQq)
    {
        this.userQq = userQq;
    }

    public String getUesrWechat()
    {
        return uesrWechat;
    }

    public void setUesrWechat(String uesrWechat)
    {
        this.uesrWechat = uesrWechat;
    }

    public String getCustomerGroupId()
    {
        return customerGroupId;
    }

    public void setCustomerGroupId(String customerGroupId)
    {
        this.customerGroupId = customerGroupId;
    }
}