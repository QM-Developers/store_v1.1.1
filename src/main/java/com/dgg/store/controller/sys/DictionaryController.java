package com.dgg.store.controller.sys;

import com.dgg.store.service.store.DictionaryService;
import com.dgg.store.util.pojo.Dictionary;
import com.dgg.store.util.pojo.ParentDictionary;
import com.dgg.store.util.vo.DictionaryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 数据字典控制器()
 */
@Controller
public class DictionaryController
{
    @Autowired
    private DictionaryService service;

    @RequestMapping(value = "/sr/addParentDict",method = RequestMethod.POST)
    @ResponseBody
    public Integer addParentDict(ParentDictionary parentDictionary)
    {
        return service.insertParentDict(parentDictionary);
    }

    @RequestMapping(value = "/sr/findParDict",method = RequestMethod.POST)
    @ResponseBody
    public List<ParentDictionary> findParDict()
    {
        return service.findParDict();
    }

    @RequestMapping(value = "/sr/loadDict",method = RequestMethod.POST)
    @ResponseBody
    public List<Dictionary> loadDict(Dictionary dictionary)
    {
        return service.findDict(dictionary);
    }

    @RequestMapping(value = "/sr/saveDict",method = RequestMethod.POST)
    @ResponseBody
    public Integer saveDict(DictionaryVO dictionaryVO)
    {
        return service.insertDict(dictionaryVO);
    }

    @RequestMapping(value = "/sr/deleteParDict",method = RequestMethod.POST)
    @ResponseBody
    public Integer deleteParDict(ParentDictionary dictionary)
    {
        return service.deleteParDict(dictionary);
    }


}
