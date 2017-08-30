package com.dgg.store.util.pojo;

import java.util.Date;
import java.util.List;

public class CommonApply {
    private String applyId;

    private String applyTitle;

    private String proposerId;

    private String proposerName;

    private Date beginDate;

    private Date endDate;

    private Date createDate;

    private Byte applyResult;

    private String applyReason;

    private String commonApplyApprove;

    private List<CommonApplyApprove> approveList;

    private String commonApplyImage;

    private List<CommonApplyImage> imageList;

    public String getApplyId() {
        return applyId;
    }

    public void setApplyId(String applyId) {
        this.applyId = applyId == null ? null : applyId.trim();
    }

    public String getApplyTitle() {
        return applyTitle;
    }

    public void setApplyTitle(String applyTitle) {
        this.applyTitle = applyTitle == null ? null : applyTitle.trim();
    }

    public String getProposerId() {
        return proposerId;
    }

    public void setProposerId(String proposerId) {
        this.proposerId = proposerId == null ? null : proposerId.trim();
    }

    public String getProposerName() {
        return proposerName;
    }

    public void setProposerName(String proposerName) {
        this.proposerName = proposerName == null ? null : proposerName.trim();
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Byte getApplyResult() {
        return applyResult;
    }

    public void setApplyResult(Byte applyResult) {
        this.applyResult = applyResult;
    }

    public String getApplyReason() {
        return applyReason;
    }

    public void setApplyReason(String applyReason) {
        this.applyReason = applyReason == null ? null : applyReason.trim();
    }

    public String getCommonApplyApprove()
    {
        return commonApplyApprove;
    }

    public void setCommonApplyApprove(String commonApplyApprove)
    {
        this.commonApplyApprove = commonApplyApprove;
    }

    public String getCommonApplyImage()
    {
        return commonApplyImage;
    }

    public void setCommonApplyImage(String commonApplyImage)
    {
        this.commonApplyImage = commonApplyImage;
    }

    public List<CommonApplyApprove> getApproveList()
    {
        return approveList;
    }

    public void setApproveList(List<CommonApplyApprove> approveList)
    {
        this.approveList = approveList;
    }

    public List<CommonApplyImage> getImageList()
    {
        return imageList;
    }

    public void setImageList(List<CommonApplyImage> imageList)
    {
        this.imageList = imageList;
    }
}