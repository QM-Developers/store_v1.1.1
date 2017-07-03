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
    <meta charset="utf-8"/>
    <meta http-equiv="content-type" content=""/>
    <link rel="icon" type="image/png" href="${path}/script/Amaze/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${path}/script/Amaze/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.css"/>
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${path}/pages/index/qm-index.css"/>

    <script type="text/javascript">
        var roleId = "${sessionScope.loginInfo.roleId}";
    </script>
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
                <span><i>姓名 : </i>梦悠然</span><span><i>账号 : </i>1314520</span>
            </div>
        </div>
        <!--2-->
        <div id="menu-list-box" style="height: 795px;">
            <ul class="am-list admin-sidebar-list menu-list" id="collapase-nav-1">
                <li class="am-panel">
                    <a class="panel-a" data-am-collapse="{parent: '#collapase-nav-1', target: '#user-nav1'}" onclick="IconTab(this)">
                        <i class="am-icon-users am-margin-left-sm"></i>待我处理
                        <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                    </a>

                    <ul class="am-list am-collapse admin-sidebar-sub" id="user-nav1">
                        <li class="menu-li">
                            <a target="iframepage" href="../management/qm-companyprofile.html" class="am-cf menu-li-a"><span class=" am-fr am-margin-right num-circle">99</span>申请审核</a>
                        </li>
                        <li class="menu-li">
                            <a target="iFrame0" href="javascript:void(0)" class="am-cf menu-li-a"><span class=" am-fr am-margin-right num-circle">99</span>
                                订单处理</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!--2-->
            <ul class="am-list admin-sidebar-list menu-list" id="collapase-nav-2">

                <li class="am-panel">
                    <a class="panel-a" data-am-collapse="{parent: '#collapase-nav-2', target: '#user-nav2'}" onclick="IconTab(this)">
                        <i class="am-icon-users am-margin-left-sm"></i>我的工作台<i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                    </a>
                    <ul class="am-list am-collapse admin-sidebar-sub" id="user-nav2">
                        <li class="menu-li">
                            <a target="_blank" href="${path}/qm-sys-login.jsp" class="am-cf menu-li-a">
                                <span class="am-icon-angle-double-right am-fr am-margin-right"></span>系统管理
                            </a>
                        </li>
                        <li class="menu-li mygroup" onmouseenter="Mouseon(this)" onmouseleave="Mouseout(this)">
                            <a target="iFrame0" href="javascript:void(0)" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>
                                团队管理</a>
                            <div class='menu-div mygrouplist' style="display: none;">
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="../customer/qm-mydepartment.html">总裁办</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="../customer/qm-mydepartment.html">总经办</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="../customer/qm-corporationlist.html">分公司</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="../customer/qm-departmentlist.html">下属部门</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="../customer/qm-departmentlist.html">其他部门</a>
                                </div>
                            </div>
                        </li>

                        <li class="menu-li myclient" onmouseenter="Mouseon(this)" onmouseleave="Mouseout(this)">
                            <a target="iFrame0" href="javascript:void(0)" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>
                                我的客户</a>
                            <div class='menu-div myclientlist' style="display: none;">
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="../group/qm-grouplistt.html">个体</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="">经销商</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="">合作农户</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="">合作社</a>
                                </div>
                            </div>
                        </li>

                        <li class="menu-li">
                            <a target="iframepage" href="../friend/qm-friend.html" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>我的好友</a>
                        </li>
                        <li class="menu-li myclient" onmouseenter="Mouseon(this)" onmouseleave="Mouseout(this)">
                            <a target="iFrame0" href="javascript:void(0)" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>
                                我的申请</a>
                            <div class='menu-div myclientlist' style="display: none;">
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="">发起申请</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="">申请记录</a>
                                </div>
                            </div>
                        </li>
                        <li class="menu-li myclient" onmouseenter="Mouseon(this)" onmouseleave="Mouseout(this)">
                            <a target="iFrame0" href="javascript:void(0)" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>
                                我的商城</a>
                            <div class='menu-div myclientlist' style="display: none;">
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="../mall/goods/qm-goodslist.html">我的商城</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="../mall/goods/qm-selllist.html">销售点</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="">运费模板</a>
                                </div>

                            </div>
                        </li>
                        <li class="menu-li myclient" onmouseenter="Mouseon(this)" onmouseleave="Mouseout(this)">
                            <a target="iFrame0" href="javascript:void(0)" class="am-cf menu-li-a"><span class="am-icon-angle-double-right am-fr am-margin-right"></span>订单查看</a>
                            <div class='menu-div myclientlist' style="display: none;">
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="../indent/qm-indent.html">我的订单</a>
                                </div>
                                <div class='menu-lichild'>
                                    <a target="iframepage" href="../mall/goods/qm-selllist.html">业务订单</a>
                                </div>

                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!---->
    </div>
    <div class="picBox" onclick="switchSysBar()" id="switchPoint">
        <div id="picclik" class="picclik-box">点击可收缩</div>
    </div>
    <div class="main_right" id="mainright">
        <iframe src="" id="iframepage" name="iframepage" frameBorder=0 scrolling="0" width="100%" height="99.99%"></iframe>
    </div>

</div>

</body>

<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/index/qm-index.js"></script>

<script type="text/javascript">
    //左侧菜单移入显示移出消失
    Mouseon = function(item){
        $(item).find(".menu-div").css("display","block");
    }
    Mouseout = function(item){
        $(item).find(".menu-div").css("display","none");
    }
    //----------

    IconTab = function(item) {
        console.log("1111")
        var $icon = $(item).find("i").eq(1);
        if($icon.hasClass("am-icon-angle-double-right")) {
            console.log("1111")
            $icon.removeClass("am-icon-angle-double-right")
            $icon.addClass("am-icon-angle-double-down")
        } else {
            $icon.removeClass("am-icon-angle-double-down")
            $icon.addClass("am-icon-angle-double-right")
        }
    }

    var status = 1;

    function switchSysBar(item) {

        var switchPoint = document.getElementById("switchPoint"); //获取小按钮
        var frmTitle = document.getElementById("frmTitle"); //获取iframe

        if(1 == window.status) {
            window.status = 0;
            //		Mainright.style.marginLeft = "0px";

            frmTitle.style.display = "none"
        } else {
            window.status = 1;
            //		Mainright.style.marginLeft = "190px";

            frmTitle.style.display = ""
        }

    }
</script>
</html>