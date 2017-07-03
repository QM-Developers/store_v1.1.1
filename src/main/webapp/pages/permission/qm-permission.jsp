<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${path}/script/zTree/zTreeStyle.css">

    <script type="text/javascript">
        var path = "${path}";
    </script>

</head>
<body style="margin: auto;width: 80%;margin-top: 20px">
<div class="am-panel am-panel-default">
    <div class="am-panel-hd">权限信息
        <button onclick="permissionJS.addPermission();" class="am-btn am-btn-primary am-btn-xs">添加权限</button>
        <button onclick="permissionJS.delPermission();" class="am-btn am-btn-default am-btn-xs">删除权限</button>
    </div>
    <div class="am-panel-bd">
        <div class="panel-body" style="height: 70%">
            <div class="am-u-md-2">
                <ul id="permissionTree" class="ztree"></ul>
            </div>
            <div class="am-u-md-5 am-form am-u-end">
                <input type="text" id="permissionName" placeholder="权限名称">
                <br/>
                <input type="text" id="permissionUrl" placeholder="操作地址">
                <br/>
                <div>上级权限
                    <select id="permissionPid" class="form-control"></select>
                </div>
                <br/>
                <div class="">
                    <button type="button" onclick="permissionJS.saveOrUpdatePermission()" class="am-btn am-btn-primary am-btn-sm">保 存
                    </button>
                    <button type="button" class="am-btn am-btn-default am-btn-sm">取 消</button>
                </div>
                <hidden id="permissionId" value=""></hidden>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/zTree/jquery.ztree.all.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>

<script type="text/javascript" src="${path}/pages/permission/permission.js"></script>

<script type="text/javascript">
    permissionJS.initTree();
</script>
</html>
