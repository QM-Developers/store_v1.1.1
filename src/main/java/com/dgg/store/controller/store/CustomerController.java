package com.dgg.store.controller.store;

import com.dgg.store.service.store.CustomerService;
import com.dgg.store.util.core.constant.Constant;
import com.dgg.store.util.core.constant.SymbolConstant;
import com.dgg.store.util.pojo.CustomerAccountRequest;
import com.dgg.store.util.vo.core.PageVO;
import com.dgg.store.util.vo.core.SessionVO;
import com.dgg.store.util.vo.customer.CustomerRepertoryVO;
import com.dgg.store.util.vo.customer.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

/**
 * 客户信息控制器
 */
@Controller
public class CustomerController
{
    @Autowired
    private CustomerService service;

    /**
     * 客户建档
     *
     * @param customerVO 客户信息
     * @param request    用户参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/saveCustomerRecord", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveCustomerRecord(CustomerVO customerVO, HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCustomerRecord(customerVO, sessionVO);
    }

    /**
     * 获取客户列表
     *
     * @param request    用户参数
     * @param pageVO     分页参数
     * @param customerVO 客户类型
     * @return 客户列表
     */
    @RequestMapping(value = "/s/listCustomer", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCustomer(HttpServletRequest request, PageVO pageVO, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCustomer(sessionVO, pageVO, customerVO);
    }

    /**
     * 获取跟单员列表
     *
     * @param request    用户参数
     * @param customerVO 客户类型
     * @return 跟单员列表
     */
    @RequestMapping(value = "/s/listMerchandiser", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listMerchandiser(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listMerchandiser(sessionVO, customerVO);
    }

    /**
     * 获取业务员列表
     *
     * @param request 用户参数
     * @return 业务员列表
     */
    @RequestMapping(value = "/s/listPromoter", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listPromoter(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listPromoter(sessionVO);
    }

    /**
     * 获取审批人列表
     *
     * @param request 用户参数
     * @return 审批人列表
     */
    @RequestMapping(value = "/s/listAccountChecker", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listAccountChecker(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listAccountChecker(sessionVO);
    }

    /**
     * 修改客户
     *
     * @param request    用户参数
     * @param customerVO 客户信息
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCustomer", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomer(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomer(sessionVO, customerVO);
    }

    /**
     * 获取客户详情
     *
     * @param request    用户参数
     * @param customerVO 客户Id
     * @return 客户详情
     */
    @RequestMapping(value = "/s/getCustomer", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getCustomer(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getCustomer(sessionVO, customerVO);
    }

    /**
     * 上传身份证正面照片
     *
     * @param file       图片文件
     * @param request    用户参数
     * @param customerVO 客户Id
     * @return 文件的物理地址
     */
    @RequestMapping(value = "/s/saveFrontImage", method = POST)
    @ResponseBody
    public String saveFrontImage(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertFrontImage(sessionVO, file, request.getSession().getServletContext().getRealPath(SymbolConstant.SYSTEM_SLASH), customerVO);
    }

    /**
     * 上传身份证背面照片
     *
     * @param file       图片文件
     * @param request    用户参数
     * @param customerVO 客户Id
     * @return 文件的物理地址
     */
    @RequestMapping(value = "/s/saveBackImage", method = POST)
    @ResponseBody
    public String saveBackImage(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertBackImage(sessionVO, file, request.getSession().getServletContext().getRealPath(SymbolConstant.SYSTEM_SLASH), customerVO);
    }

    /**
     * 上传手持身份证照片
     *
     * @param file       图片文件
     * @param request    用户参数
     * @param customerVO 客户Id
     * @return 文件的物理地址
     */
    @RequestMapping(value = "/s/saveHandImage", method = POST)
    @ResponseBody
    public String saveHandImage(@RequestParam(value = "img", required = false) MultipartFile file, HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertHandImage(sessionVO, file, request.getSession().getServletContext().getRealPath(SymbolConstant.SYSTEM_SLASH), customerVO);
    }

    /**
     * 分配库存等级
     *
     * @param request   用户参数
     * @param repertory 客户类型和库存等级
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/saveRepertoryLevel", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveRepertoryLevel(HttpServletRequest request, CustomerRepertoryVO repertory)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertRepertoryLevel(sessionVO, repertory);
    }

    /**
     * 分配库存等级
     *
     * @param request   用户参数
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/listRepertoryLevel", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listRepertoryLevel(HttpServletRequest request)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listRepertoryLevel(sessionVO);
    }

    /**
     * 申请客户建账
     *
     * @param request        用户参数
     * @param accountRequest 申请信息
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/saveCustomerAccount", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveCustomerAccount(HttpServletRequest request, CustomerAccountRequest accountRequest)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.insertCustomerAccount(sessionVO, accountRequest);
    }

    /**
     * 同意客户建账
     *
     * @param request        用户参数
     * @param accountRequest 申请的Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCustomerAccountAccept", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomerAccountAccept(HttpServletRequest request, CustomerAccountRequest accountRequest)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomerAccountAccept(sessionVO, accountRequest);
    }

    /**
     * 获取建账申请
     *
     * @param request        用户参数
     * @param accountRequest 申请的Id
     * @return 建账申请详情
     */
    @RequestMapping(value = "/s/getCustomerAccount", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getCustomerAccount(HttpServletRequest request, CustomerAccountRequest accountRequest)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.getCustomerAccount(sessionVO, accountRequest);
    }

    /**
     * 拒绝客户建账
     *
     * @param request        用户参数
     * @param accountRequest 申请的Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCustomerAccountRefuse", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomerAccountRefuse(HttpServletRequest request, CustomerAccountRequest accountRequest)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomerAccountRefuse(sessionVO, accountRequest);
    }

    /**
     * 申请人获取建账申请列表
     *
     * @param request        用户参数
     * @param accountRequest (暂时没用到)
     * @return 建账申请列表
     */
    @RequestMapping(value = "/s/listCustomerAccountByProposer", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCustomerAccountByProposer(HttpServletRequest request, CustomerAccountRequest accountRequest)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCustomerAccountByProposer(sessionVO, accountRequest);
    }

    /**
     * 审批员获取建账申请列表
     *
     * @param request        用户参数
     * @param accountRequest 审批人的用户Id
     * @return 建账申请列表
     */
    @RequestMapping(value = "/s/listCustomerAccountByChecker", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String listCustomerAccountByChecker(HttpServletRequest request, CustomerAccountRequest accountRequest)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.listCustomerAccountByChecker(sessionVO, accountRequest);
    }

    /**
     * 业务员移交客户
     *
     * @param request    用户参数
     * @param customerVO 客户Id+新的业务员Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCustomerToPromoter", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomerToPromoter(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomerToPromoter(sessionVO, customerVO);
    }

    /**
     * 跟单员移交客户
     *
     * @param request    用户参数
     * @param customerVO 客户Id+新的跟单员Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCustomerToMerchandiser", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomerToMerchandiser(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomerToMerchandiser(sessionVO, customerVO);
    }

    /**
     * 冻结客户账号
     *
     * @param request    用户参数
     * @param customerVO 客户Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCustomerFreeze", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomerFreeze(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomerFreeze(sessionVO, customerVO);
    }

    /**
     * 解冻客户账号
     *
     * @param request    用户参数
     * @param customerVO 客户Id
     * @return 操作的结果
     */
    @RequestMapping(value = "/s/updateCustomerUnfreeze", method = POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String updateCustomerUnfreeze(HttpServletRequest request, CustomerVO customerVO)
    {
        SessionVO sessionVO = (SessionVO) request.getAttribute(Constant.LOGININFO);

        return service.updateCustomerUnfreeze(sessionVO, customerVO);
    }

    /**
     * 获取图片
     *
     * @param request  用户参数
     * @param response 请求响应
     */
    @RequestMapping(value = "/s/getCustomerIDCard", method = GET)
    public void getCustomerIDCard(HttpServletRequest request, HttpServletResponse response)
    {
        BufferedImage buffImg = null;
        ServletOutputStream sos = null;
        try
        {
            String path = request.getSession().getServletContext().getRealPath(SymbolConstant.SYSTEM_SLASH) + SymbolConstant.SYSTEM_SLASH + request.getParameter("path");
            File file = new File(path);
            if (!file.exists())
                return;
            buffImg = ImageIO.read(new FileInputStream(path));
            // 将四位数字的验证码保存到Session中。
            // 禁止图像缓存。
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType("image/jpeg");
            // 将图像输出到Servlet输出流中。
            sos = response.getOutputStream();
            ImageIO.write(buffImg, "jpeg", sos);
        } catch (IOException e)
        {
            e.printStackTrace();
        } finally
        {
            try
            {
                if (sos != null)
                    sos.close();
            } catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
}