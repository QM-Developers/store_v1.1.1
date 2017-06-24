package com.dgg.store.util.pojo;

import java.util.Date;

public class Role {
    private Integer roleId;

    private String roleName;

    private String roleText;

    private Date roleCreateDate;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRoleText() {
        return roleText;
    }

    public void setRoleText(String roleText) {
        this.roleText = roleText == null ? null : roleText.trim();
    }

    public Date getRoleCreateDate() {
        return roleCreateDate;
    }

    public void setRoleCreateDate(Date roleCreateDate) {
        this.roleCreateDate = roleCreateDate;
    }
}