package com.dgg.store.util.core.date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil
{
    private static final int hour = 24;
    private static final int minute = 60;
    private static final int second = 60;
    private static final int millisecond = 1000;

    public static int betweenDays(long beginTime, long endTime)
    {
        return (int) ((endTime - beginTime) / (millisecond * second * minute * hour));
    }

    public static int betweenHours(long beginTime, long endTime)
    {
        return (int) ((endTime - beginTime) / (millisecond * second * minute));
    }

    public static int betweenMinutes(long beginTime, long endTime)
    {
        return (int) ((endTime - beginTime) / (millisecond * second));
    }

    public static int betweenSeconds(long beginTime, long endTime)
    {
        return (int) ((endTime - beginTime) / (millisecond));
    }

    public static long getNextDay(long now, int day)
    {
        return now + millisecond * second * minute * hour * day;
    }

    public static long getNextHour(long now, int hour)
    {
        return now + millisecond * second * minute * hour;
    }

    public static long getNextMinute(long now, int minute)
    {
        return now + millisecond * second * minute;
    }

    public static long getNextSecond(long now, int second)
    {
        return now + millisecond * second;
    }

    public static Date strToDate(String stringDate)
    {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try
        {
            return simpleDateFormat.parse(stringDate);
        } catch (ParseException e)
        {
            e.printStackTrace();
        }
        return null;
    }
}