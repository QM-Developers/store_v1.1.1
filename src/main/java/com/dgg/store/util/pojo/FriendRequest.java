package com.dgg.store.util.pojo;

import java.util.Date;

public class FriendRequest
{
    public static final String AGREE = "agree";

    public static final String NEGATIVE = "negative";

    public static final String REQUEST = "request";

    public static final Integer isReadState = 1;

    public static final Integer isNotReadState = 0;

    private String userName = "";

    private String userImg = "";

    private String userSex = "";


    private String requestId = "";

    private String userId = "";

    private String friendId = "";

    private String requestInfo = "";

    private String requestState = "";

    private String friendOrigin = "";

    private Date createDate;

    private Integer isRead;

    public String getRequestId()
    {
        return requestId;
    }

    public void setRequestId(String requestId)
    {
        this.requestId = requestId;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getFriendId()
    {
        return friendId;
    }

    public void setFriendId(String friendId)
    {
        this.friendId = friendId;
    }

    public String getRequestInfo()
    {
        return requestInfo;
    }

    public void setRequestInfo(String requestInfo)
    {
        this.requestInfo = requestInfo;
    }

    public Date getCreateDate()
    {
        return createDate;
    }

    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }

    public Integer getIsRead()
    {
        return isRead;
    }

    public void setIsRead(Integer isRead)
    {
        this.isRead = isRead;
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

    public String getUserSex()
    {
        return userSex;
    }

    public void setUserSex(String userSex)
    {
        this.userSex = userSex;
    }

    public String getRequestState()
    {
        return requestState;
    }

    public void setRequestState(String requestState)
    {
        this.requestState = requestState;
    }

    public String getFriendOrigin()
    {
        return friendOrigin;
    }

    public void setFriendOrigin(String friendOrigin)
    {
        this.friendOrigin = friendOrigin;
    }
}
