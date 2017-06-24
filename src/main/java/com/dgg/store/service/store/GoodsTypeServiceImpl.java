package com.dgg.store.service.store;

import com.dgg.store.dao.store.GoodsTypeDao;
import com.dgg.store.util.core.zTree.TreeUtil;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.core.TreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsTypeServiceImpl implements GoodsTypeService
{
    @Autowired
    private GoodsTypeDao dao;

    @Override
    public Object findTypeTree()
    {
        List<TreeVO> result = dao.findTypeTree();

        try
        {
            result = new TreeUtil<TreeVO>().addChild(result, "0","getpId","setChildren","getId");
        } catch (Exception e)
        {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public Integer insertGoodsType(GoodsTypeinfo typeinfo)
    {
        typeinfo.setGoodsTypeId(IDGenerator.generator());
        if (typeinfo.getGoodsTypePid() == null || "".equals(typeinfo.getGoodsTypePid()))
            typeinfo.setGoodsTypePid("0");

        return dao.insertGoodsType(typeinfo);
    }

    @Override
    public List<GoodsTypeAttr> findGoodsTypeAttr(GoodsTypeAttr typeAttr)
    {
        List<GoodsTypeAttr> result = dao.findGoodsTypeAttr(typeAttr);

        return result;
    }

    @Override
    public Integer insertGoodsTypeAttr(GoodsTypeAttr typeAttr)
    {
        typeAttr.setGoodsTypeAttrId(IDGenerator.generator());

        int result = dao.insertGoodsTypeAttr(typeAttr);

        return result;
    }

    @Override
    public ResultVO findGoodsTypeByPid(SessionVO sessionVO, GoodsTypeinfo typeinfo)
    {
        List<GoodsTypeinfo> result = dao.findGoodsTypeByPid(typeinfo.getGoodsTypePid());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO deleteGoodsType(SessionVO sessionVO, GoodsTypeVO typeVO)
    {
        Integer result = dao.deleteGoodsType(typeVO.getGoodsTypeId());

        ResultVO resultVO = new ResultVO(result,sessionVO.getToken());

        return resultVO;
    }

}
