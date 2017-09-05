package com.dgg.store.service.store;

import com.dgg.store.util.pojo.PlaceImage;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.web.multipart.MultipartFile;

public interface UserPlaceService
{

    String insertPlaceCertificate(SessionVO sessionVO, MultipartFile file, String realPath, String parameter);

    String insertPlaceEnvironment(SessionVO sessionVO, MultipartFile file, String realPath, String parameter);

    String insertUserPlace(SessionVO sessionVO, UserPlace place);

    String deleteUserPlace(SessionVO sessionVO, UserPlace place);

    String updateUserPlace(SessionVO sessionVO, UserPlace place);

    String listUserPlace(SessionVO sessionVO, UserPlace place, PageVO pageVO);

    String deletePlaceImage(SessionVO sessionVO, PlaceImage placeImage);

    String getUserPlace(SessionVO sessionVO, UserPlace place);
}
