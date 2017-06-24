package com.dgg.store.dao.common;

import com.dgg.store.mapper.MyMapper;
import com.dgg.store.util.vo.MyAddressVO;
import com.dgg.store.util.vo.MyInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyDaoImpl implements MyDao
{
    @Autowired
    private MyMapper mapper;

    @Override
    public MyInfoVO findMyInfo(String userId)
    {
        return mapper.findMyInfo(userId);
    }

    @Override
    public Integer insertMyAddress(MyAddressVO addressVO)
    {
        return mapper.insertMyAddress(addressVO);
    }

    @Override
    public List<MyAddressVO> findMyAddress(String userId)
    {
        return mapper.findMyAddress(userId);
    }

    @Override
    public Integer updateMyAddress(MyAddressVO addressVO)
    {
        return mapper.updateMyAddress(addressVO);
    }

    @Override
    public Integer deleteMyAddress(String addressId)
    {
        return mapper.deleteMyAddress(addressId);
    }

    @Override
    public String findUserImgPath(String userId)
    {
        return mapper.findUserImgPath(userId);
    }

    @Override
    public int updateUserImg(String userId, String path)
    {
        return mapper.updateUserImg(userId,path);
    }

    @Override
    public Integer updateAddressNotDefault(String userId)
    {
        return mapper.updateAddressNotDefault(userId);
    }

    @Override
    public Integer updateAddressToDefault(String userId)
    {
        return mapper.updateAddressToDefault(userId);
    }
}
