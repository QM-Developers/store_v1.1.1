package com.dgg.store.util.core.date;

import org.junit.Test;

import java.util.Calendar;

public class TimestampUtil
{
    private static Calendar calendar = Calendar.getInstance();
    private static final int hour = 24;
    private static final int minute = 60;
    private static final int second = 60;
    private static final int millisecond = 1000;

    public static final int betweenDays(long beginTime, long endTime)
    {
        return (int) ((endTime - beginTime) / (millisecond * second * minute * hour));
    }

    public static final int betweenHours(long beginTime, long endTime)
    {
        return (int) ((endTime - beginTime) / (millisecond * second * minute));
    }

    public static final int betweenMinutes(long beginTime, long endTime)
    {
        return (int) ((endTime - beginTime) / (millisecond * second));
    }

    public static final int betweenSeconds(long beginTime, long endTime)
    {
        return (int) ((endTime - beginTime) / (millisecond));
    }

    public static final long getNextDay(long now, int day)
    {
        return now + millisecond * second * minute * hour * day;
    }

    public static final long getNextHour(long now, int hour)
    {
        return now + millisecond * second * minute * hour;
    }

    public static final long getNextMinute(long now, int minute)
    {
        return now + millisecond * second * minute;
    }

    public static final long getNextSecond(long now, int second)
    {
        return now + millisecond * second;
    }

    public static final int getYear(long now)
    {
        calendar.setTimeInMillis(now);
        return calendar.getWeekYear();
    }

    public static final int getMonth(long now)
    {
        calendar.setTimeInMillis(now);
        return calendar.get(Calendar.MONDAY) + 1;
    }

    public static final int getDayOfMonth(long now)
    {
        calendar.setTimeInMillis(now);
        return calendar.get(Calendar.DAY_OF_MONTH);
    }

    public static final int getDayOfWeek(long now)
    {
        calendar.setTimeInMillis(now);
        boolean isFirstSunday = (calendar.getFirstDayOfWeek() == Calendar.SUNDAY);
        int weekDay = calendar.get(Calendar.DAY_OF_WEEK);
        if (isFirstSunday)
        {
            weekDay = weekDay - 1;
            if (weekDay == 0)
                weekDay = 7;
        }
        return weekDay;
    }

}
