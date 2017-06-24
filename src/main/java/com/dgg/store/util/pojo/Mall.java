package com.dgg.store.util.pojo;

import java.util.Date;

public class Mall {
    private String storeMallId;

    private Integer myTeamId;

    private String storeMallName;

    private Date storeMallCreateDate;

    public String getStoreMallId() {
        return storeMallId;
    }

    public void setStoreMallId(String storeMallId) {
        this.storeMallId = storeMallId == null ? null : storeMallId.trim();
    }

    public Integer getMyTeamId() {
        return myTeamId;
    }

    public void setMyTeamId(Integer myTeamId) {
        this.myTeamId = myTeamId;
    }

    public String getStoreMallName() {
        return storeMallName;
    }

    public void setStoreMallName(String storeMallName) {
        this.storeMallName = storeMallName == null ? null : storeMallName.trim();
    }

    public Date getStoreMallCreateDate() {
        return storeMallCreateDate;
    }

    public void setStoreMallCreateDate(Date storeMallCreateDate) {
        this.storeMallCreateDate = storeMallCreateDate;
    }
}