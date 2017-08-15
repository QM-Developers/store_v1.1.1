package com.dgg.store.service.store;

import com.dgg.store.util.vo.core.SessionVO;

public interface RoleService
{
    boolean countPermission(SessionVO sessionVO,String url);
}
