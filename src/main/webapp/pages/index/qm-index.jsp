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
        var roleId = "${sessionScope.loginInfo.roleId}";
    </script>
    <meta charset="utf-8"/>
    <meta http-equiv="content-type" content=""/>
    <link rel="icon" type="image/png" href="${path}/script/Amaze/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${path}/script/Amaze/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.css"/>
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${path}/pages/index/qm-index.css"/>

<body scroll="no">
<div class="qm-header">
    <div class="qm-logo">
        青麦科技
    </div>
    <div class="qm-quit">
        <a href="${path.concat('/login_logout.action')}" class="qm-index-off">
            x
        </a>
    </div>
</div>
<!--////////-->
<div class="main">
    <div class="main_left" id="frmTitle" name="fmTitle">
        <!--1-->
        <div id="sidebar-img">
            <img alt="..." class="am-img-thumbnail am-circle">
            <div class="sidebar-text">
                <span><i>姓名 : </i>梦悠然</span><span><i>部门 : 软件部</i></span>
            </div>
        </div>
        <!--2-->
        <div id="menu-list-box" style="height: 480px;">
            <ul class="am-list admin-sidebar-list menu-list" id="collapase-nav-1" >
                <li class="am-panel">
                    <a data-am-collapse="{parent: '#collapase-nav-1', target: '#user-nav'}">
                        <i class="am-icon-users am-margin-left-sm"></i> 我的工作台
                        <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                    </a>
                </li>
                <ul class="am-list am-collapse admin-sidebar-sub" id="user-nav">
                    <li class="menu-li" onclick="Menuli()">
                        <a target="iFrame0" href="javascript:void(0)" class="am-cf"><span class="am-icon-angle-double-right am-fr am-margin-right"></span> 团队管理</a>
                        <div class='menu-div' style="display: none">
                            <div class="menu-lichild"><a target="iframepage" href="../team/qm-mydepartment.jsp">总裁办</a></div>
                            <div class="menu-lichild"><a target="iframepage" href="../team/qm-mydepartment.jsp">总经办</a></div>
                            <div class="menu-lichild"><a target="iframepage" href="../team/qm-corporationlist.jsp">分公司</a></div>
                            <div class="menu-lichild"><a target="iframepage" href="../team/qm-departmentlist.jsp">下属部门</a></div>
                            <div class="menu-lichild"><a target="iframepage" href="../team/qm-departmentlist.jsp">其他部门</a></div>
                        </div>
                    </li>
                    <li class="menu-li">
                        <a target="iframepage" href="../friend/qm-friend.jsp" class="am-cf"><span class="am-icon-angle-double-right am-fr am-margin-right"></span> 我的好友</a>
                    </li>
                </ul>
            </ul>
        </div>
        <!---->
    </div>
    <div class="picBox" onclick="switchSysBar()" id="switchPoint">
        <div style="background: #dedede;width: 100%;height: 230px;"></div>
        <div id="picclik" style="background: #00acef url(${path}/pages/images/right.gif) no-repeat top center;width: 100%;height: calc(100% - 230px);"></div>
    </div>
    <div class="main_right" id="mainright">
        <iframe src="../team/qm-department.jsp" id="iframepage" name="iframepage" frameBorder=0 scrolling="0" width="100%" height="99.99%"></iframe>
    </div>
</div>
</body>

<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/index/qm-index.js"></script>
</html>