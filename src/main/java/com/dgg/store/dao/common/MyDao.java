package com.dgg.store.dao.common;

import com.dgg.store.util.vo.MyAddressVO;
import com.dgg.store.util.vo.MyInfoVO;

import java.util.List;

public interface MyDao
{
    MyInfoVO findMyInfo(String userId);

    Integer insertMyAddress(MyAddressVO addressVO);

    List<MyAddressVO> findMyAddress(String userId);

    Integer updateMyAddress(MyAddressVO addressVO);

    Integer deleteMyAddress(String addressId);

    String findUserImgPath(String userId);

    int updateUserImg(String userId, String path);

    Integer updateAddressNotDefault(String userId);

    Integer updateAddressToDefault(String userId);

    MyAddressVO findMyDefaultAddress(String userId);

    String getMyTeamName(String myTeamId);

    String getPositionName(String positionId);

    String getDepartmentName(String teamDepartmentId);
}
