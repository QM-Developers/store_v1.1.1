package com.dgg.store.service.store;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dgg.store.dao.store.GoodsReleaseDao;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.generator.IDGenerator;
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
public class GoodsReleaseServiceImpl implements GoodsReleaseService
{
    @Autowired
    private GoodsReleaseDao dao;

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
            standard.setStandardCount(Integer.parseInt(jsonArray.getJSONObject(i).get("standardCount").toString()));
            standard.setStandardName(jsonArray.getJSONObject(i).get("standardName").toString());
            if(result > 0)
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

    public GoodsTypeVO findTypeParent(GoodsTypeVO typeVO)
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
            fileName = UploadFileUtil.doUpload(file, path.toString(), basePath);
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
}
