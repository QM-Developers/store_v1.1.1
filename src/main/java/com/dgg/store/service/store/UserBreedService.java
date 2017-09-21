package com.dgg.store.service.store;

import com.dgg.store.util.pojo.UserBreed;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface UserBreedService
{
    String insertUserBreed(SessionVO sessionVO, UserBreed breed);

    String listUserBreed(SessionVO sessionVO, UserBreed breed, PageVO pageVO);

    String updateUserBreed(SessionVO sessionVO, UserBreed breed);

    String deleteUserBreed(SessionVO sessionVO, UserBreed breed);

    String listBreedType(SessionVO sessionVO, UserBreed breed);

    String listBreedSelect(SessionVO sessionVO, UserBreed breed);

    String listBreedInfo(SessionVO sessionVO, UserBreed breed);

    String insertUserBreedJson(SessionVO sessionVO, UserBreed breed);

    String updateUserBreedJson(SessionVO sessionVO, UserBreed breed);

    String listUserBreedJson(SessionVO sessionVO, UserBreed breed, PageVO pageVO);
}
