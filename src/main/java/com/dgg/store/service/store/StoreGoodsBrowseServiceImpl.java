package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.StoreGoodsBrowseDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.GoodsDetailVO;
import com.dgg.store.util.vo.goods.GoodsImgVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class StoreGoodsBrowseServiceImpl implements StoreGoodsBrowseService
{
    private final StoreGoodsBrowseDao dao;

    public StoreGoodsBrowseServiceImpl(StoreGoodsBrowseDao dao)
    {
        this.dao = dao;
    }

    @Override
    public String listByType(SessionVO sessionVO, GoodsTypeVO goodsTypeVO, PageVO pageVO)
    {
        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();

        goodsTypeVO.setUserId(sessionVO.getUserId());
        goodsTypeVO.setMyTeamId(sessionVO.getMyTeamId());

        Set<String> childType = null;
        if (!StringUtil.isEmpty(goodsTypeVO.getGoodsTypeId()))
        {
            childType = findChildTypeId(goodsTypeVO.getGoodsTypeId());
            childType.add(goodsTypeVO.getGoodsTypeId());
        }

        int pageCount = dao.countGoodsByType(goodsTypeVO,childType);
        List<GoodsInfoVO> result = dao.findGoodsList(goodsTypeVO, start, end, childType);
        List<GoodsImgVO> imageList;

        for (GoodsInfoVO vo : result)
        {
            imageList = dao.listGoodsImage(vo.getGoodsId());
            vo.setGoodsImages(imageList.size() > 0 ? imageList.get(0).getImagePath() : null);
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, PagingUtil.getCount(pageCount, end));

        return json.toJSONString();
    }

    @Override
    public String get(SessionVO sessionVO, GoodsDetailVO goodsDetailVO)
    {
        goodsDetailVO.setUserId(sessionVO.getUserId());
        GoodsDetailVO result = dao.findGoodsDetail(goodsDetailVO);

        if (result == null)
            JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        String images = dao.findGoodsDescribe(result.getGoodsId());
        String[] ids = images.split(SymbolConstant.REG_VERTICAL);
        List<String> resultList = new ArrayList<>();

        for (String id : ids)
            resultList.add(dao.findGoodsDescribeImg(id));
        result.setDetailImages(resultList);

        result.setGoodsAttr(StringUtil.isEmpty(result.getGoodsAttr()) ? Constant.EMPTY : result.getGoodsAttr().split(SymbolConstant.QUESTION)[1]);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    private Set<String> findChildTypeId(String goodsTypeId)
    {
        Set<String> childTypeId = dao.findChildTypeId(goodsTypeId);

        for (String s : childTypeId)
            childTypeId.addAll(findChildTypeId(s));

        return childTypeId;
    }
}
