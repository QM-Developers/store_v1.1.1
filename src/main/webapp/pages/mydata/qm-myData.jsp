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
    <title></title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/script/webuploader-0.1.5/webuploader.css">
    <link rel="stylesheet" type="text/css" href="${path}/pages/mydata/qm-myData.css"/>

</head>

<body>
<div class="bodybox data-body opacity-box">
    <div class="datainfo">
        <div class="qm-team">
            <div class="data-title">
                <h4 class="title-text">个人信息</h4>
            </div>
            <!--左-->
            <div class="data-top">
                <div class="data-info">
                    <div class=" data-input-box">
                        <span class="data-span">用户姓名 :</span><span class="data-span " id="userName"></span>
                    </div>
                    <div class=" data-input-box">
                        <span class="data-span">性　　别 :</span><span id="userSex" class="data-span"></span>
                    </div>
                    <div class=" data-input-box">
                        <span class="data-span">身份证号 :</span><span class="data-span" id="userIdentity"></span>
                    </div>
                    <div class=" data-input-box">
                        <span class="data-span">电话号码 :</span><span class="data-span" id="userPhone"></span>
                    </div>
                    <div class=" data-input-box">
                        <span class="data-span">所属公司 :</span><span class="data-span" id="myTeamName"></span>
                    </div>
                    <div class=" data-input-box">
                        <span class="data-span">所在部门 :</span><span class="data-span" id="teamDepartmentName"></span>
                    </div>
                    <div class=" data-input-box">
                        <span class="data-span">工作职位 :</span><span class="data-span" id="positionName"></span>
                    </div>
                </div>
                <div class="data-info">
                    <div class="alter-box">
                        <img class="alter-img" id="userImg" alt=""/>
                        <div class="alter-but" onclick="qm_myData.imgShow()">修改头像</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--个人-->

    <div class="qm-team">
        <div class="data-title">
            <h4 class="title-text">账号信息</h4>
        </div>
        <div class="data-top">
            <div class="data-info">
                <div class=" data-input-box">
                    <span class="data-span">企业账号:</span><span class="data-span" id="myTeamPhone"></span>
                </div>
                <div class=" data-input-box">
                    <span class="data-span">企业代码:</span><span class="data-span" id="myTeamId"></span>
                </div>
                <div class=" data-input-box">
                    <span class="data-password" onclick="qm_myData.pswShow()">修改密码</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--弹窗-->
<div class="shade-box" id='headimg'>
    <div class="header-img">
        <div class="img-up-box">
            <span class="img-up-span">修改头像:</span>
            <span class="img-up-but " id="uploadingBut">上传图片</span>
        </div>
        <p>支持jpg、png、尺寸为800*800，且小于1M</p>
        <div class="img-up-img filePicker" id="uploadingImg">
            <%--<div class="imgup-box">--%>
                <%--<img src="" alt="">--%>
            <%--</div>--%>
            <%--<div class="am-progress am-progress-striped am-progress-sm am-active ">--%>
                <%--<div class="am-progress-bar am-progress-bar-secondary" style="width: 57%"></div>--%>
            <%--</div>--%>
            <%--<div class="plan-bar"><span>上传图片-</span><span>90%</span></div>--%>
        </div>

        <div class="img-but-box">
            <span class="img-but" onclick="qm_myData.imgHidden()">确定</span>
        </div>
    </div>

</div>
<div class="shade-box" id="alterwindow">

    <div class="alter-window">
        <div class="window-title">修改密码</div>
        <div class="window-frame1">
            <div class=" data-input-box password-mark">
                <span class="data-span ">当前密码 :</span><input type="password" onpaste="return false;" onblur="qm_myData.pswVerify(this)"   placeholder="请输入当前密码"/>
                <i class="warn-text" id="psw-1"></i>
            </div>
            <div class=" data-input-box password-mark">
                <span class="data-span ">新的密码 :</span><input id="userPsw" type="password" onpaste="return false;" onblur="indenxlogin.PassWordNum(this)" placeholder="请输入新密码"/>
                <i class="warn-text" ></i>
            </div>
            <div class=" data-input-box password-mark">
                <span class="data-span ">确认密码 :</span><input type="password" onpaste="return false;" onblur="indenxlogin.RepetiPsw(this)" placeholder="请再次输入密码"/>
                <i class="warn-text" ></i>
            </div>
            <div class="data-input-radio">
                <label class="am-radio">
                    <a class="a-bg" href="javascript:void(0)" onclick="qm_myData.hideShowPsw(this)"></a><span>显示密码</span>
                </label>
            </div>
        </div>
        <div class="window-frame2">
            <div class="window-frame-right window-frame-left" onclick="qm_myData.windowHidde()">
                取消
            </div>
            <div class="window-frame-right" onclick="qm_myData.replacePswBut()">
                提交
            </div>
        </div>
    </div>
</div>
<%--<div class="password-box" id="alterselect">--%>
    <%--<div class="alter-select">--%>
        <%--<div class="pop-title">提示</div>--%>
        <%--<div class="pop-frame1">--%>
            <%--密码修改成功--%>
        <%--</div>--%>
        <%--<div class="pop-frame2">--%>
            <%--<div class="pop-frame-right" onclick="qm_myData.replacePsw()">--%>
                <%--确定--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script src="${path}/script/md5/md5.js"></script>
<script type="text/javascript" src="${path}/script/webuploader-0.1.5/webuploader.min.js"></script>
<script src="${path}/pages/common/regularandpop.js"></script>
<script src="${path}/pages/mydata/qm-myData.js"></script>
<script>
    qm_myData.inint();
</script>

<script type="text/javascript">


//    $(function ()
//    {
//        $('.header-img').mousedown(function (e)
//        {
//            var oEvent = e || event;
//            var disX = oEvent.clientX - parseInt($('.header-img').css('left'));
//            var disY = oEvent.clientY - parseInt($('.header-img').css('top'));
//            $('.password-box').mousemove(function (e)
//            {
//                var oEvent = e || event;
//                var $left = oEvent.clientX - disX + 'px';
//                var $top = oEvent.clientY - disY + 'px';
//
//                $('.header-img').css('left', $left)
//                $('.header-img').css('top', $top)
//            })
//            $('.password-box').mouseup(function ()
//            {
//                console.log('333')
//                $('.password-box').unbind()
//            })
//
//        })
//    })
</script>

</html>