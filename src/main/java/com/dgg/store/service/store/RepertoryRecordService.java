package com.dgg.store.service.store;

import com.dgg.store.util.pojo.RepertoryRecord;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;

public interface RepertoryRecordService
{
//    String updateRepertoryAddFirst(SessionVO sessionVO, RepertoryRecord repertoryRecord);
//
//    String updateRepertorySubFirst(SessionVO sessionVO, RepertoryRecord repertoryRecord);
//
//    String updateRepertoryAddSecond(SessionVO sessionVO, RepertoryRecord repertoryRecord);
//
//    String updateRepertorySubSecond(SessionVO sessionVO, RepertoryRecord repertoryRecord);

    String listRepertoryRecord(SessionVO sessionVO, RepertoryRecord repertoryRecord, PageVO pageVO);

    String updateRepertory(SessionVO sessionVO, RepertoryRecord repertoryRecord);

    String getRepertoryRecord(SessionVO sessionVO, RepertoryRecord repertoryRecord);
}
