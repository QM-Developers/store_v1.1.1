package com.dgg.store.util.vo.goods;

import java.util.List;

public class TemplateOfFreightVO
{
    private String templateFreightId;

    private String userId;

    private String templateFreightName;

    private Integer templateDeliveryTime;

    private Byte templateFreightIsfree;

    private Byte templateChargeModel;

    private Integer templateDefaultNum;

    private Float templateDefaultPrice;

    private Integer templateAddNum;

    private Float templateAddPrice;

    private List<AreaFreightVO> areaFreightList;

    private String areaFreight;

    public String getTemplateFreightId()
    {
        return templateFreightId;
    }

    public void setTemplateFreightId(String templateFreightId)
    {
        this.templateFreightId = templateFreightId;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getTemplateFreightName()
    {
        return templateFreightName;
    }

    public void setTemplateFreightName(String templateFreightName)
    {
        this.templateFreightName = templateFreightName;
    }

    public Integer getTemplateDeliveryTime()
    {
        return templateDeliveryTime;
    }

    public void setTemplateDeliveryTime(Integer templateDeliveryTime)
    {
        this.templateDeliveryTime = templateDeliveryTime;
    }

    public Byte getTemplateFreightIsfree()
    {
        return templateFreightIsfree;
    }

    public void setTemplateFreightIsfree(Byte templateFreightIsfree)
    {
        this.templateFreightIsfree = templateFreightIsfree;
    }

    public Byte getTemplateChargeModel()
    {
        return templateChargeModel;
    }

    public void setTemplateChargeModel(Byte templateChargeModel)
    {
        this.templateChargeModel = templateChargeModel;
    }

    public Integer getTemplateDefaultNum()
    {
        return templateDefaultNum;
    }

    public void setTemplateDefaultNum(Integer templateDefaultNum)
    {
        this.templateDefaultNum = templateDefaultNum;
    }

    public Integer getTemplateAddNum()
    {
        return templateAddNum;
    }

    public void setTemplateAddNum(Integer templateAddNum)
    {
        this.templateAddNum = templateAddNum;
    }

    public String getAreaFreight()
    {
        return areaFreight;
    }

    public void setAreaFreight(String areaFreight)
    {
        this.areaFreight = areaFreight;
    }

    public Float getTemplateDefaultPrice()
    {
        return templateDefaultPrice;
    }

    public void setTemplateDefaultPrice(Float templateDefaultPrice)
    {
        this.templateDefaultPrice = templateDefaultPrice;
    }

    public Float getTemplateAddPrice()
    {
        return templateAddPrice;
    }

    public void setTemplateAddPrice(Float templateAddPrice)
    {
        this.templateAddPrice = templateAddPrice;
    }

    public List<AreaFreightVO> getAreaFreightList()
    {
        return areaFreightList;
    }

    public void setAreaFreightList(List<AreaFreightVO> areaFreightList)
    {
        this.areaFreightList = areaFreightList;
    }
}
