package com.dgg.store.service.store;


import com.dgg.store.util.pojo.GoodsTypeAttr;
import com.dgg.store.util.pojo.GoodsTypeinfo;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.goods.GoodsInfoVO;
import com.dgg.store.util.vo.core.ResultVO;
import com.dgg.store.util.vo.core.SessionVO;
import org.springframework.web.multipart.MultipartFile;

public interface GoodsManageService
{
    String insertGoodsinfo(SessionVO sessionVO, GoodsInfoVO goodsinfo);

    String findTypeAndParents(SessionVO sessionVO, GoodsTypeinfo typeinfo);

    ResultVO findTypeAttr(SessionVO sessionVO, GoodsTypeAttr typeAttr);

    ResultVO insertImgToSpace(SessionVO sessionVO, MultipartFile file);

    String findImages(SessionVO sessionVO);

    String findGoodsList(SessionVO sessionVO, PageVO pageVO);

    String findGoodsInfo(SessionVO sessionVO, GoodsInfoVO infoVO);

    String findGoodsDescribe(SessionVO sessionVO, GoodsInfoVO infoVO);

    String updateGoods(SessionVO sessionVO, GoodsInfoVO goodsInfo);

    ResultVO deleteGoods(SessionVO sessionVO, GoodsInfoVO goodsInfo);

    String findGoodsListByKeyword(SessionVO sessionVO, GoodsInfoVO goodsInfo, PageVO pageVO);

    String findGoodsTypeByPid(SessionVO sessionVO, GoodsTypeinfo typeinfo);
}
