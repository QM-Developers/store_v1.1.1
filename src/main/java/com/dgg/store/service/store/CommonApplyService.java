package com.dgg.store.service.store;

import com.dgg.store.util.pojo.CommonApply;
import com.dgg.store.util.pojo.CommonApplyApprove;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.web.multipart.MultipartFile;

public interface CommonApplyService
{
    String insertCommonApplyImage(SessionVO sessionVO, MultipartFile file, String realPath);

    String insertCommonApply(SessionVO sessionVO, CommonApply apply);

    String listCommonApplyByProposer(SessionVO sessionVO, PageVO pageVO);

    String listCommonApplyByApprove(SessionVO sessionVO, PageVO pageVO);

    String updateCommonApplyAccept(SessionVO sessionVO, CommonApplyApprove approve);

    String updateCommonApplyRefuse(SessionVO sessionVO, CommonApplyApprove approve);
}
