package com.dgg.store.util.vo.core;

public class ResultVO
{
    private Integer state;
    private Integer pageCount;
    private String token;
    private Object result;

    public ResultVO()
    {
    }

    public ResultVO(Integer state)
    {
        this.state = state;
    }

    public ResultVO(Integer state, String token, Object result)
    {
        this.state = state;
        this.token = token;
        this.result = result;
    }

    public ResultVO(Integer state, String token, Object result, Integer pageCount)
    {
        this.state = state;
        this.token = token;
        this.result = result;
        this.pageCount = pageCount;
    }

    public ResultVO(Integer state, String token)
    {
        this.state = state;
        this.token = token;
    }

    public Integer getState()
    {
        return state;
    }

    public void setState(Integer state)
    {
        this.state = state;
    }

    public String getToken()
    {
        return token;
    }

    public void setToken(String token)
    {
        this.token = token;
    }

    public Object getResult()
    {
        return result;
    }

    public void setResult(Object result)
    {
        this.result = result;
    }

    public Integer getPageCount()
    {
        return pageCount;
    }

    public void setPageCount(Integer pageCount)
    {
        this.pageCount = pageCount;
    }
}
