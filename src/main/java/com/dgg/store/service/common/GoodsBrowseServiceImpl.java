package com.dgg.store.service.common;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.GoodsBrowseDao;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class GoodsBrowseServiceImpl implements GoodsBrowseService
{
    @Autowired
    private GoodsBrowseDao dao;

    @Override
    public String findGoodsType(SessionVO sessionVO, GoodsTypeVO goodsTypeVO)
    {
        List<GoodsTypeVO> result = dao.findAllGoodsType();  //dao.findGoodsType(goodsTypeVO.getGoodsTypePid());

        result = appendChildType(result, "0");

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return JSONObject.toJSONString(resultVO);
    }

    private List<GoodsTypeVO> appendChildType(List<GoodsTypeVO> allType, String pid)
    {
        List<GoodsTypeVO> children = new ArrayList<>();
        GoodsTypeVO item = null;
        for (int i = 0; i < allType.size(); i++)
        {
            item = allType.get(i);
            if (pid.equals(item.getGoodsTypePid()))
            {
                children.add(item);
                allType.remove(item);
                i--;
            }
        }

        // 还没有添加完成就继续 添加
        if (allType.size() > 0)
            for (GoodsTypeVO child : children)
                child.setChildren(appendChildType(allType, child.getGoodsTypeId()));
        else
            for (GoodsTypeVO child : children)
                if (child.getChildren() == null)
                    child.setChildren(new ArrayList<>());

        return children;
    }

    @Override
    public String findGoodsList(SessionVO sessionVO, GoodsTypeVO goodsTypeVO, PageVO pageVO)
    {
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        int pageCount = dao.countGoodsByType(goodsTypeVO.getGoodsTypeId());

//        Set<String> childTypeId = findChildTypeId(goodsTypeVO.getGoodsTypeId());

        List<GoodsInfoVO> result = dao.findGoodsList(goodsTypeVO.getGoodsTypeId(), start, end);

//        for (String s : childTypeId)
//            if (result.size() < (end - start))
//                result.addAll(dao.findGoodsList(s, start, end));

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT,PagingUtil.getCount(pageCount,end));

        return json.toJSONString();
    }

    public Set<String> findChildTypeId(String typeId)
    {
        Set<String> childTypeId = dao.findChildTypeId(typeId);

        for (String s : childTypeId)
            childTypeId.addAll(findChildTypeId(s));

        return childTypeId;
    }

    @Override
    public ResultVO findGoodsDetail(SessionVO sessionVO, GoodsDetailVO goodsDetailVO)
    {
        GoodsDetailVO result = dao.findGoodsDetail(goodsDetailVO.getGoodsId());

        String images = dao.findGoodsDescribe(goodsDetailVO.getGoodsId());
        if (result != null)
        {
            String[] ids = images.split("\\|");
            List<String> resultList = new ArrayList<>();

            for (String id : ids)
                resultList.add(dao.findGoodsDescribeImg(id));
            result.setDetailImages(resultList);
        }

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findGoodsStandard(SessionVO sessionVO, GoodsStandard standard)
    {
        GoodsStandard result = dao.findGoodsStandard(standard.getStandardId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public Object findGoodsDescribe(String goodsId)
    {
        String result = dao.findGoodsDescribe(goodsId);
        if (result == null)
            return "";
        String[] ids = result.split("\\|");
        List<String> resultList = new ArrayList<>();

        for (String id : ids)
            resultList.add(dao.findGoodsDescribeImg(id));

        return resultList;
    }
}
