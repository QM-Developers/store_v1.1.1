package com.dgg.store.dao.store;

import com.dgg.store.mapper.GoodsTypeinfoMapper;
import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.vo.core.TreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GoodsTypeDaoImpl implements GoodsTypeDao
{
    @Autowired
    private GoodsTypeinfoMapper mapper;

    @Override
    public List<TreeVO> findTypeTree()
    {
        return mapper.findTypeTree();
    }

    @Override
    public Integer insertGoodsType(GoodsTypeinfo typeinfo)
    {
        return mapper.insert(typeinfo);
    }

    @Override
    public List<GoodsTypeAttr> findGoodsTypeAttr(GoodsTypeAttr typeAttr)
    {
        return mapper.findGoodsTypeAttr(typeAttr);
    }

    @Override
    public void cleanGoodsTypeAttr(GoodsTypeAttr typeAttr)
    {
        mapper.cleanGoodsTypeAttr(typeAttr);
    }

    @Override
    public int insertGoodsTypeAttr(GoodsTypeAttr newTypeAttr)
    {
        return mapper.insertGoodsTypeAttr(newTypeAttr);
    }

    @Override
    public List<GoodsTypeinfo> findGoodsTypeByPid(String goodsTypePid)
    {
        return mapper.findGoodsTypeByPid(goodsTypePid);
    }

    @Override
    public Integer deleteGoodsType(String goodsTypeId)
    {
        return mapper.deleteGoodsType(goodsTypeId);
    }
}
