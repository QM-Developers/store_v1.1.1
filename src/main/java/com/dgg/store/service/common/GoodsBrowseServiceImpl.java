package com.dgg.store.service.common;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.GoodsBrowseDao;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.string.StringUtil;
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
        GoodsTypeVO item;
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
        int repertoryLevel = dao.getRepertoryLevel(sessionVO.getUserId(), sessionVO.getMyTeamId());
        pageVO.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));

        if (CustomerConstant.REPERTORY_LEVEL2 != repertoryLevel)
            return listGoods1(sessionVO, goodsTypeVO, pageVO);
        else
            return listGoods2(sessionVO, goodsTypeVO, pageVO);
    }

    private String listGoods2(SessionVO sessionVO, GoodsTypeVO goodsTypeVO, PageVO pageVO)
    {
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();

        goodsTypeVO.setMyTeamId(sessionVO.getMyTeamId());
        Set<String> childType = null;
        if (!StringUtil.isEmpty(goodsTypeVO.getGoodsTypeId()))
        {
            childType = findChildTypeId(goodsTypeVO.getGoodsTypeId());
            childType.add(goodsTypeVO.getGoodsTypeId());
        }

        int pageCount = dao.countGoodsByType2(goodsTypeVO, childType);
        List<GoodsInfoVO> result = dao.findGoodsList2(goodsTypeVO, start, end, childType);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, PagingUtil.getCount(pageCount, end));

        return json.toJSONString();
    }



//    private String listGoods1(SessionVO sessionVO, GoodsTypeVO goodsTypeVO, PageVO pageVO)
//    {
//        goodsTypeVO.setMyTeamId(sessionVO.getMyTeamId());
//        Set<String> childType = null;
//        if (!StringUtil.isEmpty(goodsTypeVO.getGoodsTypeId()))
//        {
//            childType = findChildTypeId(goodsTypeVO.getGoodsTypeId());
//            childType.add(goodsTypeVO.getGoodsTypeId());
//        }
//
//        String branchId = dao.getFirstBranchId(sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST);
//        int pageCount = PagingUtil.getCount(dao.countFirstBranchGoods(goodsTypeVO, childType, branchId), pageVO.getPageSize());
//        List<GoodsInfoVO> result = dao.listFirstBranchGoods(goodsTypeVO, childType, pageVO);
//        for (GoodsInfoVO info : result)
//        {
//            info.setGoodsImages(dao.getGoodsImage(info.getGoodsId()));
//            info.setGoodsPrice(dao.getGoodsPrice(info.getGoodsId(), branchId));
//        }
//
//        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
//        json.put(KeyConstant.PAGE_COUNT, pageCount);
//
//        return json.toJSONString();
//    }

    private String listGoods1(SessionVO sessionVO, GoodsTypeVO goodsTypeVO, PageVO pageVO)
    {
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();

        goodsTypeVO.setMyTeamId(sessionVO.getMyTeamId());
        Set<String> childType = null;
        if (!StringUtil.isEmpty(goodsTypeVO.getGoodsTypeId()))
        {
            childType = findChildTypeId(goodsTypeVO.getGoodsTypeId());
            childType.add(goodsTypeVO.getGoodsTypeId());
        }

        int pageCount = dao.countGoodsByType(goodsTypeVO, childType);
        List<GoodsInfoVO> result = dao.findGoodsList(goodsTypeVO, start, end, childType);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, PagingUtil.getCount(pageCount, end));

        return json.toJSONString();
    }

    private Set<String> findChildTypeId(String typeId)
    {
        Set<String> childTypeId = dao.findChildTypeId(typeId);

        for (String s : childTypeId)
            childTypeId.addAll(findChildTypeId(s));

        return childTypeId;
    }

    @Override
    public ResultVO findGoodsDetail(SessionVO sessionVO, GoodsDetailVO goodsDetailVO)
    {
        int repertoryLevel = dao.getRepertoryLevel(sessionVO.getUserId(), sessionVO.getMyTeamId());
        GoodsDetailVO result;

        if (CustomerConstant.REPERTORY_LEVEL1 == repertoryLevel)
            result = dao.findGoodsDetail(goodsDetailVO.getGoodsId());
        else
            result = dao.findGoodsDetail_2(goodsDetailVO.getGoodsId(), sessionVO.getUserId());

        String images = dao.findGoodsDescribe(goodsDetailVO.getGoodsId());
        if (result != null)
        {
            String[] ids = images.split("\\|");
            List<String> resultList = new ArrayList<>();

            for (String id : ids)
                resultList.add(dao.findGoodsDescribeImg(id));
            result.setDetailImages(resultList);
        }

        result.setGoodsAttr(StringUtil.isEmpty(result.getGoodsAttr()) ? "" : result.getGoodsAttr().split(SymbolConstant.QUESTION)[1]);
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
