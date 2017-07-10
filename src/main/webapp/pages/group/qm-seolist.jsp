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
    <link rel="stylesheet" type="text/css" href="${path}/pages/gorup/qm-seolist.css"/>
</head>

<body>
<div class="bodybox">
    <div class=" qm-header">
    </div>
    <div class="qm-c-list companylist" id="companylist">
        <div class="qm-c-company ">
            <h4 class="qm-c-p">搜索结果列表</h4>

            <ul class="qm-c-ul">
                <li class="qm-c-li">青麦科技</li>
                <li class="qm-c-li">青麦科技</li>
                <li class="qm-c-li">青麦科技</li>
                <li class="qm-c-li">青麦科技</li>
                <li class="qm-c-li">青麦科技</li>
            </ul>
        </div>
        <div class="paging">
            <div class="pagingright">
                下一页
            </div>
            <div class="pagingmodle">
                <span>1</span>/<span>4</span>
            </div>
            <div class="pagingleft">
                上一页
            </div>
        </div>
    </div>
    <div class="am-g">
        <div class="del-but-box">
            <button class="del-but">返回</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
</html>