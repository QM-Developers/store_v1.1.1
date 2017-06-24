package com.dgg.store.util.core.zTree;

import com.dgg.store.util.vo.core.TreeVO;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class TreeUtil<T>
{
    /**
     * 将所有查询到的菜单，以 树 的形式重新整合
     *
     * @param allItems 全部菜单信息
     * @param pid 父类菜单 id
     * @return 整合完成的菜单
     */
    public static final List<TreeVO> addChild(List<TreeVO> allItems, String pid)
    {
        // 子菜单
        List<TreeVO> children = new ArrayList<>();
        TreeVO item = null;
        for (int i = 0; i < allItems.size(); i++)
        {
            item = allItems.get(i);
            if (pid.equals(item.getpId()))
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
            for (TreeVO child : children)
            {
                child.setChildren(addChild(allItems, child.getId()));
            }
        }
        return children;
    }

    public static final List<TreeVO> setStatus(List<TreeVO> allItem, List<TreeVO> compareItem)
    {
        // 用两个结果进行对比
        for (TreeVO all : allItem)
        {
            for (TreeVO compare : compareItem)
            {
                // 要是 id 相同，说明用户与该角色相关联
                if (all.getId().equals(compare.getId()))
                {   // 设置 角色 的选中状态
                    all.setChecked(true);
                    break;
                }
            }
        }
        return allItem;
    }

    public final List<T> addChild(List<T> allItems, String pid, String getPidMethod, String setChildMethod, String getIdMethod) throws Exception
    {
        List<T> children = new ArrayList<>();
        for (int i = 0; i < allItems.size(); i++)
        {
            Object item = allItems.get(i);
            Class instance = item.getClass();
            Method getPid = instance.getMethod(getPidMethod);

            if (pid.equals(getPid.invoke(item)))
            {
                children.add((T) item);
                allItems.remove(item);
                i--;
            }
        }

        // 还没有添加完成就继续 添加
        if (allItems.size() > 0)
        {
            for (Object child : children)
            {
                Class instance = child.getClass();
                Method setChild = instance.getMethod(setChildMethod,List.class);
                Method getId = instance.getMethod(getIdMethod);
                setChild.invoke(child, addChild(allItems, (String) getId.invoke(child), getPidMethod, setChildMethod, getIdMethod));
            }
        }
        return children;
    }
}
