package com.dgg.store.service.store;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.store.UserPlaceDao;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.string.StringUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.pojo.PlaceImage;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.pojo.UserPlaceExample;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class UserPlaceServiceImpl implements UserPlaceService
{
    @Autowired
    private UserPlaceDao dao;

    @Override
    public String insertPlaceCertificate(SessionVO sessionVO, MultipartFile file, String realPath, String placeId)
    {
        int result = 0;
        StringBuffer path = new StringBuffer();
        String fileName = null;
        String imageId = IDGenerator.generator();

        try
        {
            path.append(PathConstant.USER_PLACE_IMG_PATH).append(SymbolConstant.SYSTEM_SLASH);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, IDGenerator.generator());
            PlaceImage placeImage = new PlaceImage();
            placeImage.setImgId(imageId);
            placeImage.setImgUrl(fileName);
            placeImage.setUserPlaceId(StringUtil.isEmpty(placeId) ? "" : placeId);
            placeImage.setImgType(PlaceConstant.CERTIFICATE);
            result = dao.insertPlaceImage(placeImage);
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken(), imageId));

        return json.toJSONString();
    }

    @Override
    public String insertPlaceEnvironment(SessionVO sessionVO, MultipartFile file, String realPath, String placeId)
    {
        int result = 0;
        StringBuffer path = new StringBuffer();
        String fileName = null;
        String imageId = IDGenerator.generator();

        try
        {
            path.append(PathConstant.USER_PLACE_IMG_PATH).append(SymbolConstant.SYSTEM_SLASH);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, IDGenerator.generator());
            PlaceImage placeImage = new PlaceImage();
            placeImage.setImgId(imageId);
            placeImage.setImgUrl(fileName);
            placeImage.setUserPlaceId(StringUtil.isEmpty(placeId) ? "" : placeId);
            placeImage.setImgType(PlaceConstant.ENVIRONMENT);
            result = dao.insertPlaceImage(placeImage);
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken(), imageId));

        return json.toJSONString();
    }

    @Override
    public String insertUserPlace(SessionVO sessionVO, UserPlace place)
    {
        int result = 1;
        int index = 0;
        int count = 2;

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    if (place.getCustomerId() == null)
                        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
                    place.setUserPlaceId(IDGenerator.generator());
                    result = dao.insertSelective(place);
                    break;
                case 1:
                    List<String> images = new ArrayList<>();

                    if (!StringUtil.isEmpty(place.getCertificate()))
                        images.addAll(Arrays.asList(place.getCertificate().split(SymbolConstant.COMMA)));
                    if (!StringUtil.isEmpty(place.getEnvironment()))
                        images.addAll(Arrays.asList(place.getEnvironment().split(SymbolConstant.COMMA)));

                    if (images.size() > 0)
                        result = dao.updatePlaceImage(images, place.getUserPlaceId());
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), place.getUserPlaceId()));

        return json.toJSONString();
    }

    @Override
    public String deleteUserPlace(SessionVO sessionVO, UserPlace place)
    {
        int result = 1;
        int index = 0;
        int count = 1;

        while (result > 0)
        {
            switch (index)
            {
                case 0:
                    PlaceImage placeImage = new PlaceImage();
                    placeImage.setUserPlaceId(place.getUserPlaceId());
                    dao.deletePlaceImage(placeImage);
                    result = dao.deleteByPrimaryKey(place.getUserPlaceId());
                    break;
                default:
                    result = 0;
                    break;
            }
            index++;
        }

        if (index - 1 < count)
            throw new RuntimeException(Constant.STR_ADD_FAILED);
        else
            result = 1;

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));

        return json.toJSONString();
    }

    @Override
    public String updateUserPlace(SessionVO sessionVO, UserPlace place)
    {
        UserPlaceExample example = new UserPlaceExample();
        UserPlaceExample.Criteria criteria = example.createCriteria();

        criteria.andUserPlaceIdEqualTo(place.getUserPlaceId());

        if(dao.updateByExampleSelective(place, example) < 1)
            throw new RuntimeException(Constant.STR_ADD_FAILED);

        List<String> images = new ArrayList<>();

        if (!StringUtil.isEmpty(place.getCertificate()))
            images.addAll(Arrays.asList(place.getCertificate().split(SymbolConstant.COMMA)));
        if (!StringUtil.isEmpty(place.getEnvironment()))
            images.addAll(Arrays.asList(place.getEnvironment().split(SymbolConstant.COMMA)));

        if (images.size() > 0)
            if (dao.updatePlaceImage(images, place.getUserPlaceId()) < 1)
                throw new RuntimeException(Constant.STR_ADD_FAILED);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken()));

        return json.toJSONString();
    }

    @Override
    public String listUserPlace(SessionVO sessionVO, UserPlace place, PageVO pageVO)
    {
        place.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        place.setPageSize(pageVO.getPageSize());
        int pageCount = PagingUtil.getCount(dao.countUserPlace(place), pageVO.getPageSize());
        List<UserPlace> result = dao.listUserPlace(place);

        for (UserPlace up : result)
        {
            List<PlaceImage> certificateList = new ArrayList<>();
            List<PlaceImage> environmentList = new ArrayList<>();
            List<PlaceImage> imageList = up.getImageList();
            for (PlaceImage pi : imageList)
                if (pi.getImgType().equals(PlaceConstant.ENVIRONMENT))
                    environmentList.add(pi);
                else
                    certificateList.add(pi);
            up.setCertificateList(certificateList);
            up.setEnvironmentList(environmentList);
            up.setImageList(null);
        }

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(1, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String deletePlaceImage(SessionVO sessionVO, PlaceImage placeImage)
    {
        int result = dao.deletePlaceImage(placeImage);

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(result < 1 ? 2 : 1, sessionVO.getToken()));

        return json.toJSONString();
    }

    @Override
    public String getUserPlace(SessionVO sessionVO, UserPlace place)
    {
        UserPlace result = dao.getUserPlaceById(place.getUserPlaceId());

        List<PlaceImage> certificateList = new ArrayList<>();
        List<PlaceImage> environmentList = new ArrayList<>();
        List<PlaceImage> imageList = result.getImageList();

        for (PlaceImage pi : imageList)
            if (pi.getImgType().equals(PlaceConstant.ENVIRONMENT))
                environmentList.add(pi);
            else
                certificateList.add(pi);

        result.setCertificateList(certificateList);
        result.setEnvironmentList(environmentList);
        result.setImageList(null);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

}
