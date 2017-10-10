package com.dgg.store.util.pojo;

import java.util.Date;
import java.util.List;

public class RepertoryRecord {
    private String recordId;

    private String myTeamId;

    private String branchId;

    private String branchName;

    private String operatorId;

    private String operatorName;

    private Date createDate;

    private String recordRemark;
    private List<RepertoryRecordList> recordList;
    private String goodsInfo;

    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId == null ? null : recordId.trim();
    }

    public String getMyTeamId() {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId) {
        this.myTeamId = myTeamId == null ? null : myTeamId.trim();
    }

    public String getBranchId() {
        return branchId;
    }

    public void setBranchId(String branchId) {
        this.branchId = branchId == null ? null : branchId.trim();
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName == null ? null : branchName.trim();
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId == null ? null : operatorId.trim();
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName == null ? null : operatorName.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getRecordRemark() {
        return recordRemark;
    }

    public void setRecordRemark(String recordRemark) {
        this.recordRemark = recordRemark == null ? null : recordRemark.trim();
    }

    public void setRecordList(List<RepertoryRecordList> recordList)
    {
        this.recordList = recordList;
    }

    public List<RepertoryRecordList> getRecordList()
    {
        return recordList;
    }

    public String getGoodsInfo()
    {
        return goodsInfo;
    }

    public void setGoodsInfo(String goodsInfo)
    {
        this.goodsInfo = goodsInfo;
    }
}