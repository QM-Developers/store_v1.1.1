package com.dgg.store.service.store;

import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.permission.QMPermissionVO;

public interface QMPermissionService
{
    ResultVO insertQMPermission(SessionVO sessionVO, QMPermissionVO permission);

    ResultVO findQMPermissionTree(SessionVO sessionVO);

    ResultVO updateQMPermission(SessionVO sessionVO,QMPermissionVO permission);
}
