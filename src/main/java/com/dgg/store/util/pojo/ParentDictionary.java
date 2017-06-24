package com.dgg.store.util.pojo;

import java.util.Date;

public class ParentDictionary {
    private String parDictId;

    private String parDictName;

    private Date parDictCreateDate;

    private String sort;

    public String getParDictId() {
        return parDictId;
    }

    public void setParDictId(String parDictId) {
        this.parDictId = parDictId == null ? null : parDictId.trim();
    }

    public String getParDictName() {
        return parDictName;
    }

    public void setParDictName(String parDictName) {
        this.parDictName = parDictName == null ? null : parDictName.trim();
    }

    public Date getParDictCreateDate() {
        return parDictCreateDate;
    }

    public void setParDictCreateDate(Date parDictCreateDate) {
        this.parDictCreateDate = parDictCreateDate;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort == null ? null : sort.trim();
    }
}