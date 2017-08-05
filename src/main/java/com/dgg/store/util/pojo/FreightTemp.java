package com.dgg.store.util.pojo;

public class FreightTemp {
    private String freightId;

    private String freightName;

    private Float weightAllowance;

    private Float startRange;

    private Float startPrice;

    private Float increaseRange;

    private Float increasePrice;

    private String myTeamId;

    private String userId;

    public String getFreightId() {
        return freightId;
    }

    public void setFreightId(String freightId) {
        this.freightId = freightId == null ? null : freightId.trim();
    }

    public String getFreightName() {
        return freightName;
    }

    public void setFreightName(String freightName) {
        this.freightName = freightName == null ? null : freightName.trim();
    }

    public Float getWeightAllowance() {
        return weightAllowance;
    }

    public void setWeightAllowance(Float weightAllowance) {
        this.weightAllowance = weightAllowance;
    }

    public Float getStartRange() {
        return startRange;
    }

    public void setStartRange(Float startRange) {
        this.startRange = startRange;
    }

    public Float getStartPrice() {
        return startPrice;
    }

    public void setStartPrice(Float startPrice) {
        this.startPrice = startPrice;
    }

    public Float getIncreaseRange() {
        return increaseRange;
    }

    public void setIncreaseRange(Float increaseRange) {
        this.increaseRange = increaseRange;
    }

    public Float getIncreasePrice() {
        return increasePrice;
    }

    public void setIncreasePrice(Float increasePrice) {
        this.increasePrice = increasePrice;
    }

    public String getMyTeamId() {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId) {
        this.myTeamId = myTeamId == null ? null : myTeamId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }
}