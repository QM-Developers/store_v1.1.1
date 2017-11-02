package com.dgg.store.util.pojo;

public class CommonApplyApprove {
    private String applyId;

    private String approveId;

    private String approveName;

    private Byte approveResult;

    private Byte approveSequence;

    private String approveAdvice;

    private String userImage;

    private String departmentName;

    private Byte approve;

    public String getApplyId() {
        return applyId;
    }

    public void setApplyId(String applyId) {
        this.applyId = applyId == null ? null : applyId.trim();
    }

    public String getApproveId() {
        return approveId;
    }

    public void setApproveId(String approveId) {
        this.approveId = approveId == null ? null : approveId.trim();
    }

    public String getApproveName() {
        return approveName;
    }

    public void setApproveName(String approveName) {
        this.approveName = approveName == null ? null : approveName.trim();
    }

    public Byte getApproveResult() {
        return approveResult;
    }

    public void setApproveResult(Byte approveResult) {
        this.approveResult = approveResult;
    }

    public Byte getApproveSequence() {
        return approveSequence;
    }

    public void setApproveSequence(Byte approveSequence) {
        this.approveSequence = approveSequence;
    }

    public String getApproveAdvice() {
        return approveAdvice;
    }

    public void setApproveAdvice(String approveAdvice) {
        this.approveAdvice = approveAdvice == null ? null : approveAdvice.trim();
    }

    public String getUserImage()
    {
        return userImage;
    }

    public void setUserImage(String userImage)
    {
        this.userImage = userImage;
    }

    public String getDepartmentName()
    {
        return departmentName;
    }

    public void setDepartmentName(String departmentName)
    {
        this.departmentName = departmentName;
    }

    public Byte getApprove()
    {
        return approve;
    }

    public void setApprove(Byte approve)
    {
        this.approve = approve;
    }
}