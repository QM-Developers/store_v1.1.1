package com.dgg.store.util.pojo;

public class ChatHistory
{
    public static final int NOT_READ = 0;
    public static final int IS_READ = 1;

    private String historyId;

    private String sendUserId;

    private String receiveUserId;

    private int dataType;

    private String sendData;

    private String sendTime;

    private Integer isRead;

    private Integer isReceived;

    public String getHistoryId()
    {
        return historyId;
    }

    public void setHistoryId(String historyId)
    {
        this.historyId = historyId;
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

    public String getSendTime()
    {
        return sendTime;
    }

    public void setSendTime(String sendTime)
    {
        this.sendTime = sendTime;
    }

    public Integer getIsRead()
    {
        return isRead;
    }

    public void setIsRead(Integer isRead)
    {
        this.isRead = isRead;
    }

    public Integer getIsReceived()
    {
        return isReceived;
    }

    public void setIsReceived(Integer isReceived)
    {
        this.isReceived = isReceived;
    }
}
