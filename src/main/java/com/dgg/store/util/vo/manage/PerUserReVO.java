package com.dgg.store.util.vo.manage;

public class PerUserReVO
{
    private String userId;

    private String permissionId;

    public PerUserReVO(String userId, String permissionId)
    {
        this.userId = userId;
        this.permissionId = permissionId;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getPermissionId()
    {
        return permissionId;
    }

    public void setPermissionId(String permissionId)
    {
        this.permissionId = permissionId;
    }
}
