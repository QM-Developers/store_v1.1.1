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
        var urlParams = document.URL.split("?")[1];
    </script>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/register/qm-forgetpassword.css"/>

</head>

<body>
<div class="forgetpassword">
    <div class="forgetpassword-title">密码找回</div>
    <div class="forgetpassword-cont-box">
        <div class="forgetpassword-cont forgetpassword1" id="forgetpassword1">

            <div class="forgetpassword-inputbox">
                <span class="forgetpassword-span ">手机账号 :</span>
                <input type="" id="Forgetphone" onblur="indenxlogin.phonenum(this)" onkeyup="indenxlogin.phonenum(this)"
                       placeholder="请输入手机号码"/>
                <i class="warn-text"></i>
            </div>
            <div class="forgetpassword-inputbox">
                <span class="forgetpassword-span ">企业号码 :</span>
                <input type="text" id="Forgetmyteam" onblur="indenxlogin.MyTeamId(this)"
                       onkeyup="indenxlogin.MyTeamId(this)"
                       placeholder="请输入企业号码"/>
                <i class="warn-text"></i>
            </div>
            <div class="forgetpassword-inputbox">
                <span class="forgetpassword-span ">手机验证 :</span>
                <div class="verify-phone-box">
                    <input type="text" id="ForgetVerify" onkeyup="indenxlogin.Verifylenght(this)"
                           onblur="indenxlogin.Verifylenght(this)" placeholder="请输入验证码"/>
                    <i class="warn-text"></i>
                    <button class="verify-phone-text" onclick="loginpost.ForgetVerifyPhone(this)">获取验证码</button>
                </div>
            </div>

        </div>
        <!--第2-->
        <div class="forgetpassword-cont forgetpassword2" id="forgetpassword2">

            <div class="forgetpassword-inputbox">
                <span class="forgetpassword-span ">设置密码 :</span>
                <input type="password" name="pswname" onblur="indenxlogin.PassWordNum(this)"
                       onkeyup="indenxlogin.PassWordNum(this)" id="setpassword" placeholder="6到32位号码包括数字和字母"/>
            </div>
            <div class="forgetpassword-inputbox">
                <span class="forgetpassword-span ">确认密码 :</span>
                <input type="password" name="pswname" onblur="indenxlogin.RepetiPsw(this)"
                       onkeyup="indenxlogin.RepetiPsw(this)" id="setagainpassword" placeholder="请再次输入密码"/>
            </div>
            <div class="forgetpassword-inputbox">

            </div>
            <div class="forgetpassword-inputbox">

            </div>
            <div class="forgetpassword-label">
                <label class="am-radio">
                    <a class="a-bg" id="Pswtype" href="javascript:void(0)"
                       onclick="indenxlogin.PswType(this)"></a><span>显示密码</span>
                </label>
            </div>

        </div>
        <div class="forgetpassword-but1" id="forgetpassword-but1">
            <div class="forgetpassword-logging" onclick="loginpost.ForgetNextStep(this)">下一步</div>
            <div class="forgetpassword-logging" onClick="indenxlogin.IndexSkip()">返回</div>

        </div>
        <div class="forgetpassword-but1 forgetpassword-but2" id="forgetpassword-but2">
            <div class="forgetpassword-logging " onclick="loginpost.ForgetSubmit()">提交</div>
            <div class="forgetpassword-logging" onclick="loginpost.ForgetGoBack(this)">返回</div>
        </div>
        <div class="forgetpassword-service">
            <a href="javascript:void(0)" onclick="indenxlogin.Service()">联系客服</a>
        </div>
    </div>
</div>

</body>
<%--<script src="../../script/jquery/jquery-3.0.0.min.js"></script>--%>
<script src="../../script/Amaze/assets/js/amazeui.min.js"></script>


</html>