package com.dgg.store.mapper;

import com.dgg.store.util.vo.ChinaVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChinaMapper {
    List<ChinaVO> findAreaByPid(@Param("pid") String pid);

    List<ChinaVO> findAllArea();
}