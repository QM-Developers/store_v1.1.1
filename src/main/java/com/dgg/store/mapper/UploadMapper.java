package com.dgg.store.mapper;

import com.dgg.store.util.pojo.ImageSpace;
import org.apache.ibatis.annotations.Param;

public interface UploadMapper
{
    Integer insertImgToSpace(ImageSpace space);

    int updateUserImg(@Param("userId") String userId, @Param("userImg") String fileName);
}
