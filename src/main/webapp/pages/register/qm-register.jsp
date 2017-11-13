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
	<link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css" />
	<link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/pages/register/qm-register.css" />

</head>

<body>
<div class="register">
	<div class="register-title">账号激活</div>
	<div class="register-cont-box">
		<div class="register-cont register1" id="register1">

			<div class="register-inputbox">
				<span class="register-span ">用户账号 :</span>
				<input  onkeyup="indenxlogin.phonenum(this)" onblur="indenxlogin.phonenum(this)" id="userPhone" placeholder="请输入手机号码" />
				<i class="warn-text"></i>
			</div>
			<div class="register-inputbox">
				<span class="register-span ">企业号码 :</span>
				<input type="text" onkeyup="indenxlogin.MyTeamId(this)" onblur="indenxlogin.MyTeamId(this)" id="myTeamId" placeholder="请输入企业号码" />
				<i class="warn-text"></i>
			</div>
			<div class="register-inputbox">
				<span class="register-span ">手机验证 :</span>
				<div class="verify-phone-box">
					<input type="text" onkeyup="indenxlogin.Verifylenght(this)" onblur="indenxlogin.Verifylenght(this)" id="verify" placeholder="请输入验证码" />
					<i class="warn-text"></i>
					<button class="verify-phone-text" onclick="loginpost.RegisterVerifyPhone(this)">获取验证码</button>
				</div>
			</div>

		</div>
		<!--第2-->
		<div class="register-cont register2" id="register2">
			<div class="register-inputbox">
				<span class="register-span ">用户名称 :</span>
				<input id="RegisteruserName" type="text" disabled="disabled" />

			</div>
			<div class="register-inputbox">
				<span class="register-span ">用户账号 :</span>
				<input id="resultuserPhone" type="text" disabled="disabled" />
			</div>
			<div class="register-inputbox">
				<span class="register-span ">输入密码 :</span>
				<input onkeyup="indenxlogin.PassWordNum(this)" onblur="indenxlogin.PassWordNum(this)" type="password" id="userPassword" name="pswname" placeholder="6到32位号码包括数字和字母" />
				<i class="warn-text"></i>
			</div>
			<div class="register-inputbox">
				<span class="register-span ">确认密码 :</span>
				<input onkeyup="indenxlogin.RepetiPsw(this)" onblur="indenxlogin.RepetiPsw(this)" type="password" id="confirmpassword" name="pswname" placeholder="请再次输入密码" />
				<i class="warn-text"></i>
			</div>
			<div class="register-label">
				<label class="am-radio">
					<a class="a-bg"  onclick="indenxlogin.PswType(this)"></a><span>显示密码</span>
				</label>
			</div>

		</div>
		<div class="register-but1" id="register-but1">
			<div class="register-logging" onclick="loginpost.RegisterNextStep(this)">下一步</div>
			<div class="register-logging" onclick="indenxlogin.IndexSkip()">返回</div>
		</div>
		<div class="register-but1 register-but2" id="register-but2">
			<div class="register-logging " onclick="loginpost.RegisterSubmit()">提交</div>
			<div class="register-logging" onclick="loginpost.RegisterGoBack(this)">返回</div>
		</div>
		<div class="register-service">
			<a onclick="indenxlogin.IndexSkip()" >直接登录</a>
			<a  onclick="indenxlogin.Service()">联系客服</a>
		</div>
	</div>
</div>

</body>
<%--<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>--%>
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>


</html>