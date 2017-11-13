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
    <link rel="stylesheet" type="text/css" href="${path}/pages/register/qm-experience.css"/>

</head>

<body>
<div class="experience">
    <div class="experience-title">申请体验</div>
    <div class="experience-cont-box">
        <div class="experience-cont experience1" id="experience">

            <div class="experience-inputbox">
                <span class="experience-span ">企业名称 :</span>
                <input id="company" onkeyup="Designation(this)" onblur="Designation(this)" placeholder="请输入您的企业名称"/>
                <i class="warn-text"></i>
            </div>
            <div class="experience-inputbox">
                <span class="experience-span ">真实姓名 :</span>
                <input type="text" id="contacts" onkeyup="indenxlogin.ChineseName(this)" onblur="indenxlogin.ChineseName(this)" placeholder="请输入您的姓名"/>
                <i class="warn-text"></i>
            </div>
            <div class="experience-inputbox">
                <span class="experience-span ">职　　务 :</span>
                <input type="text" id="position" onkeyup="indenxlogin.Designation(this)" onblur="indenxlogin.Designation(this)" placeholder="请输入您在公司的职务"/>
            </div>
            <div class="experience-inputbox">
                <span class="experience-span ">联系电话 :</span>
                <input type="text" id="phone" onkeyup="indenxlogin.phonenum(this)" onblur="indenxlogin.phonenum(this)" placeholder="请输入您的联系电话号码"/>
                <i class="warn-text"></i>
            </div>

        </div>

        <div class="experience-but1" id="experience-but2">
            <div class="experience-logging " onclick="loginpost.ExperienceSubmit(this)">提交申请</div>
            <div class="experience-logging" onclick="indenxlogin.IndexSkip()">返回</div>
        </div>
        <div class="experience-service">
            <a href="javascript:void(0)" onclick="indenxlogin.Service()">联系客服</a>
        </div>
    </div>
</div>
<!--提示框-->

<!--<div class="pop-box2" id="experiencesucceed" >-->
    <!--&lt;!&ndash;style="display: none;"&ndash;&gt;-->
    <!--<div class="pop-experience">-->
        <!--<div class="pop-experience-title">提示</div>-->
        <!--<div class="pop-experience-cont pop-experience-cont1">-->

            <!--您的信息已提交，我们会在12小时内给您回访，请稍等！-->
        <!--</div>-->
        <!--<div class="pop-experience-affirm">-->
            <!--<div class="pop-experience-right" onclick="Expopsuceed()">-->
                <!--确定-->
            <!--</div>-->
        <!--</div>-->
    <!--</div>-->
<!--</div>-->
</body>
<%--<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>--%>
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script src="${path}/script/js/myjs.js"></script>
</html>