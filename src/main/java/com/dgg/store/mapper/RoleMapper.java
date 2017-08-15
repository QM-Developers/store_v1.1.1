package com.dgg.store.mapper;

import org.apache.ibatis.annotations.Param;

public interface RoleMapper
{

    String getPositionId(String userId);

    int countPersonalPermission(@Param("userId") String userId,@Param("url") String url);

    int countWorkerPermission(@Param("positionId") String positionId,@Param("url") String url);

    String getRoleId(@Param("userId") String userId);
}