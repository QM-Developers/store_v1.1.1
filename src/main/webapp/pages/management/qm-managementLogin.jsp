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
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-managementLogin.css"/>

</head>

<body style="background:url(../images/manage-bg.jpg) no-repeat;">
<div class="opacity-box">
    <div class="Login">
        <div class="Login-title">登录管理系统</div>
        <div class="Login-cont">
            <span class="Login-hint">为了保护企业的数据安全，请再次输入密码</span>

            <img class="Login-img" src="../../images/ceshi4.jpg"/>
            <span class="Login-name">路人甲</span>

            <div class="Login-inputbox">
                <i class="Login-icon-username"></i>
                <input class="Login-input" placeholder="请输入登录账号"/>
            </div>
            <div class="Login-inputbox">
                <i class="Login-icon-password"></i>
                <input class="Login-input" placeholder="请输入登录密码"/>
                <span class="psw-hint">密码错误</span>
            </div>
            <div class="Login-inputbox">
                <div class="Login-logging">登录</div>
            </div>
            <div class="Login-bottom">
                暂时不想登录了
                <a class="Login-off" onclick="window.close();">关闭</a>
            </div>
        </div>
    </div>
</div>

</body>

</html>