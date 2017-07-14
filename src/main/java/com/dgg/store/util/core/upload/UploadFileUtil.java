package com.dgg.store.util.core.upload;


import com.dgg.store.util.core.generator.IDGenerator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

public class UploadFileUtil
{

//    public static final String doUpload(MultipartFile file, String path,String appName) throws IOException
    public static final String doUpload(MultipartFile file, String path,String basePath,String uuid) throws IOException
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
