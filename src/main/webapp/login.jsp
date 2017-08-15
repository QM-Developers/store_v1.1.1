<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Login Page | Amaze UI Example</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="alternate icon" type="image/png" href="${path}/script/Amaze/assets/i/favicon.png">
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>

    <script type="text/javascript">
        var path = "${path}";
        var basePath = "${basePath}";
    </script>

    <script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${path}/script/md5/md5.min.js"></script>
    <script type="text/javascript" src="${path}/script/js/myjs.js"></script>
    <script type="text/javascript" src="${path}/pages/login/login.js"></script>

    <script type="text/javascript" src="${path}/pages/mall/goods/qm-url-params.js"></script>
    <script type="text/javascript" src="${path}/script/js/UrlUtil.js"></script>

    <style>
        .header {
            text-align: center;
        }

        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }

        .header p {
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="am-g">
        <h1>Web ide</h1>
        <p>Integrated Development Environment<br/>代码编辑，代码生成，界面设计，调试，编译</p>
    </div>
    <hr/>
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3>登录</h3>
        <hr>
        <div class="am-btn-group">
            <a href="###" class="am-btn am-btn-secondary am-btn-sm"><i class="am-icon-github am-icon-sm"></i> Github</a>
            <a href="###" class="am-btn am-btn-success am-btn-sm"><i class="am-icon-google-plus-square am-icon-sm"></i>
                Google+</a>
            <a href="###" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-stack-overflow am-icon-sm"></i>
                stackOverflow</a>
        </div>
        <br>
        <br>

        <div class="am-form">
            <label>手机号:</label>
            <input onkeypress="if(event.keyCode==13) login.login();" id="userPhone" value="13688888888" type="text">
            <br>
            <label>密 码:</label>
            <input onkeypress="if(event.keyCode==13) login.login();" id="userPassword" value="dggadmin" type="password">
            <br>
            <label>企业码:</label>
            <input onkeypress="if(event.keyCode==13) login.login();" id="myTeamId" value="10001" type="text">
            <br>
            <div class="am-cf">
                <input type="button" onclick="login.login();" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
                <a href="register.jsp" class="am-btn am-btn-default am-btn-sm am-fl">注 册</a>
                <input type="button" onclick="login.test();" value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr">
            </div>
        </div>
        <hr>
        <p>© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </div>
</div>
</body>
</html>
