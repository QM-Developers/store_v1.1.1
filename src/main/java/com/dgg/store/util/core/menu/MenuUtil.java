package com.dgg.store.util.core.menu;

import com.dgg.store.util.vo.core.MenuVO;

import java.util.ArrayList;
import java.util.List;

public class MenuUtil
{
    public static final String MYCUSTOMERID = "1";


    public static final List<MenuVO> addChild(List<MenuVO> parent,List<MenuVO> children, String parantId)
    {
        for (MenuVO p : parent)
        {
            if(parantId.equals(p.getId()))
            {
                for (MenuVO c : children)
                {
                    c.setIcon("");
                    c.setIsHeader("0");
                    c.setOrder("1");
                    c.setParentId(parantId);
                    c.setUrl(p.getUrl()+"?"+c.getId());
                }
                p.setChildMenus(children);
                p.setUrl("");
                break;
            }
        }

        return parent;
    }

    public static final List<MenuVO> addChild(List<MenuVO> allItems, String parantId)
    {
        // 子菜单
        List<MenuVO> children = new ArrayList<>();
        MenuVO item = null;
        for (int i = 0; i < allItems.size(); i++)
        {
            item = allItems.get(i);
            if (parantId.equals(item.getParentId()))
            {   // 当前菜单的 父类id 与传入的 父类id 相等，就添加到 子菜单
                children.add(item);
                // 删除以添加的 菜单
                allItems.remove(item);
                i--;
            }
        }

        // 还没有添加完成就继续 添加
        if (allItems.size() > 0)
        {
            for (MenuVO child : children)
            {
                child.setChildMenus(addChild(allItems, child.getId()));
            }
        }
        return children;
    }

}
