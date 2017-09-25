package com.dgg.store.mapper;

import com.dgg.store.util.vo.permission.QMPermissionVO;

import java.util.List;

public interface PermissionModelMapper
{
    List<QMPermissionVO> listPermissionModel(String userId);
}
