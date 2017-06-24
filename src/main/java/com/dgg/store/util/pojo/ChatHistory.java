package com.dgg.store.util.pojo;

import java.util.Date;

public class ChatHistory
{
    public static final int TEXT = 0x00000001;
    public static final int NOT_READ = 0;
    public static final int IS_READ = 1;

    private int pageSize = 20;
    private int pageNum = 0;
    private int count;

    private String userId;
    private String token;
    private String myTeamId;
    private String userImg;
    private String userName;
    private String userSex;
    private String friendRemarkName;


    private String sendUserId;

    private String receiveUserId;

    private int dataType;

    private String sendData;

    private Date sendTime;

    private int isRead;


    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
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

    public String getUserImg()
    {
        return userImg;
    }

    public void setUserImg(String userImg)
    {
        this.userImg = userImg;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserSex()
    {
        return userSex;
    }

    public void setUserSex(String userSex)
    {
        this.userSex = userSex;
    }

    public String getFriendRemarkName()
    {
        return friendRemarkName;
    }

    public void setFriendRemarkName(String friendRemarkName)
    {
        this.friendRemarkName = friendRemarkName;
    }

    public String getSendUserId()
    {
        return sendUserId;
    }

    public void setSendUserId(String sendUserId)
    {
        this.sendUserId = sendUserId;
    }

    public String getReceiveUserId()
    {
        return receiveUserId;
    }

    public void setReceiveUserId(String receiveUserId)
    {
        this.receiveUserId = receiveUserId;
    }

    public int getDataType()
    {
        return dataType;
    }

    public void setDataType(int dataType)
    {
        this.dataType = dataType;
    }

    public String getSendData()
    {
        return sendData;
    }

    public void setSendData(String sendData)
    {
        this.sendData = sendData;
    }

    public Date getSendTime()
    {
        return sendTime;
    }

    public void setSendTime(Date sendTime)
    {
        this.sendTime = sendTime;
    }

    public int getIsRead()
    {
        return isRead;
    }

    public void setIsRead(int isRead)
    {
        this.isRead = isRead;
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    public int getCount()
    {
        return count;
    }

    public void setCount(int count)
    {
        this.count = count;
    }
}
