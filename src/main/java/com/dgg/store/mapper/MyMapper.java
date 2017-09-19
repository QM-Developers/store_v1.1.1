package com.dgg.store.mapper;

import com.dgg.store.util.vo.MyAddressVO;
import com.dgg.store.util.vo.MyInfoVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyMapper
{
    MyInfoVO findMyInfo(@Param("userId") String userId);

    Integer insertMyAddress(MyAddressVO addressVO);

    List<MyAddressVO> findMyAddress(@Param("userId") String userId);

    Integer updateMyAddress(MyAddressVO addressVO);

    Integer deleteMyAddress(@Param("addressId") String addressId);

    String findUserImgPath(@Param("userId") String userId);

    int updateUserImg(@Param("userId") String userId, @Param("userImg") String path);

    Integer updateAddressNotDefault(@Param("userId") String userId);

    Integer updateAddressToDefault(@Param("userId") String userId);

    MyAddressVO findMyDefaultAddress(@Param("userId") String userId);
}
