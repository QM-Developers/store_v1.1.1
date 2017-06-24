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

    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css">
</head>
<body>

<div class="admin-content">
    <div class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户注册</strong> /
                <small>Register</small>
            </div>
        </div>

        <hr/>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
            </div>

            <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
                <div class="am-form am-form-horizontal">

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">电　　话</label>
                        <div class="am-u-sm-9">
                            <input type="tel" id="userPhone" placeholder="输入你的电话号码">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">密　　码</label>
                        <div class="am-u-sm-9">
                            <input type="password" id="userPassword" placeholder="输入你登录密码">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">确认密码</label>
                        <div class="am-u-sm-9">
                            <input type="password" placeholder="再次输入登录密码">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label class="am-u-sm-3 am-form-label">企&nbsp;&nbsp;业&nbsp;&nbsp;码</label>
                        <div class="am-u-sm-9">
                            <input type="number" id="myTeamId" pattern="[0-9]*" placeholder="输入你的企业码">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <button type="button" onclick="registerJS.register();" class="am-btn am-btn-primary">确定注册
                            </button>
                            <a href="login.jsp" type="button" class="am-btn am-btn-default">返回登录</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/md5/md5.min.js"></script>

<script type="text/javascript" src="${path}/pages/register/register.js"></script>
</html>
