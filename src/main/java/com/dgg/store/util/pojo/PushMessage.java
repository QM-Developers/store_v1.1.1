package com.dgg.store.util.pojo;

public class PushMessage {
    private String msgId;

    private String msgTitle;

    private String msgText;

    private String msgTicker;

    private Byte msgType;

    private String field;

    public String getMsgId() {
        return msgId;
    }

    public void setMsgId(String msgId) {
        this.msgId = msgId == null ? null : msgId.trim();
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle == null ? null : msgTitle.trim();
    }

    public String getMsgText() {
        return msgText;
    }

    public void setMsgText(String msgText) {
        this.msgText = msgText == null ? null : msgText.trim();
    }

    public String getMsgTicker() {
        return msgTicker;
    }

    public void setMsgTicker(String msgTicker) {
        this.msgTicker = msgTicker == null ? null : msgTicker.trim();
    }

    public Byte getMsgType() {
        return msgType;
    }

    public void setMsgType(Byte msgType) {
        this.msgType = msgType;
    }

    public String getField()
    {
        return field;
    }

    public void setField(String field)
    {
        this.field = field;
    }
}