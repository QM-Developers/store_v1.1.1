package com.dgg.store.util.pojo;

public class AppUpdate
{
    private Integer appUpdateId;
    private String appVersion;
    private String appUpdateUrl;
    private String appUpdateContent;

    public Integer getAppUpdateId()
    {
        return appUpdateId;
    }

    public void setAppUpdateId(Integer appUpdateId)
    {
        this.appUpdateId = appUpdateId;
    }

    public String getAppVersion()
    {
        return appVersion;
    }

    public void setAppVersion(String appVersion)
    {
        this.appVersion = appVersion;
    }

    public String getAppUpdateUrl()
    {
        return appUpdateUrl;
    }

    public void setAppUpdateUrl(String appUpdateUrl)
    {
        this.appUpdateUrl = appUpdateUrl;
    }

    public String getAppUpdateContent()
    {
        return appUpdateContent;
    }

    public void setAppUpdateContent(String appUpdateContent)
    {
        this.appUpdateContent = appUpdateContent;
    }
}