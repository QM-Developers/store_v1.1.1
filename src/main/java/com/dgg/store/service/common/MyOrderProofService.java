package com.dgg.store.service.common;

import com.dgg.store.util.pojo.MyOrderProof;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.web.multipart.MultipartFile;

public interface MyOrderProofService
{
    String save(SessionVO sessionVO, String realPath, MyOrderProof proof, MultipartFile file);

    String list(SessionVO sessionVO, MyOrderProof proof);

    String remove(SessionVO sessionVO, MyOrderProof proof);
}
