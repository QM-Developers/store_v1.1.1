package com.dgg.store.util.vo;


public class DictionaryVO
{
    private String dictionaryCodes;
    private String dictionaryNames;
    private String sort;
    private String parDictId;

    public String getDictionaryCodes()
    {
        return dictionaryCodes;
    }

    public void setDictionaryCodes(String dictionaryCodes)
    {
        this.dictionaryCodes = dictionaryCodes;
    }

    public String getDictionaryNames()
    {
        return dictionaryNames;
    }

    public void setDictionaryNames(String dictionaryNames)
    {
        this.dictionaryNames = dictionaryNames;
    }

    public String getParDictId()
    {
        return parDictId;
    }

    public void setParDictId(String parDictId)
    {
        this.parDictId = parDictId;
    }

    public String getSort()
    {
        return sort;
    }

    public void setSort(String sort)
    {
        this.sort = sort;
    }
}
