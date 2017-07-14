package com.dgg.store.util.vo.core;

import com.dgg.store.util.vo.goods.GoodsDetailVO;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

public class ResultVO
{
    private Integer state;
    private String token;
    private int count;
    private int pageCount;
    private int pageNum;
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

    public ResultVO(Integer state, String token, Object result, int pageCount)
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

    public int getPageCount()
    {
        return pageCount;
    }

    public void setPageCount(int pageCount)
    {
        this.pageCount = pageCount;
    }

    public int getCount()
    {
        return count;
    }

    public void setCount(int count)
    {
        this.count = count;
    }

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    private class NotNullFilter
    {
        public Object doFilter(Object obj) throws Exception
        {
            Class instance = obj.getClass();

            if(obj instanceof List)
                return filterList(obj);

            if(instance.getTypeName().equals(Map.class.getTypeName()))
                return obj;

            Field[] fields = instance.getDeclaredFields();
            for (Field f : fields)
            {
                String name = f.getName().replaceFirst(String.valueOf(f.getName().charAt(0)), String.valueOf(f.getName().toUpperCase().charAt(0)));
                Method get = instance.getMethod("get" + name);
                Method set = instance.getMethod("set" + name, f.getType());

                if (get.invoke(obj) == null)
                    set.invoke(obj, getInstance(f.getType().getTypeName()));
                Object value = get.invoke(obj);
                if(value instanceof List)
                    value = new NotNullFilter().doFilter(value);
            }
            return obj;
        }

        public Object filterList(Object obj) throws Exception
        {
            List list = (List) obj;
            for (int i = 0; i < list.size(); i++)
                list.set(i,new NotNullFilter().doFilter(list.get(i)));
            return obj;
        }

        public Object getInstance(String type) throws Exception
        {
            if (type.equals(Map.class.getTypeName()))
                return new HashMap();
            else if (type.equals(Float.class.getTypeName()))
                return new Float(0);
            else if (type.equals(Integer.class.getTypeName()))
                return new Integer(0);
            else if (type.equals(List.class.getTypeName()))
                return new ArrayList();
            return Class.forName(type).newInstance();
        }
    }
}
