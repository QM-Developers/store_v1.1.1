package com.dgg.store.dao.store;

import com.dgg.store.mapper.QMPermissionMapper;
import com.dgg.store.util.vo.core.TreeVO;
import com.dgg.store.util.vo.permission.QMPermissionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QMPermissionDaoImpl implements QMPermissionDao
{
    @Autowired
    private QMPermissionMapper mapper;

    @Override
    public Integer insertQMPermission(QMPermissionVO permission)
    {
        return mapper.insertQMPermission(permission);
    }

    @Override
    public List<TreeVO> findQMPermissionTree()
    {
        return mapper.findQMPermissionTree();
    }

    @Override
    public int insertQMPermissionRe(String permissionId, String[] ids)
    {
        return mapper.insertQMPermissionRe(permissionId,ids);
    }

    @Override
    public int updateQMPermission(QMPermissionVO permission)
    {
        return mapper.updateQMPermission(permission);
    }

    @Override
    public void cleanQMPermissionRe(String permissionId)
    {
        mapper.cleanQMPermissionRe(permissionId);
    }
}
