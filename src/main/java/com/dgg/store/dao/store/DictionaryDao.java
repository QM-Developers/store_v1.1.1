package com.dgg.store.dao.store;


import com.dgg.store.util.pojo.Dictionary;
import com.dgg.store.util.pojo.DictionaryExample;
import com.dgg.store.util.pojo.ParentDictionary;
import com.dgg.store.util.vo.DictionaryVO;

import java.util.List;

public interface DictionaryDao
{
    Integer insertParentDict(ParentDictionary parentDictionary);

    List<ParentDictionary> findParDict();

    List<Dictionary> findDict(DictionaryExample example);

    void cleanDict(DictionaryVO dictionaryVO);

    Integer insertDict(Dictionary dictionary);

    Integer deleteParDict(ParentDictionary dictionary);
}
