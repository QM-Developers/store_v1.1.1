package com.dgg.store.service.common;

import com.alibaba.fastjson.JSONObject;
import com.dgg.store.mapper.MyOrderProofMapper;
import com.dgg.store.util.core.FilePathUtil;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.KeyConstant;
import com.dgg.store.util.core.constant.PathConstant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.core.generator.IDGenerator;
import com.dgg.store.util.core.page.PagingUtil;
import com.dgg.store.util.core.parameter.ParameterUtil;
import com.dgg.store.util.core.upload.UploadFileUtil;
import com.dgg.store.util.pojo.MyOrderProof;
import com.dgg.store.util.pojo.MyOrderProofExample;
import com.dgg.store.util.vo.core.PageVO;
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

    public MyOrderProofServiceImpl(MyOrderProofMapper mapper)
    {
        this.mapper = mapper;
    }

    @Override
    public String save(SessionVO sessionVO, String realPath, MyOrderProof proof, MultipartFile file)
    {
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
            realPath = FilePathUtil.getPrevPath(realPath, 1);
            fileName = UploadFileUtil.doUpload(file, path.toString(), realPath, IDGenerator.generator());
            proof.setProofUrl(fileName);
            result = mapper.insert(proof) > 0 ? Constant.REQUEST_SUCCESS : Constant.REQUEST_FAILED;
        } catch (IOException e)
        {
            e.printStackTrace();
        }

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken(), proof.getProofUrl()));
    }

    @Override
    public String list(SessionVO sessionVO, MyOrderProof proof, PageVO pageVO)
    {
        MyOrderProofExample example = new MyOrderProofExample();
        MyOrderProofExample.Criteria criteria = example.createCriteria();

        example.setPageNum(PagingUtil.getStart(pageVO.getPageNum(), pageVO.getPageSize()));
        example.setPageSize(pageVO.getPageSize());
        criteria.andOrderIdEqualTo(proof.getOrderId());
        List<MyOrderProof> result = mapper.selectByExample(example);
        int pageCount = PagingUtil.getCount((int) mapper.countByExample(example), pageVO.getPageSize());

        JSONObject json = (JSONObject) JSONObject.toJSON(new ResultVO(Constant.REQUEST_SUCCESS, sessionVO.getToken(), result));
        json.put(KeyConstant.PAGE_COUNT, pageCount);

        return json.toJSONString();
    }

    @Override
    public String remove(SessionVO sessionVO, MyOrderProof proof)
    {
        int result = mapper.deleteByPrimaryKey(proof.getProofId()) < 1 ? Constant.REQUEST_FAILED : Constant.REQUEST_SUCCESS;

        return JSONObject.toJSONString(new ResultVO(result, sessionVO.getToken()));
    }
}
