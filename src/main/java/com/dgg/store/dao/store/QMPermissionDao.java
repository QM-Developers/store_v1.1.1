package com.dgg.store.dao.store;

import com.dgg.store.util.vo.core.TreeVO;
import com.dgg.store.util.vo.permission.QMPermissionVO;

import java.util.List;

public interface QMPermissionDao
{
    Integer insertQMPermission(QMPermissionVO permission);

    List<TreeVO> findQMPermissionTree();

    int insertQMPermissionRe(String permissionId, String[] ids);

    int updateQMPermission(QMPermissionVO permission);

    void cleanQMPermissionRe(String permissionId);
}
