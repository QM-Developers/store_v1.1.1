package com.dgg.store.service.common;

import com.dgg.store.util.vo.MyAddressVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.web.multipart.MultipartFile;

public interface MyService
{
    ResultVO findMyInfo(SessionVO sessionVO);

    ResultVO insertMyAddress(SessionVO sessionVO, MyAddressVO addressVO);

    ResultVO findMyAddress(SessionVO sessionVO);

    ResultVO updateMyAddress(SessionVO sessionVO, MyAddressVO addressVO);

    ResultVO deleteMyAddress(SessionVO sessionVO, MyAddressVO addressVO);

    ResultVO updateUserImg(SessionVO sessionVO, MultipartFile file, String realPath);

    String findMyDefaultAddress(SessionVO sessionVO);

}
