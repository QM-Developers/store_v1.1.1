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
		<link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css">
		<link rel="stylesheet" type="text/css" href="${path}/pages/register/qm-changepassword.css" />

	</head>

	<body>
		<div class="change">
			<div class="change-title">修改密码</div>
			<div class="change-cont-box">
				<div class="change-cont change1" id="change1">

					<div class="change-inputbox">
						<span class="change-span ">手机号码 :</span>
						<input type="text" id="changeusername" onclick="indenxlogin.phonenum(this)" onkeyup="indenxlogin.phonenum(this)" placeholder="请输入手机号码" />
						<i class="warn-text"></i>
					</div>
					<div class="change-inputbox">
						<span class="change-span ">企业号码 :</span>
						<input type="text" id="changemyteam" onclick="indenxlogin.MyTeamId(this)" onkeyup="indenxlogin.MyTeamId(this)" placeholder="请输入企业号码" />
						<i class="warn-text"></i>
					</div>
					<div class="change-inputbox">
						<span class="change-span ">原始密码 :</span>
						<input type="password" id="changepassword" onkeyup="indenxlogin.PassWordNum(this)" onclick="indenxlogin.PassWordNum()" placeholder="旧密码验证" />
						<i class="warn-text"></i>
					</div>
					<div class="change-input-radio">

					</div>

				</div>
				<div class="change-cont change2" id="change2">

					<div class="change-inputbox">
						<span class="change-span ">新的密码 :</span>
						<input type="text" placeholder="设置新的密码" />
						<i class="warn-text"></i>
					</div>
					<div class="change-inputbox">
						<span class="change-span ">确认密码 :</span>
						<input type="text" placeholder="确认新的密码" />
						<i class="warn-text"></i>
					</div>
					<div class="change-label">
						<label class="am-radio">
                             <a class="a-bg" href="javascript:void(0)" onclick="indenxlogin.PswType(this)"></a><span>显示密码</span>
                        </label>
					</div>

				</div>
				<div class="change-but1" id="change-but1">
					<div class="change-logging" onclick="ChangeNextSubmit(this)">下一步</div>
					<div class="change-logging" onClick="indenxlogin.IndexSkip()">返回</div>

				</div>
				<div class="change-but1 change-but2" id="change-but2">
					<div class="change-logging " onclick="ChangeNextSubmit()">确认修改</div>
					<div class="change-logging" onclick="ChangeGoBack(this)">返回</div>
				</div>
				<div class="change-service">
					<a href="javascript:void(0)" onclick="location.href = '../index/qm-indexLogin.jsp' ">直接登录</a>
					<a href="javascript:void(0)" onclick="indenxlogin.Service()">联系客服</a>
				</div>

			</div>
		</div>
		<!--提示框-->
		<!--<div class="pop-box1" id="changesucceed">-->
			<!--<div class="pop-select">-->
				<!--<div class="pop-title">提示</div>-->
				<!--<div class="pop-frame-cont">-->
					<!--密码修改成功-->
				<!--</div>-->
				<!--<div class="pop-frame-affirm">-->
					<!--<div class="pop-frame-right" onclick="ChangeSucceed()">-->
						<!--确定-->
					<!--</div>-->
				<!--</div>-->
			<!--</div>-->
		<!--</div>-->
	</body>
	<%--<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>--%>
	<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
	<script type="text/javascript">

        ChangeNextStep=function(item){
			//下一步
		$(item).parents('.change-cont-box').find('#change1').css('display','none').next().css('display','block')	;
		 $(item).parents('.change-but1').css('display','none').next().css('display','block');
		}
        ChangeGoBack=function(item){
			//返回
		 $(item).parents('.change-cont-box').find('#change2').css('display','none').prev().css('display','block')	;
		 $(item).parents('.change-but1').css('display','none').prev().css('display','block');

		};

        ChangeNextSubmit=function (item)
        {
            var self = item;
            var titletext = '提示';
            var conttext ='信息错误，请核对信息';
            var fnclick = 'ErrorpopRemove(this)';
            var buttext = '确定';
            console.log(usename_val)
            console.log(myTeamId_val)
            console.log(password_val)
            if(indenxlogin.usename_val && indenxlogin.myteamid_val && indenxlogin.password_val) {
                var url = "http://localhost:8088/store/.action";
                var params = {};
                params["verify"] = $('#changeusername').val();
                params["userPhone"] = $('#changemyteam').val();
                params["myTeamId"] =md5($('#changepassword').val());
                myjs.ajax_post(url, params, function(data, status) {
                    if(status =='success') {
                        var state = data.state;
                        var data = data.result;
                        if(state == 1) {
                            ChangeNextStep(self);
                        }
                    }
                })
            } else {
                indenxlogin.Errorpopone(titletext,conttext,fnclick,buttext)
                return false;
            }
        }
	</script>

</html>