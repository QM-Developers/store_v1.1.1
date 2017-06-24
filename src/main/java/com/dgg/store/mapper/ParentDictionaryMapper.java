package com.dgg.store.mapper;

import com.dgg.store.util.pojo.ParentDictionary;
import com.dgg.store.util.pojo.ParentDictionaryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ParentDictionaryMapper {
    long countByExample(ParentDictionaryExample example);

    int deleteByExample(ParentDictionaryExample example);

    int deleteByPrimaryKey(String parDictId);

    int insert(ParentDictionary record);

    int insertSelective(ParentDictionary record);

    List<ParentDictionary> selectByExample(ParentDictionaryExample example);

    ParentDictionary selectByPrimaryKey(String parDictId);

    int updateByExampleSelective(@Param("record") ParentDictionary record, @Param("example") ParentDictionaryExample example);

    int updateByExample(@Param("record") ParentDictionary record, @Param("example") ParentDictionaryExample example);

    int updateByPrimaryKeySelective(ParentDictionary record);

    int updateByPrimaryKey(ParentDictionary record);
}