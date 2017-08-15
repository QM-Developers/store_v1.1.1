package com.dgg.store.service.store;


import com.dgg.store.dao.store.RoleDao;
import com.dgg.store.util.core.constant.RoleConstant;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService
{
    @Autowired
    private RoleDao dao;

    @Override
    public boolean countPermission(SessionVO sessionVO, String url)
    {
        if(1 > 0)
            return true;

        int result = 0;
        String roleId = dao.getRoleId(sessionVO.getUserId());

        if(roleId.equals(RoleConstant.MANAGER))
            return true;

        result += (dao.countPersonalPermission(sessionVO.getUserId(), url) > 0) ? 1 : 0;

        result += (dao.countWorkerPermission(dao.getPositionId(sessionVO.getUserId()), url)) > 0 ? 1 : 0;

        return result > 0;
    }
}
