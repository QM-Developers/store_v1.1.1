package com.dgg.store.dao.common;

import com.dgg.store.mapper.PermissionModelMapper;
import com.dgg.store.util.vo.permission.QMPermissionVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PermissionModelDaoImpl implements PermissionModelDao
{
    private final PermissionModelMapper mapper;

    public PermissionModelDaoImpl(PermissionModelMapper mapper)
    {
        this.mapper = mapper;
    }

    @Override
    public List<QMPermissionVO> listPermissionModel(String userId)
    {
        return mapper.listPermissionModel(userId);
    }
}
