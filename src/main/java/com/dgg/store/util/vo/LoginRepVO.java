package com.dgg.store.util.vo;

import com.dgg.store.util.pojo.User;

public class LoginRepVO
{
    private String userId;
    private String roleId;
    private String userName;
    private String userImg;
    private String userPhone;
    private String myTeamId;
    private String userArea;
    private String token;
    private String departmentId;
    private String departmentType;

    public LoginRepVO()
    {
    }

    public LoginRepVO(User user)
    {
        this.userId = user.getUserId();
        this.roleId = user.getRoleId().toString();
        this.userName = user.getUserName();
        this.userImg = user.getUserImg();
        this.userPhone = user.getUserPhone();
        this.userArea = user.getUserArea();
        this.token = user.getToken();
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserImg()
    {
        return userImg;
    }

    public void setUserImg(String userImg)
    {
        this.userImg = userImg;
    }

    public String getUserPhone()
    {
        return userPhone;
    }

    public void setUserPhone(String userPhone)
    {
        this.userPhone = userPhone;
    }

    public String getUserArea()
    {
        return userArea;
    }

    public void setUserArea(String userArea)
    {
        this.userArea = userArea;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getRoleId()
    {
        return roleId;
    }

    public void setRoleId(String roleId)
    {
        this.roleId = roleId;
    }

    public String getToken()
    {
        return token;
    }

    public void setToken(String token)
    {
        this.token = token;
    }

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
    }

    public String getDepartmentId()
    {
        return departmentId;
    }

    public void setDepartmentId(String departmentId)
    {
        this.departmentId = departmentId;
    }

    public String getDepartmentType()
    {
        return departmentType;
    }

    public void setDepartmentType(String departmentType)
    {
        this.departmentType = departmentType;
    }
}
