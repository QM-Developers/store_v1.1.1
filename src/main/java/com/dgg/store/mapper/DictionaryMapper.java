package com.dgg.store.mapper;

import com.dgg.store.util.pojo.Dictionary;
import com.dgg.store.util.pojo.DictionaryExample;
import java.util.List;

import com.dgg.store.util.pojo.ParentDictionary;
import com.dgg.store.util.vo.DictionaryVO;
import org.apache.ibatis.annotations.Param;

public interface DictionaryMapper {
    long countByExample(DictionaryExample example);

    int deleteByExample(DictionaryExample example);

    int deleteByPrimaryKey(String dictId);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    List<Dictionary> selectByExample(DictionaryExample example);

    Dictionary selectByPrimaryKey(String dictId);

    int updateByExampleSelective(@Param("record") Dictionary record, @Param("example") DictionaryExample example);

    int updateByExample(@Param("record") Dictionary record, @Param("example") DictionaryExample example);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);


    Integer insertParentDict(ParentDictionary parentDictionary);

    List<ParentDictionary> findParDict();

    void cleanDict(DictionaryVO dictionaryVO);

    Integer deleteParDict(ParentDictionary dictionary);
}