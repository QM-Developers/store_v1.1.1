package com.dgg.store.service.common;

import com.dgg.store.dao.common.MyDao;
import com.dgg.store.util.core.constant.PathConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.vo.MyAddressVO;
import com.dgg.store.util.vo.MyInfoVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MyServiceImpl implements MyService
{
    @Autowired
    private MyDao dao;

    @Override
    public ResultVO findMyInfo(SessionVO sessionVO)
    {
        MyInfoVO result = dao.findMyInfo(sessionVO.getUserId());

        ResultVO resultVO = new ResultVO(result == null ? 0 : 1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO insertMyAddress(SessionVO sessionVO, MyAddressVO addressVO)
    {
        addressVO.setUserId(sessionVO.getUserId());
        addressVO.setUserAddressId(IDGenerator.generator());

        if (addressVO.getUserAddressDefault() == 1)
            dao.updateAddressNotDefault(addressVO.getUserId());

        Integer result = dao.insertMyAddress(addressVO);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO findMyAddress(SessionVO sessionVO)
    {
        List<MyAddressVO> result = dao.findMyAddress(sessionVO.getUserId());

        ResultVO resultVO = new ResultVO(1, sessionVO.getToken(), result);

        return resultVO;
    }

    @Override
    public ResultVO updateMyAddress(SessionVO sessionVO, MyAddressVO addressVO)
    {
        if (addressVO.getUserAddressDefault() == 1)
            dao.updateAddressNotDefault(addressVO.getUserId());

        Integer result = dao.updateMyAddress(addressVO);

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO deleteMyAddress(SessionVO sessionVO, MyAddressVO addressVO)
    {
        Integer result = dao.deleteMyAddress(addressVO.getUserAddressId());
        if (addressVO.getUserAddressDefault() != null && 1 == addressVO.getUserAddressDefault())
            dao.updateAddressToDefault(addressVO.getUserId());

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken());

        return resultVO;
    }

    @Override
    public ResultVO updateUserImg(SessionVO sessionVO, MultipartFile file, String basePath)
    {
        int result = 0;
        StringBuffer path = new StringBuffer();
        String fileName = null;

        String imgPath = basePath + dao.findUserImgPath(sessionVO.getUserId());

        try
        {
            File oldImg = new File(imgPath);
            if (oldImg.exists())
                oldImg.delete();
            path.append(PathConstant.USER_HEAD_PORTRAIT_IMG_PATH).append(sessionVO.getUserId()).append("/");
            fileName = UploadFileUtil.doUpload(file, path.toString(), basePath,IDGenerator.generator());
            result = dao.updateUserImg(sessionVO.getUserId(), fileName);
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        ResultVO resultVO = new ResultVO(result, sessionVO.getToken(), fileName);

        return resultVO;
    }

}
