package com.dgg.store.util.vo.manage;

import java.util.List;

public class MemberVO
{
    private String userId;

    private String memberId;

    private String userName;

    private String userSex;

    private String userPhone;

    private String userStatus;

    private String myTeamId;

    private String userIdentity;

    private String roleId;

    private String departmentId;

    private String departmentName;

    private String positionId;

    private String positionName;

    private String userCardFront;

    private String userCardBack;

    private String permission;

    private List<PerUserReVO> permissionList;

    private String department;

    private Integer pageNum;

    private Integer pageSize;

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserSex()
    {
        return userSex;
    }

    public void setUserSex(String userSex)
    {
        this.userSex = userSex;
    }

    public String getUserPhone()
    {
        return userPhone;
    }

    public void setUserPhone(String userPhone)
    {
        this.userPhone = userPhone;
    }

    public String getUserIdentity()
    {
        return userIdentity;
    }

    public void setUserIdentity(String userIdentity)
    {
        this.userIdentity = userIdentity;
    }

    public String getDepartmentId()
    {
        return departmentId;
    }

    public void setDepartmentId(String departmentId)
    {
        this.departmentId = departmentId;
    }

    public String getPositionId()
    {
        return positionId;
    }

    public void setPositionId(String positionId)
    {
        this.positionId = positionId;
    }

    public String getUserCardFront()
    {
        return userCardFront;
    }

    public void setUserCardFront(String userCardFront)
    {
        this.userCardFront = userCardFront;
    }

    public String getUserCardBack()
    {
        return userCardBack;
    }

    public void setUserCardBack(String userCardBack)
    {
        this.userCardBack = userCardBack;
    }

    public String getPermission()
    {
        return permission;
    }

    public void setPermission(String permission)
    {
        this.permission = permission;
    }

    public String getUserStatus()
    {
        return userStatus;
    }

    public void setUserStatus(String userStatus)
    {
        this.userStatus = userStatus;
    }

    public String getRoleId()
    {
        return roleId;
    }

    public void setRoleId(String roleId)
    {
        this.roleId = roleId;
    }

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
    }

    public String getDepartmentName()
    {
        return departmentName;
    }

    public void setDepartmentName(String departmentName)
    {
        this.departmentName = departmentName;
    }

    public String getPositionName()
    {
        return positionName;
    }

    public void setPositionName(String positionName)
    {
        this.positionName = positionName;
    }

    public String getMemberId()
    {
        return memberId;
    }

    public void setMemberId(String memberId)
    {
        this.memberId = memberId;
    }

    public List getPermissionList()
    {
        return permissionList;
    }

    public void setPermissionList(List permissionList)
    {
        this.permissionList = permissionList;
    }

    public String getDepartment()
    {
        return department;
    }

    public void setDepartment(String department)
    {
        this.department = department;
    }

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = pageSize;
    }
}
