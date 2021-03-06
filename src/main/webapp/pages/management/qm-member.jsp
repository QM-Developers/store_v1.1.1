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
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" href="${path}/script/webuploader-0.1.5/webuploader.css">
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-member.css"/>

    <script type="text/javascript">
        var userId = document.URL.split("?")[1];
    </script>
</head>

<body class="bodybox opacity-box">
<%--<div class=" department-header ">--%>
<%--<!--头部容器-->--%>
<%--<div class=" department-header-left">--%>
<%--<button class="department-but1"><a href="qm-departments.jsp">添加部门</a></button>--%>
<%--<button class="department-but1"><a href="qm-member.jsp">添加成员</a></button>--%>
<%--</div>--%>
<%--</div>--%>
<div class="qm-team newdata" id="Personal">
    <div class="groupdata-title">
        <div class="header-title">添加成员</div>
    </div>
    <div class="member-title">
        基本信息
    </div>
    <div class="am-g " style="padding-left: 37px;">
        <div class="am-u-sm-10 ">
            <div class="qm-team-input ">
                <span>姓　　名 : </span><input id="user-name" class=" am-u-sm-4 am-u-end sign_input"/>
            </div>
            <div class="qm-team-input">
                <span>性　　别 : </span>
                <!--poptwo-c-lia1-->
                <div class="pop-div2 sex" id="user-sex">
                    <a href="###" name="male" onclick="qm_member.PopInput(this)" class="poptwo-c-lia man poptwo-c-lia1">男</a>
                    <a href="###" onclick="qm_member.PopInput(this)" name="woman" class="poptwo-c-lia woman">女</a>
                </div>
            </div>
            <div class="qm-team-input">
                <span>手机号码 : </span>
                <input id="user-phone" class="sign_input" maxlength="11" onkeyup="indenxlogin.inputVal(this)"
                       contentEditable="indenxlogin.inputVal(this)" onblur="indenxlogin.inputVal
(this)"/>

            </div>
            <div class="qm-team-input">
                <span>身份证号 : </span>
                <input id="user-identity" class="sign_input" maxlength="18" onkeyup="indenxlogin.inputVal(this)"
                       contentEditable="indenxlogin.inputVal(this)" onblur="indenxlogin.inputVal
(this)"/>
            </div>
            <div class="qm-team-input">
                <span>所属部门 : </span>
                <div class="qm-team-div">
                    <select id="department-list" onchange="qm_member.findPositionList(value)"
                            style="height: 100%;"></select>
                </div>
            </div>
            <div class="qm-team-input">
                <span>工作职位 : </span>
                <div class="qm-team-div">
                    <select id="position-list"></select>
                </div>
            </div>
            <hidden id="permission"/>
        </div>
    </div>
    <div class="am-g" style="padding-left: 37px;">
        <div class="member-title-right" onclick="qm_member.permissionWindow(this)">个人权限</div>
    </div>
</div>
<!--上传身份证-->
<div class="qm-team identity-card newdata" id="identity-card">
    <div class="am-u-sm-12 newdata-picture-box">
        <div class="groupdata-title-1">
            <div>身份证照片 :</div>
        </div>
        <div class="newdata-picture">
            <div onmouseenter="Imgon(this)" style="display: none" onmouseleave="Imgout(this)" class="img-cont-box">
                <span class="clickoff" onclick="qm_member.removeImage(this,'front');">X</span>
                <img src="" id="img-card-front"/>
                <div class="am-progress add-progress am-progress-striped">
                    <div class="am-progress-bar am-progress-bar-secondary"></div>
                </div>
            </div>

            <i class="newdata-picture-i" id="btn-card-front"><i class="picture-i-bg"></i></i>
            <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
        </div>
        <div class="newdata-picture">
            <div onmouseenter="Imgon(this)" style="display: none;" onmouseleave="Imgout(this)" class="img-cont-box">
                <span class="clickoff" onclick="qm_member.removeImage(this,'back');">X</span>
                <img src="" id="img-card-back"/>
                <div class="am-progress add-progress am-progress-striped">
                    <div class="am-progress-bar am-progress-bar-secondary"></div>
                </div>
            </div>
            <i class="newdata-picture-i" id="btn-card-back"><i class="picture-i-bg"></i></i>
            <div class="plan-bar"><span>上传图片-</span><span>90%</span></div>
        </div>
    </div>
</div>
<div class="del-but-box">
    <button class="del-but" style="color: red; display: none;" onclick="qm_member.deleteMember();">删除</button>
    <button class="del-but" onclick="javascript:history.back(-1)">返回</button>
    <button class="del-but" onclick="qm_member.saveOrUpdateMember();">提交</button>
</div>
<!--权限-->
<div class="duty-box duty-Power">
    <div class="duty-one duty-one1 ">
        <div class="duty-frame1 duty-one2">
            <div>
                <table class="am-table">
                    <thead>
                    <tr style="background: #f7f7f7;">
                        <th class="duty-rights-1">角色选择</th>
                        <th class="duty-rights-3">角色描述</th>
                    </tr>
                    </thead>
                    <tbody id="personal-permission"></tbody>
                </table>
            </div>
        </div>
        <div class="duty-frame2 duty-Power">
            <div class="duty-frame-but" onclick="Dutyoff()">
                关闭
            </div>
            <div class="duty-frame-but" onclick="qm_member.permissionClick()">
                确定
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/webuploader-0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<%--<script type="text/javascript" src="${path}/pages/common/control.js"></script>--%>
<script type="text/javascript" src="${path}/pages/common/Constant.js"></script>

<script type="text/javascript">
    dutyshow = function ()
    {
        $(".duty-Power").css("display", "block")
    }
    Dutyoff = function ()
    {
        $(".duty-Power").css("display", "none")
    }
    Imgon = function (item)
    {
        $(item).find('.clickoff').css('display', 'block')
    }
    Imgout = function (item)
    {
        $(item).find('.clickoff').css('display', 'none')
    }
    clickoff = function (item)
    {
        $(item).parents('.img-cont-box').css('display', 'none');
    }
    clickon = function (item)
    {
        $(item).parents('.img-cont-box').css('display', 'block');
    }
</script>

<script type="text/javascript" src="${path}/pages/management/qm-member.js"></script>
<script type="text/javascript">
    qm_member.init();
</script>
</html>