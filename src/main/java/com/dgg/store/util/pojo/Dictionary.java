package com.dgg.store.util.pojo;

import java.util.Date;

public class Dictionary {
    private String dictId;

    private String parDictId;

    private String dictName;

    private String dictCode;

    private Date dictCreateDate;

    private String sort;

    public String getDictId() {
        return dictId;
    }

    public void setDictId(String dictId) {
        this.dictId = dictId == null ? null : dictId.trim();
    }

    public String getParDictId() {
        return parDictId;
    }

    public void setParDictId(String parDictId) {
        this.parDictId = parDictId == null ? null : parDictId.trim();
    }

    public String getDictName() {
        return dictName;
    }

    public void setDictName(String dictName) {
        this.dictName = dictName == null ? null : dictName.trim();
    }

    public String getDictCode() {
        return dictCode;
    }

    public void setDictCode(String dictCode) {
        this.dictCode = dictCode == null ? null : dictCode.trim();
    }

    public Date getDictCreateDate() {
        return dictCreateDate;
    }

    public void setDictCreateDate(Date dictCreateDate) {
        this.dictCreateDate = dictCreateDate;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort == null ? null : sort.trim();
    }
}