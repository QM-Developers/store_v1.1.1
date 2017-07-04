package com.dgg.store.mapper;

import com.dgg.store.util.vo.core.TreeVO;
import com.dgg.store.util.vo.permission.QMPermissionVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QMPermissionMapper
{
    Integer insertQMPermission(QMPermissionVO permission);

    List<TreeVO> findQMPermissionTree();

    int insertQMPermissionRe(@Param("permissionId") String permissionId, @Param("ids") String[] ids);

    int updateQMPermission(QMPermissionVO permission);

    void cleanQMPermissionRe(@Param("permissionId") String permissionId);
}
