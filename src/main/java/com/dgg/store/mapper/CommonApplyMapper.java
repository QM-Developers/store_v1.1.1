package com.dgg.store.mapper;

import com.dgg.store.util.pojo.CommonApply;
import com.dgg.store.util.pojo.CommonApplyApprove;
import com.dgg.store.util.pojo.CommonApplyExample;

import java.util.List;

import com.dgg.store.util.pojo.CommonApplyImage;
import org.apache.ibatis.annotations.Param;

public interface CommonApplyMapper
{
    long countByExample(CommonApplyExample example);

    int deleteByExample(CommonApplyExample example);

    int deleteByPrimaryKey(String applyId);

    int insert(CommonApply record);

    int insertSelective(CommonApply record);

    List<CommonApply> selectByExample(CommonApplyExample example);

    CommonApply selectByPrimaryKey(String applyId);

    int updateByExampleSelective(@Param("record") CommonApply record, @Param("example") CommonApplyExample example);

    int updateByExample(@Param("record") CommonApply record, @Param("example") CommonApplyExample example);

    int updateByPrimaryKeySelective(CommonApply record);

    int updateByPrimaryKey(CommonApply record);

    String getUserNameById(@Param("userId") String userId);

    int insertCommonApplyImage(@Param("imageId") String imageId, @Param("imagePath") String fileName);

    int insertApprove(CommonApplyApprove approve);

    int updateImage(CommonApplyImage image);

    List<CommonApplyImage> listImage(@Param("applyId") String applyId);

    List<CommonApplyApprove> listApprove(@Param("applyId") String applyId);

    int countCommonApplyByApprove(@Param("userId") String userId);

    List<CommonApply> listCommonApplyByApprove(@Param("userId") String userId, @Param("statusList") List<Byte> statusList, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    int updateCommonApproveResult(CommonApplyApprove approve);

    CommonApplyApprove getApplyApprove(CommonApplyApprove approve);

    String getDeviceToken(@Param("userId") String approveId);

    String getUserImage(String userId);

    String getDepartmentName(String userId);
}