package com.dgg.store.mapper;

import com.dgg.store.util.pojo.PlaceImage;
import com.dgg.store.util.pojo.UserPlace;
import com.dgg.store.util.pojo.UserPlaceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserPlaceMapper {
    long countByExample(UserPlaceExample example);

    int deleteByExample(UserPlaceExample example);

    int deleteByPrimaryKey(String userPlaceId);

    int insert(UserPlace record);

    int insertSelective(UserPlace record);

    List<UserPlace> selectByExample(UserPlaceExample example);

    UserPlace selectByPrimaryKey(String userPlaceId);

    int updateByExampleSelective(@Param("record") UserPlace record, @Param("example") UserPlaceExample example);

    int updateByExample(@Param("record") UserPlace record, @Param("example") UserPlaceExample example);

    int updateByPrimaryKeySelective(UserPlace record);

    int updateByPrimaryKey(UserPlace record);

    int insertPlaceImage(PlaceImage placeImage);

    int updatePlaceImage(@Param("images") List<String> images,@Param("placeId") String placeId);

    int deletePlaceImage(PlaceImage placeImage);

    List<UserPlace> listUserPlace(UserPlace place);

    int countUserPlace(UserPlace place);

    UserPlace getUserPlaceById(@Param("placeId") String userPlaceId);
}