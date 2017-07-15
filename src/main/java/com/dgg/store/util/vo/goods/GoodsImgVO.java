package com.dgg.store.util.vo.goods;

public class GoodsImgVO
{
    private String goodsId;

    private String imageId;

    private String imagePath;

    private byte goodsImgType;

    private Integer sort;

    public GoodsImgVO()
    {
    }

    public GoodsImgVO(String userId, String goodsId)
    {
        this.goodsId = goodsId;
    }

    public byte getGoodsImgType()
    {
        return goodsImgType;
    }

    public void setGoodsImgType(byte goodsImgType)
    {
        this.goodsImgType = goodsImgType;
    }

    public Integer getSort()
    {
        return sort;
    }

    public void setSort(Integer sort)
    {
        this.sort = sort;
    }

    public String getImageId()
    {
        return imageId;
    }

    public void setImageId(String imageId)
    {
        this.imageId = imageId;
    }

    public String getGoodsId()
    {
        return goodsId;
    }

    public void setGoodsId(String goodsId)
    {
        this.goodsId = goodsId;
    }

    public String getImagePath()
    {
        return imagePath;
    }

    public void setImagePath(String imagePath)
    {
        this.imagePath = imagePath;
    }
}
