package com.dgg.store.util.vo.goods;

import com.dgg.store.util.pojo.GoodsStandard;

import java.util.Date;
import java.util.List;

public class GoodsInfoVO
{
    private String goodsId;

    private String goodsTypeId;

    private String goodsTypeName;

    private String goodsName;

    private String myTeamId;

    private Integer goodsSales;

    private String goodsCode;

    private String goodsDescribe;

    private String goodsAttr;

    private String goodsImages;

    private String standards;

    private Float goodsPrice;

    private Date createDate;

    private List<GoodsImgVO> imgList;

    private List<GoodsStandard> standardList;

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

    public String getGoodsTypeName()
    {
        return goodsTypeName;
    }

    public void setGoodsTypeName(String goodsTypeName)
    {
        this.goodsTypeName = goodsTypeName;
    }

    public String getGoodsName()
    {
        return goodsName;
    }

    public void setGoodsName(String goodsName)
    {
        this.goodsName = goodsName;
    }

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
    }

    public Integer getGoodsSales()
    {
        return goodsSales;
    }

    public void setGoodsSales(Integer goodsSales)
    {
        this.goodsSales = goodsSales;
    }

    public String getGoodsDescribe()
    {
        return goodsDescribe;
    }

    public void setGoodsDescribe(String goodsDescribe)
    {
        this.goodsDescribe = goodsDescribe;
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

    public Date getCreateDate()
    {
        return createDate;
    }

    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }

    public List<GoodsStandard> getStandardList()
    {
        return standardList;
    }

    public void setStandardList(List<GoodsStandard> standardList)
    {
        this.standardList = standardList;
    }

    public List<GoodsImgVO> getImgList()
    {
        return imgList;
    }

    public void setImgList(List<GoodsImgVO> imgList)
    {
        this.imgList = imgList;
    }

    public Float getGoodsPrice()
    {
        return goodsPrice;
    }

    public void setGoodsPrice(Float goodsPrice)
    {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsCode()
    {
        return goodsCode;
    }

    public void setGoodsCode(String goodsCode)
    {
        this.goodsCode = goodsCode;
    }
}
