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
    <link rel="stylesheet" type="text/css" href="${path}/pages/indent/qm-salesReturn.css"/>
</head>

<body>
<div class="bodybox opacity-box">
    <div class="header-title" id="headerBox">
        <div class="header-text">订单详情</div>
    </div>
    <div class="cont-1 " >
        <span>订单编号 : </span><span id="number"></span>
    </div>
    <div class="am-g leave-message">
        <div class="am-fl left-text">退货原因 :</div>
        <textarea id="refundMessage" disabled class="am-u-sm-11 textarea" ></textarea>
    </div>

    <div class="am-g ">
        <div class="cont-1">退货清单 :</div>
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
            </tbody>
        </table>

    </div>
    <div class="cont-1 " style="padding-right: 20px; ">
        <span >合计总额 : </span><span  id="orderCount"></span>
    </div>
    <div class="cont-1 " style="padding-right: 20px; ">
        <span >申请时间 : </span><span  id="refundDate"></span>
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
        <div id="refundReceive">
            <button class="del-but" >确认收货</button>
        </div>
        <div id="refundPass">
            <button class="del-but">同意退货</button>
        </div>
        <div id="refundMoney">
            <button class="del-but">同意退款</button>
        </div>

    </div>


</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<%--<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>--%>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/indent/qm-salesReturn.js"></script>
<script>
    qm_salesReturn.inint();
</script>
</html>

