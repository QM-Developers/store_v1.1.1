package com.dgg.store.dao.store;

import com.dgg.store.mapper.DictionaryMapper;
import com.dgg.store.util.pojo.Dictionary;
import com.dgg.store.util.pojo.DictionaryExample;
import com.dgg.store.util.pojo.ParentDictionary;
import com.dgg.store.util.vo.DictionaryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DictionaryDaoImpl implements DictionaryDao
{
    @Autowired
    private DictionaryMapper mapper;

    @Override
    public Integer insertParentDict(ParentDictionary parentDictionary)
    {
        return mapper.insertParentDict(parentDictionary);
    }

    @Override
    public List<ParentDictionary> findParDict()
    {
        return mapper.findParDict();
    }

    @Override
    public List<Dictionary> findDict(DictionaryExample example)
    {
        return mapper.selectByExample(example);
    }

    @Override
    public void cleanDict(DictionaryVO dictionaryVO)
    {
        mapper.cleanDict(dictionaryVO);
    }

    @Override
    public Integer insertDict(Dictionary dictionary)
    {
        return mapper.insert(dictionary);
    }

    @Override
    public Integer deleteParDict(ParentDictionary dictionary)
    {
        return mapper.deleteParDict(dictionary);
    }
}
