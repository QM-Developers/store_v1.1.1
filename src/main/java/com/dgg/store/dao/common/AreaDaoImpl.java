package com.dgg.store.dao.common;

import com.dgg.store.mapper.ChinaMapper;
import com.dgg.store.util.vo.ChinaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AreaDaoImpl implements AreaDao
{
    @Autowired
    private ChinaMapper mapper;

    @Override
    public List<ChinaVO> findAreaByPid(String pid)
    {
        return mapper.findAreaByPid(pid);
    }

    @Override
    public List<ChinaVO> findAllArea()
    {
        return mapper.findAllArea();
    }
}
