package com.dgg.store.dao.store;

import com.dgg.store.mapper.FreightMapper;
import com.dgg.store.util.vo.goods.AreaFreightVO;
import com.dgg.store.util.vo.goods.TemplateOfFreightVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FreightDaoImpl implements FreightDao
{
    @Autowired
    private FreightMapper mapper;

    @Override
    public int insertFreightTemp(TemplateOfFreightVO freight)
    {
        return mapper.insert(freight);
    }

    @Override
    public List<TemplateOfFreightVO> findFreightTempsByUserId(String userId)
    {
        return mapper.findFreightTempsByUserId(userId);
    }

    @Override
    public Integer deleteFreightTemp(String templateFreightId)
    {
        return mapper.deleteFreightTemp(templateFreightId);
    }

    @Override
    public TemplateOfFreightVO findFreight(String templateFreightId)
    {
        return mapper.findFreight(templateFreightId);
    }

    @Override
    public int insertAreaId(String areaFreightId, String[] split)
    {
        return mapper.insertAreaId(areaFreightId,split);
    }

    @Override
    public int insertAreaFreight(AreaFreightVO f)
    {
        return mapper.insertAreaFreight(f);
    }
}
