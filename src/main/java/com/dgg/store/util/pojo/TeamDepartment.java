package com.dgg.store.util.pojo;

import java.util.Date;

public class TeamDepartment
{
    private String teamDepartmentId;

    private String teamDepartmentName;

    private String departmentType;

    private Date createDate;

    private String myTeamId;

    public TeamDepartment(){}

    public TeamDepartment(String generator, String myTeamId, String type, String name)
    {
        this.teamDepartmentId = generator;
        this.departmentType = type;
        this.teamDepartmentName = name;
        this.myTeamId = myTeamId;
    }

    public String getTeamDepartmentId() {
        return teamDepartmentId;
    }

    public void setTeamDepartmentId(String teamDepartmentId) {
        this.teamDepartmentId = teamDepartmentId == null ? null : teamDepartmentId.trim();
    }

    public String getTeamDepartmentName() {
        return teamDepartmentName;
    }

    public void setTeamDepartmentName(String teamDepartmentName) {
        this.teamDepartmentName = teamDepartmentName == null ? null : teamDepartmentName.trim();
    }

    public String getMyTeamId() {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId) {
        this.myTeamId = myTeamId == null ? null : myTeamId.trim();
    }

    public Date getCreateDate()
    {
        return createDate;
    }

    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }

    public String getDepartmentType()
    {
        return departmentType;
    }

    public void setDepartmentType(String departmentType)
    {
        this.departmentType = departmentType;
    }
}