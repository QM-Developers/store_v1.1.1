package com.dgg.store.util.vo.goods;

import com.dgg.store.util.pojo.GoodsStandard;

import java.util.Date;
import java.util.List;

public class GoodsDetailVO
{
    private String goodsId;

    private String goodsName;

    private String goodsAttr;

    private Integer goodsFreight;

    private Integer goodsSales;

    private Date goodsCreateDate;

    private String goodsType;

    private List<String> goodsImages;

    private List<String> detailImages;

    private List<GoodsStandard> standards;

    public String getGoodsId()
    {
        return goodsId;
    }

    public void setGoodsId(String goodsId)
    {
        this.goodsId = goodsId;
    }

    public String getGoodsName()
    {
        return goodsName;
    }

    public void setGoodsName(String goodsName)
    {
        this.goodsName = goodsName;
    }

    public Integer getGoodsFreight()
    {
        return goodsFreight;
    }

    public void setGoodsFreight(Integer goodsFreight)
    {
        this.goodsFreight = goodsFreight;
    }

    public List<String> getGoodsImages()
    {
        return goodsImages;
    }

    public void setGoodsImages(List<String> goodsImages)
    {
        this.goodsImages = goodsImages;
    }

    public List<GoodsStandard> getStandards()
    {
        return standards;
    }

    public void setStandards(List<GoodsStandard> standards)
    {
        this.standards = standards;
    }

    public Integer getGoodsSales()
    {
        return goodsSales;
    }

    public void setGoodsSales(Integer goodsSales)
    {
        this.goodsSales = goodsSales;
    }

    public List<String> getDetailImages()
    {
        return detailImages;
    }

    public void setDetailImages(List<String> detailImages)
    {
        this.detailImages = detailImages;
    }

    public String getGoodsAttr()
    {
        return goodsAttr;
    }

    public void setGoodsAttr(String goodsAttr)
    {
        this.goodsAttr = goodsAttr;
    }

    public Date getGoodsCreateDate()
    {
        return goodsCreateDate;
    }

    public void setGoodsCreateDate(Date goodsCreateDate)
    {
        this.goodsCreateDate = goodsCreateDate;
    }

    public String getGoodsType()
    {
        return goodsType;
    }

    public void setGoodsType(String goodsType)
    {
        this.goodsType = goodsType;
    }
}
