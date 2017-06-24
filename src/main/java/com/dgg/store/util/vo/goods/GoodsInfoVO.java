package com.dgg.store.util.vo.goods;

public class GoodsInfoVO
{
    private String goodsId;

    private String goodsTypeId;

    private String templateFreightId;

    private String goodsName;

    private Float goodsPrice;

    private Integer goodsCount;

    private Integer goodsFreight;

    private String myTeamId;

    private Integer goodsSales;

    private String goodsDescribe;

    private String goodsAttr;

    private String goodsImages;

    private String standards;

    private int pageNum;

    private int pageSize;

    private int pageCount;

    public String getGoodsId()
    {
        return goodsId;
    }

    public void setGoodsId(String goodsId)
    {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getGoodsTypeId()
    {
        return goodsTypeId;
    }

    public void setGoodsTypeId(String goodsTypeId)
    {
        this.goodsTypeId = goodsTypeId == null ? null : goodsTypeId.trim();
    }

    public String getTemplateFreightId()
    {
        return templateFreightId;
    }

    public void setTemplateFreightId(String templateFreightId)
    {
        this.templateFreightId = templateFreightId == null ? null : templateFreightId.trim();
    }

    public String getGoodsName()
    {
        return goodsName;
    }

    public void setGoodsName(String goodsName)
    {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Float getGoodsPrice()
    {
        return goodsPrice;
    }

    public void setGoodsPrice(Float goodsPrice)
    {
        this.goodsPrice = goodsPrice;
    }

    public Integer getGoodsCount()
    {
        return goodsCount;
    }

    public void setGoodsCount(Integer goodsCount)
    {
        this.goodsCount = goodsCount;
    }

    public Integer getGoodsFreight()
    {
        return goodsFreight;
    }

    public void setGoodsFreight(Integer goodsFreight)
    {
        this.goodsFreight = goodsFreight;
    }

    public String getGoodsDescribe()
    {
        return goodsDescribe;
    }

    public void setGoodsDescribe(String goodsDescribe)
    {
        this.goodsDescribe = goodsDescribe == null ? null : goodsDescribe.trim();
    }

    public String getGoodsAttr()
    {
        return goodsAttr;
    }

    public void setGoodsAttr(String goodsAttr)
    {
        this.goodsAttr = goodsAttr;
    }

    public String getGoodsImages()
    {
        return goodsImages;
    }

    public void setGoodsImages(String goodsImages)
    {
        this.goodsImages = goodsImages;
    }

    public String getStandards()
    {
        return standards;
    }

    public void setStandards(String standards)
    {
        this.standards = standards;
    }

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }

    public Integer getGoodsSales()
    {
        return goodsSales;
    }

    public void setGoodsSales(Integer goodsSales)
    {
        this.goodsSales = goodsSales;
    }

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
    }

    public int getPageCount()
    {
        return pageCount;
    }

    public void setPageCount(int pageCount)
    {
        this.pageCount = pageCount;
    }
}
