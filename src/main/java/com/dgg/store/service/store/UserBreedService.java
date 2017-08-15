package com.dgg.store.service.store;

import com.dgg.store.util.pojo.UserBreed;
import com.dgg.store.util.vo.core.SessionVO;

public interface UserBreedService
{
    String insertUserBreed(SessionVO sessionVO, UserBreed breed);

    String listUserBreed(SessionVO sessionVO, UserBreed breed);

    String updateUserBreed(SessionVO sessionVO, UserBreed breed);

    String deleteUserBreed(SessionVO sessionVO, UserBreed breed);
}
