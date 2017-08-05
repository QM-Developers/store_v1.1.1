package com.dgg.store.mapper;

import com.dgg.store.util.pojo.UserBreedType;
import com.dgg.store.util.pojo.UserBreedTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserBreedTypeMapper {
    long countByExample(UserBreedTypeExample example);

    int deleteByExample(UserBreedTypeExample example);

    int deleteByPrimaryKey(String breedId);

    int insert(UserBreedType record);

    int insertSelective(UserBreedType record);

    List<UserBreedType> selectByExample(UserBreedTypeExample example);

    UserBreedType selectByPrimaryKey(String breedId);

    int updateByExampleSelective(@Param("record") UserBreedType record, @Param("example") UserBreedTypeExample example);

    int updateByExample(@Param("record") UserBreedType record, @Param("example") UserBreedTypeExample example);

    int updateByPrimaryKeySelective(UserBreedType record);

    int updateByPrimaryKey(UserBreedType record);
}