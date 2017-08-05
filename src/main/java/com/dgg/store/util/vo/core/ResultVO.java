package com.dgg.store.util.vo.core;

public class ResultVO
{
    private Integer state;
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

}
