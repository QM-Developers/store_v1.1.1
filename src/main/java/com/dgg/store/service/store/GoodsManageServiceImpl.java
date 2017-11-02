package com.dgg.store.service.store;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.GoodsManageDao;
import com.dgg.store.dao.store.GoodsTypeDao;
import com.dgg.store.util.core.FilePathUtil;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.pojo.ImageSpace;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.goods.GoodsImgVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.goods.GoodsTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class GoodsManageServiceImpl implements GoodsManageService
{
    @Autowired
    private GoodsManageDao dao;

    @Autowired
    private GoodsTypeDao typeDao;

    @Override
    public String insertGoodsinfo(SessionVO sessionVO, GoodsInfoVO goodsinfo)
    {
        Integer result = 1;
        goodsinfo.setMyTeamId(sessionVO.getMyTeamId());
        goodsinfo.setGoodsId(IDGenerator.generator());
        goodsinfo.setGoodsCode(goodsinfo.getGoodsCode() == null ? Constant.EMPTY : goodsinfo.getGoodsCode());
        String[] images = goodsinfo.getGoodsImages().split(SymbolConstant.REG_VERTICAL);
        GoodsImgVO imgVO = new GoodsImgVO(sessionVO.getUserId(), goodsinfo.getGoodsId());
        GoodsStandard standard = new GoodsStandard(goodsinfo.getGoodsId());

        JSONArray jsonArray = JSON.parseArray(goodsinfo.getStandards());

        result = dao.insertGoodsinfo(goodsinfo);

        for (int i = 0; i < jsonArray.size(); i++)
        {
            standard.setStandardId(IDGenerator.generator());
            standard.setStandardPrice(Float.parseFloat(jsonArray.getJSONObject(i).get("standardPrice").toString()));
            standard.setStandardWeight(Float.parseFloat(jsonArray.getJSONObject(i).get("standardWeight").toString()));
//            standard.setStandardCount(Integer.parseInt(jsonArray.getJSONObject(i).get("standardCount").toString()));
            standard.setStandardCount(0);
            standard.setStandardName(jsonArray.getJSONObject(i).get("standardName").toString());
            if (result > 0)
                result = dao.insertStandardToGoods(standard);
            else
                throw new RuntimeException("添加失败");
        }

        for (int i = 0; i < images.length; i++)
        {
            imgVO.setImageId(images[i]);
            imgVO.setGoodsImgType((byte) (i == 0 ? 1 : 2));
            imgVO.setSort(i);
            if (result > 0)
                result = dao.insertImgToGoods(imgVO);
            else
                throw new RuntimeException("添加失败");
        }

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken(), goodsinfo.getGoodsId()));
    }

    private GoodsTypeVO findTypeParent(GoodsTypeVO typeVO)
    {
        if (!"0".equals(typeVO.getGoodsTypePid()))
        {
            typeVO.setParent(dao.findTypeAndParent(typeVO.getGoodsTypePid()));
            findTypeParent(typeVO.getParent());
        }
        return typeVO;
    }

    @Override
    public String findTypeAndParents(SessionVO sessionVO, GoodsTypeinfo typeinfo)
    {
        GoodsTypeVO result = dao.findGoodsType(typeinfo.getGoodsTypeId());

        if (result != null)
            result = findTypeParent(result);

        return JSONObject.toJSONString(new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result));
    }

    @Override
    public ResultVO findTypeAttr(SessionVO sessionVO, GoodsTypeAttr typeAttr)
    {
        List<GoodsTypeAttr> result = dao.findTypeAttr(typeAttr.getGoodsTypeId());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertImgToSpace(SessionVO sessionVO, MultipartFile file)
    {
        StringBuffer path = new StringBuffer();
        String fileName = null;
        String imageId = IDGenerator.generator();

        try
        {
            path.append(PathConstant.USER_IMAGE_SPACE_PATH).append(sessionVO.getMyTeamId()).append("/");
            fileName = PathConstant.IMAGE_SERVER_NAME + UploadFileUtil.doUpload(file, path.toString(), PathConstant.UPLOAD_BASE_PATH, IDGenerator.generator());
            dao.insertImgToSpace(imageId, fileName, sessionVO.getMyTeamId());
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        return new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), imageId);
    }

    @Override
    public String findImages(SessionVO sessionVO)
    {
        List<ImageSpace> result = dao.findImages(sessionVO.getMyTeamId());

        return JSONObject.toJSONString(new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result));
    }

    @Override
    public String findGoodsList(SessionVO sessionVO, PageVO pageVO)
    {
        if (ParameterUtil.objectIsNull(pageVO))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        GoodsInfoVO condition = new GoodsInfoVO();
        condition.setMyTeamId(sessionVO.getMyTeamId());

        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        int pageCount = PagingUtil.getCount(dao.countGoods(condition), pageVO.getPageSize());

        List<GoodsInfoVO> result = dao.findGoodsList(condition, start, end);

        String branchId = dao.getCurrentBranchId(sessionVO.getUserId());
        if (StringUtil.isEmpty(branchId))
            branchId = dao.getFirstBranchId(sessionVO.getMyTeamId(), BranchConstant.BRANCH_FIRST);

        for (GoodsInfoVO vo : result)
            vo.setStandardList(dao.listStandards(vo.getGoodsId(), branchId));

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String findGoodsInfo(SessionVO sessionVO, GoodsInfoVO infoVO)
    {
        GoodsInfoVO result = dao.findGoodsInfo(infoVO);

        result.setImgList(dao.listImage(result.getGoodsId()));

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String findGoodsDescribe(SessionVO sessionVO, GoodsInfoVO infoVO)
    {
        String[] ids = infoVO.getGoodsDescribe().split(SymbolConstant.REG_VERTICAL);
        List<GoodsImgVO> result = dao.findGoodsDescribe(ids);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String updateGoods(SessionVO sessionVO, GoodsInfoVO goodsInfo)
    {
        Integer result = 1;
        int i = 0;
        int count = 3;

        String[] images = null;
        if (!StringUtil.isEmpty(goodsInfo.getGoodsImages()))
            images = goodsInfo.getGoodsImages().split(SymbolConstant.REG_VERTICAL);

        GoodsImgVO imgVO = new GoodsImgVO(sessionVO.getUserId(), goodsInfo.getGoodsId());

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    dao.deleteAllStandard(goodsInfo.getGoodsId());
                    GoodsStandard standard = new GoodsStandard(goodsInfo.getGoodsId());
                    JSONArray jsonArray = JSON.parseArray(goodsInfo.getStandards());
                    for (int j = 0; j < jsonArray.size(); j++)
                    {
                        String standardId = jsonArray.getJSONObject(j).get("standardId").toString();
                        standard.setStandardId(StringUtil.isEmpty(standardId) ? IDGenerator.generator() : standardId);
                        standard.setStandardPrice(Float.parseFloat(jsonArray.getJSONObject(j).get("standardPrice").toString()));
                        standard.setStandardWeight(Float.parseFloat(jsonArray.getJSONObject(j).get("standardWeight").toString()));
                        standard.setStandardCount(0);
                        standard.setStandardName(jsonArray.getJSONObject(j).get("standardName").toString());
                        result = dao.insertStandardToGoods(standard);
                        if (result < 1)
                            break;
                    }
                    break;
                case 1:
                    dao.deleteAllImg(goodsInfo.getGoodsId());
                    if (images != null)
                    {
                        for (int j = 0; j < images.length; j++)
                        {
                            imgVO.setImageId(images[j]);
                            imgVO.setGoodsImgType((byte) (j == 0 ? 1 : 2));
                            imgVO.setSort(j);
                            result = dao.insertImgToGoods(imgVO);
                            if (result < 1)
                                break;
                        }
                    }
                    break;
                case 2:
                    result = dao.updateGoods(goodsInfo);
                    break;
                default:
                    result = 0;
                    break;
            }
            i++;
        }

        if (i - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken()));
    }

    @Override
    public ResultVO deleteGoods(SessionVO sessionVO, GoodsInfoVO goodsInfo)
    {
        Integer result = 1;
        int i = 0;
        int count = 3;

        while (result > 0)
        {
            switch (i)
            {
                case 0:
                    result = dao.deleteAllStandard(goodsInfo.getGoodsId());
                    break;
                case 1:
                    result = dao.deleteAllImg(goodsInfo.getGoodsId());
                    break;
                case 2:
                    GoodsInfoVO condition = new GoodsInfoVO();
                    condition.setGoodsId(goodsInfo.getGoodsId());
                    result = dao.deleteGoodsInfo(condition);
                    break;
                default:
                    result = 0;
                    break;
            }
            i++;
        }

        if (i - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        return new ResultVO(result, sessionVO.getToken());
    }

    @Override
    public String findGoodsListByKeyword(SessionVO sessionVO, GoodsInfoVO goodsInfo, PageVO pageVO)
    {
        GoodsInfoVO condition = new GoodsInfoVO();
        condition.setMyTeamId(sessionVO.getMyTeamId());
        condition.setGoodsName(goodsInfo.getGoodsName());

        int start = PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize());
        int end = pageVO.getPageSize();
        int pageCount = PagingUtil.getCount(dao.countGoods(condition), pageVO.getPageSize());

        String branchId = dao.getCurrentBranchId(sessionVO.getUserId());
        if (StringUtil.isEmpty(branchId))
            branchId = dao.getFirstBranchId(sessionVO.getUserId(), BranchConstant.BRANCH_FIRST);

        List<GoodsInfoVO> result = dao.findGoodsList(condition, start, end);
        for (GoodsInfoVO vo : result)
            vo.setStandardList(dao.listStandards(vo.getGoodsId(), branchId));

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String findGoodsTypeByPid(SessionVO sessionVO, GoodsTypeinfo typeinfo)
    {
        List<GoodsTypeinfo> result = typeDao.findGoodsTypeByPid(typeinfo.getGoodsTypePid());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }
}
