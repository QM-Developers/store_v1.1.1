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
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link rel="icon" type="image/png" href="${path}/script/Amaze/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${path}/script/Amaze/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.css"/>
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${path}/pages/management/qm-index.css"/>
</head>

<body>
<div class="qm-header">
    <div class="logo-box">
        <img src="../../images/ceshi3.jpg"/>
    </div>
    <div class="qm-logo">
        青麦科技
    </div>
    <div id="">

    </div>
    <div class="qm-quit">
        <div class="qm-index-off">

        </div>
    </div>
</div>
<!--////////-->
<div class="main">
    <div class="main_left" id="frmTitle" name="fmTitle">
        <!--1-->
        <div class="sidebar-img">
            <img src='../../images/ceshi3.jpg' alt="..." class="am-img-thumbnail ">
            <div class="sidebar-text">
                <span><i>姓名 : </i>梦悠然</span><span><i>账号 : 1314520</i></span>

            </div>
        </div>
        <!--2-->
        <div id="menu-list-box" style="height: 795px;">
            <ul class="am-list admin-sidebar-list menu-list" id="collapase-nav-1">

                <li class="am-panel">

                    <a class="panel-a" target="iframepage1" href="qm-companyprofile.jsp" data-am-collapse="{parent: '#collapase-nav-1', target: '#user-nav1'}">
                        <i class="am-icon-users am-margin-left-sm"></i>企业设置<i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                    </a>

                </li>
            </ul>
            <!--2-->
            <ul class="am-list admin-sidebar-list menu-list" id="collapase-nav-2">

                <li class="am-panel">
                    <a class="panel-a" data-am-collapse="{parent: '#collapase-nav-2', target: '#user-nav2'}">
                        <i class="am-icon-users am-margin-left-sm"></i>组织结构
                        <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                    </a>

                    <ul class="am-list am-collapse admin-sidebar-sub" id="user-nav2">
                        <li class="menu-li">
                            <a target="iframepage1" href="qm-enterpriselistt.jsp" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>青麦科技<span>(32)</span></a>

                        </li>

                        <li class="menu-li">

                            <a target="iframepage1" href="qm-enterpriselistt.jsp" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>总经办</a>
                        </li>
                        <li class="menu-li">

                            <a target="iframepage1" href="qm-enterpriselistt.jsp" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>人事部</a>
                        </li>
                        <li class="menu-li">

                            <a target="iframepage1" href="qm-enterpriselistt.jsp" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>财务部</a>
                        </li>
                        <li class="menu-li">

                            <a target="iframepage1" href="qm-enterpriselistt.jsp" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>鹤山业务部</a>
                        </li>

                    </ul>
                </li>
            </ul>

        </div>

        <!---->

    </div>
    <div class="picBox" onclick="switchSysBar()" id="switchPoint">

        <div id="picclik" class="picclik-box">点击可收缩</div>
        <!--<div  style="background: url(../images/right.gif) no-repeat top center;width: 100%;height: calc(100% - 100px);"></div>-->
    </div>

    <div class="main_right" id="mainright">
        <iframe src="" id="iframepage" name="iframepage1" frameBorder=0 scrolling="0" width="100%" height="99.99%"></iframe>
    </div>

</div>

</body>

<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript">
    //	$('body').bind('click', function(event) {
    //  // IE支持 event.srcElement ， FF支持 event.target
    //  var evt = event.srcElement ? event.srcElement : event.target;
    //
    //  if(evt.id == 'user-nav' ) return; // 如果是元素本身，则返回
    //  else {
    //
    //      $('.group').css("display","none !important"); // 如不是则隐藏元素
    //  }
    //})
    var status = 1;
    function switchSysBar(item)
    {

        var switchPoint = document.getElementById("switchPoint");//获取小按钮
        var frmTitle = document.getElementById("frmTitle");//获取iframe


        if (1 == window.status)
        {
            window.status = 0;

            frmTitle.style.display = "none"
        } else
        {
            window.status = 1;

            frmTitle.style.display = ""
        }

    }
</script>
</html>