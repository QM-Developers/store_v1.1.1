package com.dgg.store.dao.store;


public interface RoleDao
{

    int countPersonalPermission(String userId, String url);

    String getPositionId(String userId);

    int countWorkerPermission(String positionId, String url);

    String getRoleId(String userId);
}
