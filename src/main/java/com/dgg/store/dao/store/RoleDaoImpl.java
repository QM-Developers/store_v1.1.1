package com.dgg.store.dao.store;

import com.dgg.store.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDaoImpl implements RoleDao
{
    @Autowired
    private RoleMapper mapper;

    @Override
    public int countPersonalPermission(String userId, String url)
    {
        return mapper.countPersonalPermission(userId,url);
    }

    @Override
    public String getPositionId(String userId)
    {
        return mapper.getPositionId(userId);
    }

    @Override
    public int countWorkerPermission(String positionId, String url)
    {
        return mapper.countWorkerPermission(positionId,url);
    }

    @Override
    public String getRoleId(String userId)
    {
        return mapper.getRoleId(userId);
    }
}
