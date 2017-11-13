<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<div class="qm-header">
    <div class="qm-logo" id="loginText">
        青麦软件科技
    </div>
    <div class="qm-quit">
        <ul class="header-nav" style="margin: 0;width: 100%;">
            <li>
                <span class="icon-i "></span>
                <a class="header-nav-a" onclick="qm_index.exitSystem()">退出</a>
            </li>
        </ul>
    </div>
</div>
<div class="main">
    <div class="main_left" id="frmTitle" name="fmTitle">
        <div id="menu-list-box" style="height: 795px;">
            <!--2-->
            <ul class="am-list admin-sidebar-list menu-list" id="collapase-nav-2">
                <%--<li class="am-panel">--%>
                    <%--<a class="panel-a" style="padding-left: 37px;pointer-events:none;">--%>
                        <%--你名字--%>
                    <%--</a>--%>
                <%--</li>--%>
                <li class="am-panel">
                    <a class="panel-a" data-am-collapse="{parent: '#collapase-nav-2', target: '#department-list'}">
                        <i class=" am-margin-left-sm bg-i bg-1-i"></i>组织结构
                        <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                    </a>
                    <ul class="am-list am-collapse admin-sidebar-sub" id="department-list"></ul>
                </li>
                <li class="am-panel">
                    <a class="panel-a" target="iframepage1" href="${path}/pages/management/qm-customersetup.jsp">
                        <i class="bg-2-i bg-i am-margin-left-sm"></i>客户权限管理
                        <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                    </a>

                </li>
            </ul>
        </div>

    </div>
    <div class="picBox" onclick="switchSysBar()" id="switchPoint">

        <div id="picclik" class="picclik-box">点击可收缩</div>
        <!--<div  style="background: url(../images/right.gif) no-repeat top center;width: 100%;height: calc(100% - 100px);"></div>-->
    </div>

    <div class="main_right" id="mainright">
        <iframe src="" id="iframepage" name="iframepage1" frameBorder=0 scrolling="0" width="100%"
                height="99.99%"></iframe>
    </div>

</div>

<script type="text/javascript" src="${path}/pages/management/qm-index.js"></script>
<script type="text/javascript">
    qm_index.init();
</script>