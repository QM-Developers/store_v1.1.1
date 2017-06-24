package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONArray;
import com.dgg.store.dao.store.FreightDao;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.vo.goods.AreaFreightVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.TemplateOfFreightVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreightServiceImpl implements FreightService
{
    @Autowired
    private FreightDao dao;

    @Override
    public ResultVO insertFreightTemp(SessionVO sessionVO, TemplateOfFreightVO freight)
    {
        freight.setUserId(sessionVO.getUserId());
        freight.setTemplateFreightId(IDGenerator.generator());
//        List<AreaFreightVO> areaFreightVOList = JSONArray.parseArray(freight.getAreaFreight(), AreaFreightVO.class);
        int result = dao.insertFreightTemp(freight);

//        for (AreaFreightVO f : areaFreightVOList)
//        {
//            f.setAreaFreightId(IDGenerator.generator());
//            f.setTemplateFreightId(freight.getTemplateFreightId());
//            if(result > 0)
//                result = dao.insertAreaFreight(f);
//            else
//                throw new RuntimeException("添加失败");
//            if(result > 0)
//                result = dao.insertAreaId(f.getAreaFreightId(),f.getAreaIds().split("="));
//            else
//                throw new RuntimeException("添加失败");
//        }

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findFreightTemps(SessionVO sessionVO)
    {
        List<TemplateOfFreightVO> result = dao.findFreightTempsByUserId(sessionVO.getUserId());

        ResultVO resultVO = new ResultVO(result.size() > 0 ? 1 : 0, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO deleteFreightTemp(SessionVO sessionVO, TemplateOfFreightVO freight)
    {
        Integer result = dao.deleteFreightTemp(freight.getTemplateFreightId());

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findFreight(SessionVO sessionVO, TemplateOfFreightVO freight)
    {
        TemplateOfFreightVO result = dao.findFreight(freight.getTemplateFreightId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }
}
