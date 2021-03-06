package com.dgg.store.service.common;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.dao.common.MyDao;
import com.dgg.store.util.core.FilePathUtil;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.PathConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.vo.MyAddressVO;
import com.dgg.store.util.vo.MyInfoVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class MyServiceImpl implements MyService
{
    @Autowired
    private MyDao dao;

    @Override
    public String findMyInfo(SessionVO sessionVO)
    {
        MyInfoVO result = dao.findMyInfo(sessionVO.getUserId());
        if (result == null)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));
        result.setMyTeamName(dao.getMyTeamName(sessionVO.getMyTeamId()));
        result.setPositionName(dao.getPositionName(result.getPositionId()));
        result.setTeamDepartmentName(dao.getDepartmentName(result.getTeamDepartmentId()));


        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
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
    public ResultVO updateUserImg(SessionVO sessionVO, MultipartFile file)
    {
        int result = 0;
        StringBuilder path = new StringBuilder();
        String fileName = null;

        if (file == null)
            return new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken());

        try
        {
            path.append(PathConstant.USER_HEAD_PORTRAIT_IMG_PATH);
            fileName = PathConstant.IMAGE_SERVER_NAME + UploadFileUtil.doUpload(file, path.toString(), PathConstant.UPLOAD_BASE_PATH, IDGenerator.generator());
            result = dao.updateUserImg(sessionVO.getUserId(), fileName);
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        return new ResultVO(result, sessionVO.getToken(), fileName);
    }

    @Override
    public String findMyDefaultAddress(SessionVO sessionVO)
    {
        MyAddressVO result = dao.findMyDefaultAddress(sessionVO.getUserId());

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

}
