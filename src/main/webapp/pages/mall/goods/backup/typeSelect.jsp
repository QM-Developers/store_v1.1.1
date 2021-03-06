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

    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${path}/pages/mall/goods/backup/typeSelect.css"/>
</head>
<body>
<div class="admin-content">
    <div style="height: 90%" class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">请选择商品类目</strong></div>
        </div>
        <hr/>
        <div class="contains">
            <div class="wareSort clearfix">
                <div id="type-list">
                </div>
            </div>
            <div class="selectedSort"><b>您当前选择的商品类别是：</b><i id="selectedSort"></i></div>
            <div class="wareSortBtn">
                <input id="releaseBtn" onclick="tpSelJS.toReleaseGoods();" type="button" value="下一步" disabled="disabled"/>
            </div>
        </div>
    </div>

    <footer class="admin-content-footer">
        <hr>
        <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>

<script type="text/javascript" src="${path}/pages/mall/goods/backup/typeSelect.js"></script>
<script type="text/javascript">
    tpSelJS.init();
</script>

</html>
