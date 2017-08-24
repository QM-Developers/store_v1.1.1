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
    </script>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/mall/goods/qm-typeSelect.css"/>

    <script type="text/javascript">
        var urlParams = document.URL.split("?")[1];
        console.log(urlParams,'a')
    </script>
</head>
<body>
<div class="admin-content bodybox">
    <div style="height: 90%" class="admin-content-body">
        <div class="am-cf  typetitle ">
            <div class="am-fl am-cf"><strong class=" am-text-lg">商品类目选择</strong></div>
        </div>
        <div class="contains">
            <div class="wareSort clearfix">
                <div id="type-list">
                </div>
            </div>
            <div class="selectedSort"><b>您当前选择的商品类别是：</b><i id="selectedSort"></i></div>
            <div class="wareSortBtn">
                <input id="releaseBtn" onclick="qm_type.toReleaseGoods();" type="button" value="下一步" disabled="disabled"/>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/UrlUtil.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>
<script type="text/javascript" src="${path}/pages/mall/goods/qm-typeSelect.js"></script>
<script type="text/javascript">
    qm_type.init();
</script>
</html>
