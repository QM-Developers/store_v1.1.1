package com.dgg.store.dao.common;

import com.dgg.store.mapper.PermissionModelMapper;
import com.dgg.store.util.vo.permission.QMPermissionVO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class PermissionModelDaoImpl implements PermissionModelDao
{
    @Autowired
    private PermissionModelMapper mapper;

    @Override
    public List<QMPermissionVO> listPermissionModel(String userId)
    {
        return mapper.listPermissionModel(userId);
    }
}
