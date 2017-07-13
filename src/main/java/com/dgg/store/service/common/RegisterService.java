package com.dgg.store.service.common;

import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.web.multipart.MultipartFile;

public interface RegisterService
{
    ResultVO insertCardHand(SessionVO sessionVO, MultipartFile file, String realPath);

    ResultVO insertCardBack(SessionVO sessionVO, MultipartFile file, String realPath);

    ResultVO insertCardFront(SessionVO sessionVO, MultipartFile file, String realPath);
}