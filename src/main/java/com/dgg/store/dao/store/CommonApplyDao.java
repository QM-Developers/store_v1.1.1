package com.dgg.store.dao.store;

import com.dgg.store.util.pojo.CommonApply;
import com.dgg.store.util.pojo.CommonApplyApprove;
import com.dgg.store.util.pojo.CommonApplyExample;
import com.dgg.store.util.pojo.CommonApplyImage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommonApplyDao
{
    long countByExample(CommonApplyExample example);

    int deleteByExample(CommonApplyExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(CommonApply record);

    int insertSelective(CommonApply record);

    List<CommonApply> selectByExample(CommonApplyExample example);

    CommonApply selectByPrimaryKey(String breedId);

    int updateByExampleSelective(@Param("record") CommonApply record, @Param("example") CommonApplyExample example);

    int updateByExample(@Param("record") CommonApply record, @Param("example") CommonApplyExample example);

    int updateByPrimaryKeySelective(CommonApply record);

    int updateByPrimaryKey(CommonApply record);
    
    String getUserNameById(String userId);

    int insertCommonApplyImage(String imageId, String fileName);

    int insertApprove(CommonApplyApprove approve);

    int updateImage(CommonApplyImage image);

    List<CommonApplyImage> listImage(String applyId);

    List<CommonApplyApprove> listApprove(String applyId);

    int countCommonApplyByApprove(String userId);

    List<CommonApply> listCommonApplyByApprove(String userId, List<Byte> statusList, int pageNum, int pageSize);

    CommonApplyApprove getApplyApprove(CommonApplyApprove condition);

    int updateCommonApproveResult(CommonApplyApprove approve);

    String getDeviceToken(String approveId);

    String getUserImage(String proposerId);

    String getDepartmentName(String userId);
}
