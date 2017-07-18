package com.dgg.store.service.store;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dgg.store.dao.store.GoodsManageDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.pojo.GoodsStandard;
import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.pojo.ImageSpace;
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

    @Override
    public ResultVO insertGoodsinfo(SessionVO sessionVO, GoodsInfoVO goodsinfo)
    {
        Integer result = 1;
        goodsinfo.setMyTeamId(sessionVO.getMyTeamId());
        goodsinfo.setGoodsId(IDGenerator.generator());
        String[] images = goodsinfo.getGoodsImages().split("\\|");
        GoodsImgVO imgVO = new GoodsImgVO(sessionVO.getUserId(), goodsinfo.getGoodsId());
        GoodsStandard standard = new GoodsStandard(goodsinfo.getGoodsId());

        JSONArray jsonArray = JSON.parseArray(goodsinfo.getStandards());

        result = dao.insertGoodsinfo(goodsinfo);

        for (int i = 0; i < jsonArray.size(); i++)
        {
            standard.setStandardId(IDGenerator.generator());
            standard.setStandardPrice(Float.parseFloat(jsonArray.getJSONObject(i).get("standardPrice").toString()));
            standard.setStandardWeight(Float.parseFloat(jsonArray.getJSONObject(i).get("standardWeight").toString()));
            standard.setStandardCount(Integer.parseInt(jsonArray.getJSONObject(i).get("standardCount").toString()));
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

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
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
    public ResultVO findTypeAndParents(SessionVO sessionVO, GoodsTypeinfo typeinfo)
    {
        GoodsTypeVO result = dao.findGoodsType(typeinfo.getGoodsTypeId());

        if (result != null)
            result = findTypeParent(result);

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findTypeAttr(SessionVO sessionVO, GoodsTypeAttr typeAttr)
    {
        List<GoodsTypeAttr> result = dao.findTypeAttr(typeAttr.getGoodsTypeId());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertImgToSpace(SessionVO sessionVO, MultipartFile file, String basePath)
    {
        int result = 0;
        StringBuffer path = new StringBuffer();
        String fileName = null;
        String imageId = IDGenerator.generator();

        try
        {
            path.append(Constant.USER_IMAGE_SPACE_PATH).append(sessionVO.getUserId()).append("/");
            fileName = UploadFileUtil.doUpload(file, path.toString(), basePath, IDGenerator.generator());
            dao.insertImgToSpace(imageId, fileName, sessionVO.getMyTeamId());
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), imageId);

        return resultVO;
    }

    @Override
    public ResultVO findImages(SessionVO sessionVO)
    {
        List<ImageSpace> result = dao.findImages(sessionVO.getMyTeamId());

        ResultVO resultVO = new ResultVO(result.size() < 1 ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findGoodsList(SessionVO sessionVO)
    {
        GoodsInfoVO condition = new GoodsInfoVO();
        condition.setMyTeamId(sessionVO.getMyTeamId());
        List<GoodsInfoVO> result = dao.findGoodsList(condition);

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findGoodsInfo(SessionVO sessionVO, GoodsInfoVO infoVO)
    {
        GoodsInfoVO result = dao.findGoodsInfo(infoVO);

        ResultVO resultVO = new ResultVO(result == null ? 2 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO findGoodsDescribe(SessionVO sessionVO, GoodsInfoVO infoVO)
    {
        String[] ids = infoVO.getGoodsDescribe().split(SymbolConstant.VERTICAL);
        List<GoodsImgVO> result = dao.findGoodsDescribe(ids);

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateGoods(SessionVO sessionVO, GoodsInfoVO goodsInfo)
    {
        Integer result = 1;
        int i = 0;
        int count = 3;

        String[] images = goodsInfo.getGoodsImages().split(SymbolConstant.VERTICAL);
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
                        standard.setStandardCount(Integer.parseInt(jsonArray.getJSONObject(j).get("standardCount").toString()));
                        standard.setStandardName(jsonArray.getJSONObject(j).get("standardName").toString());
                        result = dao.insertStandardToGoods(standard);
                        if (result < 1)
                            break;
                    }
                    break;
                case 1:
                    dao.deleteAllImg(goodsInfo.getGoodsId());
                    for (int j = 0; j < images.length; j++)
                    {
                        imgVO.setImageId(images[j]);
                        imgVO.setGoodsImgType((byte) (j == 0 ? 1 : 2));
                        imgVO.setSort(j);
                        result = dao.insertImgToGoods(imgVO);
                        if (result < 1)
                            break;
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

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
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

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findGoodsListByKeyword(SessionVO sessionVO, GoodsInfoVO goodsInfo)
    {
        GoodsInfoVO condition = new GoodsInfoVO();
        condition.setMyTeamId(sessionVO.getMyTeamId());
        condition.setGoodsName(goodsInfo.getGoodsName());
        List<GoodsInfoVO> result = dao.findGoodsList(condition);

        ResultVO resultVO = new ResultVO(1,sessionVO.getToken(),result);

        return resultVO;
    }
}
