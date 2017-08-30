package com.dgg.store.mapper;

import com.dgg.store.util.pojo.CommonApplyApprove;
import com.dgg.store.util.pojo.CommonApplyApproveExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommonApplyApproveMapper {
    long countByExample(CommonApplyApproveExample example);

    int deleteByExample(CommonApplyApproveExample example);

    int deleteByPrimaryKey(String applyId);

    int insert(CommonApplyApprove record);

    int insertSelective(CommonApplyApprove record);

    List<CommonApplyApprove> selectByExampleWithBLOBs(CommonApplyApproveExample example);

    List<CommonApplyApprove> selectByExample(CommonApplyApproveExample example);

    CommonApplyApprove selectByPrimaryKey(String applyId);

    int updateByExampleSelective(@Param("record") CommonApplyApprove record, @Param("example") CommonApplyApproveExample example);

    int updateByExampleWithBLOBs(@Param("record") CommonApplyApprove record, @Param("example") CommonApplyApproveExample example);

    int updateByExample(@Param("record") CommonApplyApprove record, @Param("example") CommonApplyApproveExample example);

    int updateByPrimaryKeySelective(CommonApplyApprove record);

    int updateByPrimaryKeyWithBLOBs(CommonApplyApprove record);

    int updateByPrimaryKey(CommonApplyApprove record);
}