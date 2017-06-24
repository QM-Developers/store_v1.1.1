package com.dgg.store.util.pojo;

import java.util.Date;

public class MyTeam {
    private String myTeamId;

    private String storeMallId;

    private String myTeamName;

    private String myTeamPrincipalId;

    private String myTeamArea;

    private String myTeamAddress;

    private String myTeamUid;

    private Integer myTeamMemberNumber;

    private Date myTeamCreateDate;

    private Byte myTeamSort;

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
    }

    public String getStoreMallId() {
        return storeMallId;
    }

    public void setStoreMallId(String storeMallId) {
        this.storeMallId = storeMallId == null ? null : storeMallId.trim();
    }

    public String getMyTeamName() {
        return myTeamName;
    }

    public void setMyTeamName(String myTeamName) {
        this.myTeamName = myTeamName == null ? null : myTeamName.trim();
    }

    public Date getMyTeamCreateDate() {
        return myTeamCreateDate;
    }

    public void setMyTeamCreateDate(Date myTeamCreateDate) {
        this.myTeamCreateDate = myTeamCreateDate;
    }

    public Byte getMyTeamSort() {
        return myTeamSort;
    }

    public void setMyTeamSort(Byte myTeamSort) {
        this.myTeamSort = myTeamSort;
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

    public String getMyTeamUid()
    {
        return myTeamUid;
    }

    public void setMyTeamUid(String myTeamUid)
    {
        this.myTeamUid = myTeamUid;
    }

    public String getMyTeamPrincipalId()
    {
        return myTeamPrincipalId;
    }

    public void setMyTeamPrincipalId(String myTeamPrincipalId)
    {
        this.myTeamPrincipalId = myTeamPrincipalId;
    }

    public Integer getMyTeamMemberNumber()
    {
        return myTeamMemberNumber;
    }

    public void setMyTeamMemberNumber(Integer myTeamMemberNumber)
    {
        this.myTeamMemberNumber = myTeamMemberNumber;
    }
}