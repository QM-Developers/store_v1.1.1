package com.dgg.store.util.vo.manage;

import java.util.List;

public class PositionVO
{
    private String positionId;

    private String positionName;

    private String teamDepartmentId;

    private String QMPermissionId;

    private List<PerPosReVO> perPosReList;

    public PositionVO()
    {
    }

    public PositionVO(String positionId, String positionName, String teamDepartmentId)
    {
        this.positionId = positionId;
        this.positionName = positionName;
        this.teamDepartmentId = teamDepartmentId;
    }

    public String getPositionId()
    {
        return positionId;
    }

    public void setPositionId(String positionId)
    {
        this.positionId = positionId;
    }

    public String getPositionName()
    {
        return positionName;
    }

    public void setPositionName(String positionName)
    {
        this.positionName = positionName;
    }

    public String getTeamDepartmentId()
    {
        return teamDepartmentId;
    }

    public void setTeamDepartmentId(String teamDepartmentId)
    {
        this.teamDepartmentId = teamDepartmentId;
    }

    public String getQMPermissionId()
    {
        return QMPermissionId;
    }

    public void setQMPermissionId(String QMPermissionId)
    {
        this.QMPermissionId = QMPermissionId;
    }

    public List<PerPosReVO> getPerPosReList()
    {
        return perPosReList;
    }

    public void setPerPosReList(List<PerPosReVO> perPosReList)
    {
        this.perPosReList = perPosReList;
    }
}
