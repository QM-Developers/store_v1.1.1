<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
    <script type="text/javascript">
        var path = "${path}";
        var basePath = "${basePath}";
        var urlParams = document.URL.split("?")[1];
    </script>
    <title>订单详情</title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" href="${path}/script/webuploader-0.1.5/webuploader.css">

    <link rel="stylesheet" type="text/css" href="${path}/pages/indent/qm-orderdetails.css"/>
</head>

<body>
<div class="bodybox opacity-box">
    <div class="header-title" id="headerBox">
        <div class="header-text">订单详情</div>
    </div>
    <div class="cont-1 " style="border-bottom: 1px solid #CCCCCC;">
        <span>收货信息 </span>
    </div>
    <div class="am-g cont-1">
        <div class="am-fl am-u-sm-6 cont-1-1">
            <span class="letter-spacing">收货客户 : </span><span id="contact"></span>
        </div>
        <div class="am-fl">
            <span>联系电话 : </span><span id="phone"></span>
        </div>
    </div>
    <div class="cont-1 ">
        <span>收货地址 : </span><span id="address"></span>
    </div>
    <div class="cont-1 " style="border-bottom: 1px solid #CCCCCC;">
        <span>订单信息  </span>
    </div>
    <div class="am-g cont-1">
        <div class="am-fl am-u-sm-6 cont-1-1">
            <span>订单编号 : </span><span id="orderNumber"></span>
        </div>
        <div class="am-fl ">
            <span>下单客户 :</span><span id="userName"></span>
        </div>

    </div>
    <div class="am-g cont-1">
        <div class="am-fl am-u-sm-6 cont-1-1">
            <span>付款方式 : </span><span id="paymentType"></span>
        </div>
        <div class="am-fl">
            <span>付款状态 : </span><span id="paymentStatus">未付款</span>
            <!--<span class="upload-proof">上传凭证</span>-->
        </div>
    </div>
    <div class="am-g cont-1">
        <div class="am-fl am-u-sm-6 cont-1-1">
            <span>运输费用 : </span><span id="freight">50元</span>
        </div>

    </div>
    <div class="am-g ">
        <div class="cont-1">商品列表 :</div>
        <table class="am-table " id="table">
            <tbody>
            <tr class="tr-bgcolor">
                <th>编号</th>
                <th>商品名称</th>
                <th>分类</th>
                <th>规格</th>
                <th>单价(元)</th>
                <th>数量/包</th>
                <th>款额/元</th>
            </tr>
            <%--<tr>--%>
            <%--<td>24681012</td>--%>
            <%--<td>米4T型4%小米牧场猪饲料</td>--%>
            <%--<td>饲料原料</td>--%>
            <%--<td>10kg/包</td>--%>
            <%--<td>150</td>--%>
            <%--<td>1000</td>--%>
            <%--<td>1000</td>--%>

            <%--</tr>--%>
            <%--<tr>--%>
            <%--<td>24681012</td>--%>
            <%--<td>米4T型4%小米牧场猪饲料</td>--%>
            <%--<td>饲料原料</td>--%>
            <%--<td>10kg/包</td>--%>
            <%--<td>150</td>--%>
            <%--<td>1000</td>--%>
            <%--<td>1000</td>--%>

            <%--</tr>--%>
            </tbody>
        </table>

    </div>
    <div class="cont-1 " style="padding-right: 20px; ">
        <span class="price-box" id="orderCount"></span><span class="price-box">合计总额 : </span>
    </div>

    <div class="am-g leave-message">
        <div class="am-fl left-text">买家留言 :</div>
        <textarea disabled class="am-u-sm-11 textarea" id="buyerMessage"></textarea>
    </div>
    <div class="am-g leave-message">
        <div class="am-fl left-text">商家留言 :</div>
        <textarea disabled class="am-u-sm-11 textarea" id="sellerMessage"></textarea>
    </div>

    <div class="container" id="container">
        <div class='header-text'>上传凭证 :</div>
        <ul class="imgul" id="gallery">
            <li class="span3">
                <div class="imgbox  certificate " id="certificate1" onmouseenter="qm_orderdetails.removeshow(this)"
                     onmouseleave="qm_orderdetails.removehidden(this)">

                </div>
            </li>
            <li class="span3">
                <div class="imgbox  certificate" id="certificate2" onmouseenter="qm_orderdetails.removeshow(this)"
                     onmouseleave="qm_orderdetails.removehidden(this)">

                </div>

            </li>
            <li class="span3">
                <div class="imgbox certificate" id="certificate3" onmouseenter="qm_orderdetails.removeshow(this)"
                     onmouseleave="qm_orderdetails.removehidden(this)">

                </div>
            </li>
            <li class="span3">
                <div class="imgbox  certificate " id="certificate4" onmouseenter="qm_orderdetails.removeshow(this)"
                     onmouseleave="qm_orderdetails.removehidden(this)">

                </div>
            </li>
            <li class="span3">
                <div class="imgbox  certificate" id="certificate5" onmouseenter="qm_orderdetails.removeshow(this)"
                     onmouseleave="qm_orderdetails.removehidden(this)">

                </div>
            </li>
            <li class="span3">
                <div class="imgbox  certificate" id="certificate6" onmouseenter="qm_orderdetails.removeshow(this)"
                     onmouseleave="qm_orderdetails.removehidden(this)">

                </div>
            </li>
        </ul>
    </div>
    <div class="dispose" id="dispose">
        <div class="header-title">
            <div class="header-text">处理方案</div>
        </div>
        <div class="cont-1 ">
            <span>订单状态 : </span><span id="orderstate"></span>
        </div>
    </div>
    <div class="am-g  data-del-off " id="but1">
        <div>
            <button class="del-but" onclick="javascript:history.back(-1)">返回</button>
        </div>
        <div id="shipments">
            <button class="del-but" >发货</button>
        </div>
        <div id="approve">
            <button class="del-but">确认订单</button>
        </div>
        <div id="repulse">
            <button class="del-but">拒绝</button>
        </div>
        <div id="ratify">
            <button class="del-but">同意</button>
        </div>
    </div>


</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<%--<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>--%>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/script/webuploader-0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/indent/qm-orderdetails.js"></script>
<script>
    qm_orderdetails.inint();
</script>
</html>

