package com.dgg.store.util.vo.customer;

public class CustomerRepertoryVO
{
    private String customerType;

    private String myTeamId;

    private Byte repertoryType;

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType == null ? null : customerType.trim();
    }

    public String getMyTeamId() {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId) {
        this.myTeamId = myTeamId == null ? null : myTeamId.trim();
    }

    public Byte getRepertoryType() {
        return repertoryType;
    }

    public void setRepertoryType(Byte repertoryType) {
        this.repertoryType = repertoryType;
    }
}
