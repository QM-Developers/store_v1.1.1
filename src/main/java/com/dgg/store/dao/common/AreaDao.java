package com.dgg.store.dao.common;

import com.dgg.store.util.vo.ChinaVO;

import java.util.List;

public interface AreaDao
{
    List<ChinaVO> findAreaByPid(String pid);

    List<ChinaVO> findAllArea();
}
