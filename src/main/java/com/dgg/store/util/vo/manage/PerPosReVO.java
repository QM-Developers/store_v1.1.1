package com.dgg.store.util.vo.manage;

public class PerPosReVO
{
    private String permissionId;

    private String positionId;

    public PerPosReVO()
    {
    }

    public PerPosReVO(String permissionId, String positionId)
    {
        this.permissionId = permissionId;
        this.positionId = positionId;
    }

    public String getPermissionId()
    {
        return permissionId;
    }

    public void setPermissionId(String permissionId)
    {
        this.permissionId = permissionId;
    }

    public String getPositionId()
    {
        return positionId;
    }

    public void setPositionId(String positionId)
    {
        this.positionId = positionId;
    }
}
