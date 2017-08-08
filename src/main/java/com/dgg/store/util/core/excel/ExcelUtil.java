package com.dgg.store.util.core.excel;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class ExcelUtil
{
    public static boolean write(String path, String sheetName, String[][] values)
    {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet(sheetName);
        for (int i = 0; i < values.length; i++)
        {
            HSSFRow rows = sheet.createRow(i);
            for (int j = 0; j < values[i].length; j++)
                rows.createCell(j).setCellValue(values[i][j]);
        }

        File xlsFile = new File(path);
        FileOutputStream xlsStream = null;
        try
        {
            xlsStream = new FileOutputStream(xlsFile);
            workbook.write(xlsStream);
        } catch (IOException e)
        {
            e.printStackTrace();
            return false;
        }finally
        {
            if (xlsStream != null)
                try
                {
                    xlsStream.close();
                } catch (IOException e)
                {
                    e.printStackTrace();
                }
        }
        return true;
    }

    public static String[][] read(String path, String sheetName)
    {
        FileInputStream xmlStream = null;
        HSSFWorkbook workbook = null;
        String[][] values = null;
        try
        {
            xmlStream = new FileInputStream(path);
            workbook = new HSSFWorkbook(xmlStream);
            HSSFSheet sheet = workbook.getSheet(sheetName);
            int rows = sheet.getLastRowNum() + 1;
            HSSFRow row = sheet.getRow(0);
            if (row == null)
                return values;
            int cols = row.getPhysicalNumberOfCells();
            values = new String[rows][cols];
            for (int i = 0; i < rows; i++)
            {
                row = sheet.getRow(i);
                for (int j = 0; j < cols; j++)
                    values[i][j] = row.getCell(j).getStringCellValue();
            }
        } catch (IOException e)
        {
            e.printStackTrace();
        }finally
        {
            if (xmlStream != null)
                try
                {
                    xmlStream.close();
                } catch (IOException e)
                {
                    e.printStackTrace();
                }
            if (workbook != null)
                try
                {
                    workbook.close();
                } catch (IOException e)
                {
                    e.printStackTrace();
                }
        }

        return values;
    }
}
