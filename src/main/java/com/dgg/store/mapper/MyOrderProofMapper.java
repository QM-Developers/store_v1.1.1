package com.dgg.store.mapper;

import com.dgg.store.util.pojo.MyOrderProof;
import com.dgg.store.util.pojo.MyOrderProofExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyOrderProofMapper {
    long countByExample(MyOrderProofExample example);

    int deleteByExample(MyOrderProofExample example);

    int deleteByPrimaryKey(String proofId);

    int insert(MyOrderProof record);

    int insertSelective(MyOrderProof record);

    List<MyOrderProof> selectByExample(MyOrderProofExample example);

    MyOrderProof selectByPrimaryKey(String proofId);

    int updateByExampleSelective(@Param("record") MyOrderProof record, @Param("example") MyOrderProofExample example);

    int updateByExample(@Param("record") MyOrderProof record, @Param("example") MyOrderProofExample example);

    int updateByPrimaryKeySelective(MyOrderProof record);

    int updateByPrimaryKey(MyOrderProof record);
}