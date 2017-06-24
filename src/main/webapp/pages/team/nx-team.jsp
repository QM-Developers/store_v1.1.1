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
    <link rel="stylesheet" href="${path}/script/zTree/zTreeStyle.css"/>
</head>
<body>
<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
                <button type="button" class="am-btn am-btn-default">创建部门</button>
                <button type="button" class="am-btn am-btn-default">添加人员</button>
                <button type="button" class="am-btn am-btn-default">企业设置</button>
                <button type="button" class="am-btn am-btn-default">组织结构</button>
                <button type="button" class="am-btn am-btn-default">职务权限</button>
            </div>
        </div>
    </div>
    <hr>
    <div class="am-u-sm-2">
        <ul id="type-tree" class="ztree"></ul>
    </div>
    <div class="am-u-sm-10">
        <table class="am-table">
            <thead>
            <tr>
                <th>部门</th>
                <th>姓名</th>
                <th>职务</th>
                <th>手机</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="attr-list"></tbody>
        </table>
    </div>
</div>
<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">Modal 标题
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
        </div>
        <div class="am-modal-bd">
            Modal 内容。本 Modal 无法通过遮罩层关闭。
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/zTree/jquery.ztree.all.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/pages/team/nx-team.js"></script>

<script type="text/javascript">
    nx_teamJS.init();
</script>
</html>
