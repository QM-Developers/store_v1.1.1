package com.dgg.store.util.vo.goods;

import java.util.List;

public class AreaFreightVO
{
    private String areaFreightId;

    private String templateFreightId;

    private Integer areaFirstNum;

    private Float areaFirstPrice;

    private Integer areaContinueNum;

    private Float areaContinuePrice;

    private List<String> areaIdList;

    private String areaIds;

    public String getAreaIds()
    {
        return areaIds;
    }

    public void setAreaIds(String areaIds)
    {
        this.areaIds = areaIds;
    }

    public Integer getAreaFirstNum()
    {
        return areaFirstNum;
    }

    public void setAreaFirstNum(Integer areaFirstNum)
    {
        this.areaFirstNum = areaFirstNum;
    }

    public Float getAreaFirstPrice()
    {
        return areaFirstPrice;
    }

    public void setAreaFirstPrice(Float areaFirstPrice)
    {
        this.areaFirstPrice = areaFirstPrice;
    }

    public Integer getAreaContinueNum()
    {
        return areaContinueNum;
    }

    public void setAreaContinueNum(Integer areaContinueNum)
    {
        this.areaContinueNum = areaContinueNum;
    }

    public Float getAreaContinuePrice()
    {
        return areaContinuePrice;
    }

    public void setAreaContinuePrice(Float areaContinuePrice)
    {
        this.areaContinuePrice = areaContinuePrice;
    }

    public String getAreaFreightId()
    {
        return areaFreightId;
    }

    public void setAreaFreightId(String areaFreightId)
    {
        this.areaFreightId = areaFreightId;
    }

    public String getTemplateFreightId()
    {
        return templateFreightId;
    }

    public void setTemplateFreightId(String templateFreightId)
    {
        this.templateFreightId = templateFreightId;
    }

    public List<String> getAreaIdList()
    {
        return areaIdList;
    }

    public void setAreaIdList(List<String> areaIdList)
    {
        this.areaIdList = areaIdList;
    }
}
