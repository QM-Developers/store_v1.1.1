package com.dgg.store.dao.store;

import com.dgg.store.mapper.UserPlaceMapper;
import com.dgg.store.util.pojo.UserBreedType;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.pojo.UserPlaceHardware;
import com.dgg.store.util.vo.UserPlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserPlaceDaoImpl implements UserPlaceDao
{
    @Autowired
    private UserPlaceMapper mapper;
}
