package com.dgg.store.util.vo.core;

public class SessionVO
{
    private String userId;
    private String userPhone;
    private String userName;
    private String userImg;
    private String roleId;
    private String myTeamId;
    private String myTeamName;
    private String token;
    private String departmentId;
    private String departmentType;

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
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

    public String getUserPhone()
    {
        return userPhone;
    }

    public void setUserPhone(String userPhone)
    {
        this.userPhone = userPhone;
    }

    public String getMyTeamName()
    {
        return myTeamName;
    }

    public void setMyTeamName(String myTeamName)
    {
        this.myTeamName = myTeamName;
    }
}
