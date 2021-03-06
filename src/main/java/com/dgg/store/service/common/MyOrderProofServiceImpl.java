package com.dgg.store.service.common;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.mapper.MyOrderMapper;
import com.dgg.store.mapper.MyOrderProofMapper;
import com.dgg.store.util.core.FilePathUtil;
import com.dgg.store.util.core.constant.*;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.pojo.MyOrderProof;
import com.dgg.store.util.pojo.MyOrderProofExample;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class MyOrderProofServiceImpl implements MyOrderProofService
{
    private final MyOrderProofMapper mapper;
    private final MyOrderMapper orderMapper;

    public MyOrderProofServiceImpl(MyOrderProofMapper mapper, MyOrderMapper orderMapper)
    {
        this.mapper = mapper;
        this.orderMapper = orderMapper;
    }

    @Override
    public String save(SessionVO sessionVO, String realPath, MyOrderProof proof, MultipartFile file)
    {
        if (orderMapper.selectByPrimaryKey(proof.getOrderId()) == null)
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        int result = 0;
        StringBuilder path = new StringBuilder();
        String fileName;

        proof.setProofId(IDGenerator.generator());
        proof.setProofUrl(Constant.EMPTY);
        if (ParameterUtil.objectIsNull(proof))
            return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_FAILED, sessionVO.getToken()));

        try
        {
            path.append(PathConstant.ORDER_PROOF_PATH).append(sessionVO.getUserId()).append(SymbolConstant.FORWARD_SLASH);
            realPath = FilePathUtil.getPrevPath(realPath, Constant.PATH_LEVEL);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, IDGenerator.generator());
            proof.setProofUrl(fileName);
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        updateOrderStatus(proof);
        result = mapper.insert(proof) > 0 ? Constant.REQUEST_SUCCESS : Constant.REQUEST_FAILED;

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken(), proof));
    }

    private void updateOrderStatus(MyOrderProof proof)
    {
        int status = mapper.getOrderStatus(proof.getOrderId());
        switch (status)
        {
            case OrderConstant.FINANCE_CHECK_FAIL_A:
                if (mapper.updateOrderStatus(proof.getOrderId(), OrderConstant.WAITING_FINANCE_CHECK_A) < 1)
                    throw new RuntimeException(Constant.STR_ADD_FAILED);
                break;
            case OrderConstant.FINANCE_CHECK_FAIL_B:
                if (mapper.updateOrderStatus(proof.getOrderId(), OrderConstant.WAITING_FINANCE_CHECK_A) < 1)
                    throw new RuntimeException(Constant.STR_ADD_FAILED);
                break;
            default:
                break;
        }
    }

    @Override
    public String list(SessionVO sessionVO, MyOrderProof proof)
    {
        MyOrderProofExample example = new MyOrderProofExample();
        MyOrderProofExample.Criteria criteria = example.createCriteria();

        criteria.andOrderIdEqualTo(proof.getOrderId());
        List<MyOrderProof> result = mapper.selectByExample(example);

        return JSONObject.toJSONString(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
    }

    @Override
    public String remove(SessionVO sessionVO, MyOrderProof proof)
    {
        int result = mapper.deleteByPrimaryKey(proof.getProofId()) < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS;

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken()));
    }
}
