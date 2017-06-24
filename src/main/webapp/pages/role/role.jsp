<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
    <link rel="stylesheet" href="${path}/script/zTree/zTreeStyle.css">
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>

    <script type="text/javascript">
        var path = "${path}";
    </script>

</head>
<body style="margin: auto;width: 80%;margin-top: 20px">

<div class="panel panel-default">
    <div class="panel-heading">角色管理
        <button class="am-btn am-btn-primary am-btn-sm" onclick="roleJS.roleWindow();">新建角色</button>
    </div>
    <div class="panel-body">
        <table class="am-table">
            <thead>
            <tr>
                <th>角色名称</th>
                <th>角色描述</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="role-list">
            </tbody>
        </table>
        <table class="table table-bordered table-hover">

        </table>
    </div>
</div>

<div class="am-popup" style="height: auto" id="permission-window">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">分配权限</h4>
            <span data-am-modal-close
                  class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <ul id="roleTree" class="ztree"></ul>
            <button type="button" onclick="roleJS.saveRolePermission();" class="am-btn am-btn-primary">保 存</button>
            <button type="button" class="am-btn am-btn-default" data-am-modal-close>取 消</button>
        </div>
    </div>
</div>

<div class="am-popup" style="height: auto" id="role-window">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">编辑角色</h4>
            <span data-am-modal-close
                  class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd am-form">
            <input type="text" id="roleName" class="form-control" placeholder="角色名称"/>
            <br/>
            <input type="text" id="roleText" class="form-control" placeholder="角色描述"/>
            <br/>
            <button type="button" onclick="roleJS.saveOrUpdateRole()" class="am-btn am-btn-primary">保 存</button>
            <button type="button" class="am-btn am-btn-default" data-am-modal-close>取 消</button>
        </div>
    </div>
</div>
<input hidden id="roleId"/>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/zTree/jquery.ztree.all.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>

<script type="text/javascript" src="${path}/pages/role/role.js"></script>

<script type="text/javascript">
    roleJS.init();
</script>

</html>
