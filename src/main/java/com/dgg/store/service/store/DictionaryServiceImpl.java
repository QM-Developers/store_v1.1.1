package com.dgg.store.service.store;

import com.dgg.store.dao.store.DictionaryDao;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.pojo.Dictionary;
import com.dgg.store.util.pojo.DictionaryExample;
import com.dgg.store.util.pojo.ParentDictionary;
import com.dgg.store.util.vo.DictionaryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DictionaryServiceImpl implements DictionaryService
{
    @Autowired
    private DictionaryDao dao;

    @Override
    public Integer insertParentDict(ParentDictionary parentDictionary)
    {
        parentDictionary.setParDictId(IDGenerator.generator());

        return dao.insertParentDict(parentDictionary);
    }

    @Override
    public List<ParentDictionary> findParDict()
    {
        return dao.findParDict();
    }

    @Override
    public List<Dictionary> findDict(Dictionary dictionary)
    {
        DictionaryExample example = new DictionaryExample();
        DictionaryExample.Criteria criteria = example.createCriteria();
        example.setOrderByClause("sort");
        criteria.andParDictIdEqualTo(dictionary.getParDictId());

        return dao.findDict(example);
    }

    @Override
    public Integer insertDict(DictionaryVO dictionaryVO)
    {
        String[] codes = dictionaryVO.getDictionaryCodes().split(",");
        String[] names = dictionaryVO.getDictionaryNames().split(",");
        String[] sort = dictionaryVO.getSort().split(",");
        Dictionary dictionary = new Dictionary();
        int result = 1;

        dao.cleanDict(dictionaryVO);

        for (int i = 0; i < codes.length; i++)
        {
            dictionary.setDictId(IDGenerator.generator());
            dictionary.setDictCode(codes[i]);
            dictionary.setDictName(names[i]);
            dictionary.setParDictId(dictionaryVO.getParDictId());
            dictionary.setSort(sort[i]);
            if(result != 0)
                result = dao.insertDict(dictionary);
        }

        return result;
    }

    @Override
    public Integer deleteParDict(ParentDictionary dictionary)
    {
        DictionaryVO vo = new DictionaryVO();
        vo.setParDictId(dictionary.getParDictId());
        dao.cleanDict(vo);

        return dao.deleteParDict(dictionary);
    }
}
