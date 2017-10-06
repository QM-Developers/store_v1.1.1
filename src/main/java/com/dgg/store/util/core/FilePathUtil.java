package com.dgg.store.util.core;

import java.io.File;

public class FilePathUtil
{
    public static void main(String[] args)
    {
        System.out.println(getPrevPath("D:\\WorkSpace\\work\\store_v1.1.1\\target\\tweb",1));
    }

    public static String getPrevPath(String path, int count)
    {
        int index = path.lastIndexOf(File.separator);
        path = path.substring(0, index);
        if (count > 1)
            path = getPrevPath(path, count - 1);
        return path;
    }
}
