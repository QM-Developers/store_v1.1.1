package com.dgg.store.service.common;

import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
public class RegisterServiceImpl implements RegisterService
{
    @Override
    public ResultVO insertCardHand(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        return null;
    }

    @Override
    public ResultVO insertCardBack(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        return null;
    }

    @Override
    public ResultVO insertCardFront(SessionVO sessionVO, MultipartFile file, String realPath)
    {
        return null;
    }

    private String saveImage(MultipartFile file, String realPath)
    {
        StringBuffer path = new StringBuffer();
        String fileName = null;

        try
        {
            path.append(Constant.USER_ID_CARD_PATH);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath);
        } catch (IOException e)
        {
            e.printStackTrace();
            fileName = Constant.STR_ADD_FAILED;
        }

        return fileName;
    }
}
