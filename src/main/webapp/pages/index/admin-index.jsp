<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<!doctype html>
<html class="no-js fixed-layout">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>

    <link rel="icon" type="image/png" href="${path}/script/Amaze/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${path}/script/Amaze/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
    <div class="am-topbar-brand">
        <strong>青麦科技</strong>
        <small>后台管理系统</small>
    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
            data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span
            class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
            <li class="am-dropdown" data-am-dropdown id="dropdown-list">
                <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                    <img class="am-img-thumbnail am-circle" src="${path.concat(sessionScope.loginInfo.userImg)}" height="40"
                         width="40"/> ${sessionScope.loginInfo.userName} <span ss="am-icon-caret-down"></span>
                </a>
                <ul class="am-dropdown-content">
                    <li><a target="iFrame0" onclick="indexJS.hideList();" href="../my/my.jsp"><span class="am-icon-user"></span> 个人资料</a></li>
                    <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>
            <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span
                    class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">
    <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
        <div class="am-offcanvas-bar admin-offcanvas-bar">
            <ul id="menu-list" class="am-list admin-sidebar-list">
                <li><a href="admin-index.html"><span class="am-icon-home"></span> 首页</a></li>
            </ul>

            <div class="am-panel am-panel-default admin-sidebar-panel">
                <div class="am-panel-bd">
                    <p><span class="am-icon-tag"></span> wiki</p>
                    <p>Welcome to the Amaze UI wiki!</p>
                </div>
            </div>
        </div>
    </div>
    <!-- sidebar end -->

    <!-- content start -->
    <iframe class="admin-content" style="width: calc(100% - 260px);height: calc(104%)" name="iFrame0"
            id="iFrame0"></iframe>
    <!-- content end -->

</div>

</body>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<!--<![endif]-->
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script src="${path}/script/Amaze/assets/js/app.js"></script>

<script type="text/javascript">
    var path = "${path}";
    var basePath = "${basePath}";
</script>

<script src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/index/admin-index.js"></script>
<script type="text/javascript">
    indexJS.initMenu();
</script>

</html>
