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
    <%--<link rel="icon" type="image/png" href="${path}/script/Amaze/assets/i/favicon.png">--%>
    <%--<link rel="apple-touch-icon-precomposed" href="${path}/script/Amaze/assets/i/app-icon72x72@2x.png">--%>
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-index.css"/>

    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-managementLogin.css"/>
</head>
<body style="background:url(pages/images/manage-bg.jpg) no-repeat;">

<div class="opacity-box">
    <div class="Login">
        <div class="Login-title">登录管理系统</div>
        <div class="Login-cont">
            <span class="Login-hint">为了保护企业的数据安全，请再次输入密码</span>

            <img class="Login-img" src="${path}/pages/images/ceshi4.jpg"/>
            <span class="Login-name">路人甲</span>
            <hidden id="user-id" style="display: none">${sessionScope.loginInfo.userId}</hidden>
            <div class="Login-inputbox">
                <i class="Login-icon-username"></i>
                <input class="Login-input" readonly value="${sessionScope.loginInfo.userPhone.concat("@").concat(sessionScope.loginInfo.myTeamId)}" onfocus="qm_login.focus()" placeholder="请输入登录账号"/>
            </div>
            <div class="Login-inputbox">
                <i class="Login-icon-password"></i>
                <input class="Login-input" value="dggadmin" onkeypress="if(event.keyCode==13) qm_login.login()" type="password" id="user-password" onfocus="qm_login.focus()" placeholder="请输入登录密码"/>
                <span class="psw-hint" id="hint-text"></span>
            </div>
            <div class="Login-inputbox">
                <button type="submit" class="Login-logging" onclick="qm_login.login()">登录</button>
            </div>
            <div class="Login-bottom">
                暂时不想登录了
                <a class="Login-off" onclick="window.close();">关闭</a>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/md5/md5.min.js"></script>
<script type="text/javascript" src="${path}/pages/management/qm-managementLogin.js">

</script>

</html>