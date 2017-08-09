package com.dgg.store.mapper;

import com.dgg.store.util.pojo.UserBreed;
import com.dgg.store.util.pojo.UserBreedExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserBreedMapper {
    long countByExample(UserBreedExample example);

    int deleteByExample(UserBreedExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(UserBreed record);

    int insertSelective(UserBreed record);

    List<UserBreed> selectByExample(UserBreedExample example);

    UserBreed selectByPrimaryKey(String breedId);

    int updateByExampleSelective(@Param("record") UserBreed record, @Param("example") UserBreedExample example);

    int updateByExample(@Param("record") UserBreed record, @Param("example") UserBreedExample example);

    int updateByPrimaryKeySelective(UserBreed record);

    int updateByPrimaryKey(UserBreed record);
}