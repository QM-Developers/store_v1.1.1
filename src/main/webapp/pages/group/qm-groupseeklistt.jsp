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
    <link rel="stylesheet" type="text/css" href="${path}/pages/group/qm-groupseeklistt.css"/>
</head>


<body>
<div class="bodybox">
    <div class="qm-header">
        <!--头部-->
    </div>
    <div class=" qm-team1">

        <div class="qm-list">你搜索的是：<span>吕大</span></div>

        <div class=" qm-team1-box">
            <table class="am-table ">
                <thead>
                <tr>
                    <th>成员名称</th>
                    <th>性别</th>
                    <th>联系电话</th>
                    <th>部门</th>
                    <th>职位</th>
                    <th>操作区</th>
                </tr>
                </thead>
                <tbody id="result-list"></tbody>
            </table>
        </div>
    </div>
    <div class=" data-del-off ">
        <div>
            <button class="del-but" onClick="javascript :history.back(-1);">返回</button>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/control.js"></script>
<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>

<script type="text/javascript" src="${path}/pages/group/qm-groupseeklistt.js"></script>
<script type="text/javascript">
    qm_groupseeklist.init();
</script>

</html>