package com.dgg.store.dao.common;

import com.dgg.store.util.vo.permission.QMPermissionVO;

import java.util.List;

public interface PermissionModelDao
{
    List<QMPermissionVO> listPermissionModel(String userId);
}
