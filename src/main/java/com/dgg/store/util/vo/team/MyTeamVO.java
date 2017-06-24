package com.dgg.store.util.vo.team;

import java.util.Date;
import java.util.List;

public class MyTeamVO
{
    private String myTeamId;

    private String myTeamName;

    private String myTeamArea;

    private String myTeamAddress;

    private String myTeamPid;

    private Date myTeamCreateDate;

    private String userId;

    private String userName;

    private String userPhone;

    private Integer pageNumber;

    private Integer pageSize;

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
    }

    public String getMyTeamName()
    {
        return myTeamName;
    }

    public void setMyTeamName(String myTeamName)
    {
        this.myTeamName = myTeamName;
    }

    public String getMyTeamArea()
    {
        return myTeamArea;
    }

    public void setMyTeamArea(String myTeamArea)
    {
        this.myTeamArea = myTeamArea;
    }

    public String getMyTeamAddress()
    {
        return myTeamAddress;
    }

    public void setMyTeamAddress(String myTeamAddress)
    {
        this.myTeamAddress = myTeamAddress;
    }

    public String getMyTeamPid()
    {
        return myTeamPid;
    }

    public void setMyTeamPid(String myTeamPid)
    {
        this.myTeamPid = myTeamPid;
    }

    public Date getMyTeamCreateDate()
    {
        return myTeamCreateDate;
    }

    public void setMyTeamCreateDate(Date myTeamCreateDate)
    {
        this.myTeamCreateDate = myTeamCreateDate;
    }

    public Integer getPageNumber()
    {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber)
    {
        this.pageNumber = pageNumber;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = pageSize;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserPhone()
    {
        return userPhone;
    }

    public void setUserPhone(String userPhone)
    {
        this.userPhone = userPhone;
    }
}
