package com.dgg.store.dao.store;

import com.dgg.store.mapper.CommonApplyMapper;
import com.dgg.store.util.pojo.CommonApply;
import com.dgg.store.util.pojo.CommonApplyApprove;
import com.dgg.store.util.pojo.CommonApplyExample;
import com.dgg.store.util.pojo.CommonApplyImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommonApplyDaoImpl implements CommonApplyDao
{
    @Autowired
    private CommonApplyMapper mapper;

    @Override
    public long countByExample(CommonApplyExample example)
    {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(CommonApplyExample example)
    {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String userPlaceId)
    {
        return mapper.deleteByPrimaryKey(userPlaceId);
    }

    @Override
    public int insert(CommonApply record)
    {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(CommonApply record)
    {
        return mapper.insertSelective(record);
    }

    @Override
    public List<CommonApply> selectByExample(CommonApplyExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public CommonApply selectByPrimaryKey(String userPlaceId)
    {
        return mapper.selectByPrimaryKey(userPlaceId);
    }

    @Override
    public int updateByExampleSelective(CommonApply record, CommonApplyExample example)
    {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(CommonApply record, CommonApplyExample example)
    {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(CommonApply record)
    {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(CommonApply record)
    {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public String getUserNameById(String userId)
    {
        return mapper.getUserNameById(userId);
    }

    @Override
    public int insertCommonApplyImage(String imageId, String fileName)
    {
        return mapper.insertCommonApplyImage(imageId, fileName);
    }

    @Override
    public int insertApprove(CommonApplyApprove approve)
    {
        return mapper.insertApprove(approve);
    }

    @Override
    public int updateImage(CommonApplyImage image)
    {
        return mapper.updateImage(image);
    }

    @Override
    public List<CommonApplyImage> listImage(String applyId)
    {
        return mapper.listImage(applyId);
    }

    @Override
    public List<CommonApplyApprove> listApprove(String applyId)
    {
        return mapper.listApprove(applyId);
    }

    @Override
    public int countCommonApplyByApprove(String userId)
    {
        return mapper.countCommonApplyByApprove(userId);
    }

    @Override
    public List<CommonApply> listCommonApplyByApprove(String userId, Byte status, int pageNum, int pageSize)
    {
        return mapper.listCommonApplyByApprove(userId, status, pageNum, pageSize);
    }

    @Override
    public int updateCommonApproveResult(CommonApplyApprove approve)
    {
        return mapper.updateCommonApproveResult(approve);
    }

    @Override
    public String getDeviceToken(String approveId)
    {
        return mapper.getDeviceToken(approveId);
    }

    @Override
    public String getUserImage(String userId)
    {
        return mapper.getUserImage(userId);
    }

    @Override
    public CommonApplyApprove getApplyApprove(CommonApplyApprove approve)
    {
        return mapper.getApplyApprove(approve);
    }

}
