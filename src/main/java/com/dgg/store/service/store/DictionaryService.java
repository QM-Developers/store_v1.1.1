package com.dgg.store.service.store;

import com.dgg.store.util.pojo.Dictionary;
import com.dgg.store.util.pojo.ParentDictionary;
import com.dgg.store.util.vo.DictionaryVO;

import java.util.List;

public interface DictionaryService
{
    Integer insertParentDict(ParentDictionary parentDictionary);

    List<ParentDictionary> findParDict();

    List<Dictionary> findDict(Dictionary dictionary);

    Integer insertDict(DictionaryVO dictionaryVO);

    Integer deleteParDict(ParentDictionary dictionary);
}
