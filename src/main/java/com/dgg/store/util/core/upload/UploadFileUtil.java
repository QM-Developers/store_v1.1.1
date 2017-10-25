package com.dgg.store.util.core.upload;


import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class UploadFileUtil
{

//    public static final String doUpload(MultipartFile file, String path,String appName) throws IOException
    public static String doUpload(MultipartFile file, String path,String basePath,String uuid) throws IOException
    {
        //文件名
        String fileName = file.getOriginalFilename();
        //检查文件后缀格式
        String fileEnd = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

        //创建文件唯一名称
//        String uuid = IDGenerator.generator();
        //真实上传路径
        StringBuffer sbRealPath = new StringBuffer();
        sbRealPath.append(path);
        sbRealPath.append(uuid).append(".").append(fileEnd);

        File filePath = new File(basePath + path);

        if (!filePath.exists())
            filePath.mkdirs();

        File targetFile = new File(basePath , sbRealPath.toString());
        file.transferTo(targetFile);

        return sbRealPath.toString();
    }


}
