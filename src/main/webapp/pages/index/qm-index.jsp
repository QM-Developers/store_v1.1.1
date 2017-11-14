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
    <div class="qm-logo" id="loginText">

    </div>
    <div style="width: 200px;float: left" >
        <span>登录名字</span>：<span id="xingming"></span> <span>切换名字</span>：<span id="xingming1"></span>
    </div>
    <div class="qm-quit">
        <ul class="header-nav" style="margin: 0;width: 100%;">
            <li>
                <span class="icon-i icon-i-1"></span>
                <a class="header-nav-a" target="iframepage" href="${path}/pages/mydata/qm-myData.jsp">个人中心</a>
            </li>
            <li>
                <span class="icon-i icon-i-2"></span>
                <a class="header-nav-a" onclick="qm_index.exitSystem()">安全退出</a>
            </li>
        </ul>
    </div>
</div>
<!--////////-->
<div class="main">
    <div class="main_left" id="frmTitle" name="fmTitle">
        <!--1-->
        <%--<div class="user-name" id="userName" style="display: none;">--%>
        <%--梦悠然--%>

        <%--</div>--%>
        <!--2-->
        <div id="menu-list-box" style="height: 795px;overflow: auto">
            <ul class="am-list admin-sidebar-list menu-list" id="collapase-nav-1">
                <li class="am-panel">
                    <a class="panel-a" id="li-name" style="padding-left: 37px;">

                        <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                    </a>
                    <ul class=" fristul am-list admin-sidebar-sub" id="user-nav0">


                    </ul>
                </li>
                <li class="am-panel">
                    <a class="panel-a">
                        <i class="bg-1-i am-margin-left-sm"></i>待我处理
                        <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                    </a>

                    <ul class=" fristul am-list admin-sidebar-sub" id="user-nav1">
                        <li class="menu-li untreated-1">
                            <a target="iframepage" href="${path}/pages/approve/qm-universalApply.jsp" class="am-cf menu-li-a">
                                <%--<span class=" am-fr  num-circle">99</span>--%>
                                通用审批
                            </a>
                        </li>
                        <li class="menu-li untreated-2">
                            <a target="iframepage" href="${path}/pages/approve/qm-accountApprove.jsp" class="am-cf menu-li-a">
                                <%--<span class=" am-fr  num-circle">99</span>--%>
                                建账审批
                            </a>
                        </li>
                        <li class="menu-li untreated-3">
                            <a target="iFrame0" href="${path}/pages/repertory/qm-transferapprove.jsp" class="am-cf menu-li-a">

                                调货审批
                            </a>
                        </li>
                        <li class="menu-li untreated-4">
                            <a target="iFrame0" href="javascript:void(0)" class="am-cf menu-li-a">

                                订单跟进
                            </a>
                        </li>
                        <li class="menu-li untreated-5">
                            <a target="iFrame0" href="javascript:void(0)" class="am-cf menu-li-a">

                                回款订单
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="am-panel">
                    <a class="panel-a">
                        <i class="bg-2-i am-margin-left-sm"></i>
                        我的工作台
                        <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                    </a>

                    <ul class="fristul am-list  admin-sidebar-sub" id="user-nav2">
                        <li class="menu-li work-1">
                            <a target="_blank" href="${path}/qm-sys-login.jsp" class="am-cf menu-lia">
                                系统管理
                                <%--<span class="am-icon-angle-double-right am-fr am-margin-right"></span>--%>
                            </a>
                        </li>
                        <li class="menu-li work-2">
                            <a target="iframepage" href="${path}/pages/customer/qm-addcustomer.jsp"
                               class="am-cf menu-lia">
                                <%--<span class="am-icon-angle-double-right am-fr am-margin-right"></span>--%>
                                新增客户
                            </a>
                        </li>

                        <li class="menu-li work-3">
                            <a target="iframepage" href="${path}/pages/customer/qm-customerlist.jsp?client=1"
                               class="am-cf menu-lia">
                                <%--<span class="am-icon-angle-double-right am-fr am-margin-right"></span>--%>
                                拜访客户
                            </a>
                        </li>

                        <%--<li class="menu-li">--%>
                        <%--<a target="iframepage" href="../friend/qm-friend.jsp" class="am-cf menu-lia">--%>
                        <%--<span class="am-icon-angle-double-right am-fr am-margin-right"></span>我的好友--%>
                        <%--</a>--%>
                        <%--</li>--%>
                        <li class="menu-li work-4">
                            <a class="am-cf menu-lia">
                                申请审批
                                <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                            </a>
                            <ul class="secondul am-list  admin-sidebar-sub" id="user-nav2-1">
                                <li class="menu-li work-4-1">
                                    <a target="iframepage" href="${path}/pages/apply/qm-applylist.jsp"
                                       class="am-cf menu-li-a">
                                        通用申请
                                    </a>
                                </li>
                                <li class="menu-li work-4-2">
                                    <a target="iframepage" href="${path}/pages/apply/qm-prepareAccountsApply.jsp"
                                       class="am-cf menu-li-a">
                                        建账申请
                                    </a>
                                </li>
                                <li class="menu-li work-4-3">
                                    <a target="iframepage" href="${path}/pages/approve/qm-universalApply.jsp"
                                       class="am-cf menu-li-a">
                                        通用审批
                                    </a>
                                </li>
                                <li class="menu-li work-4-4">
                                    <a target="iframepage" href="${path}/pages/approve/qm-accountApprove.jsp"
                                       class="am-cf menu-li-a">
                                        建账审批
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-li work-5">
                            <a class="am-cf menu-lia">
                                商城管理 <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                            </a>
                            <ul class="secondul am-list  admin-sidebar-sub" id="user-nav2-2">
                                <li class="menu-li work-5-1">
                                    <a class="am-cf menu-li-a" target="iframepage"
                                       href="${path}/pages/mall/goods/qm-typeSelect.jsp?option=add">
                                        发布商品
                                    </a>
                                </li>
                                <li class="menu-li work-5-2">
                                    <a class="am-cf menu-li-a" target="iframepage"
                                       href="${path}/pages/mall/goods/qm-goodslist.jsp">

                                        商城
                                    </a>
                                </li>
                                <li class="menu-li work-5-3">
                                    <a class="am-cf menu-li-a" target="iframepage"
                                       href="${path}/pages/mall/goods/qm-selllist.jsp">
                                        销售点
                                    </a>
                                </li>
                                <li class="menu-li work-5-4">
                                    <a class="am-cf menu-li-a" target="iframepage"
                                       href="${path}/pages/mall/goods/qm-template.jsp">
                                        运费模板
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-li work-6">
                            <a target="iframepage" href="../indent/qm-salesOrderList.jsp" class="am-cf menu-lia">

                                业务订单
                            </a>
                        </li>

                        <li class="menu-li work-7">
                            <a target="iframepage" href="../indent/qm-salesOrderList.jsp" class="am-cf menu-lia">

                                财务订单
                            </a>

                        </li>
                        <li class="menu-li work-8">

                            <a class="am-cf menu-lia">
                                进销存
                                <i class="am-icon-angle-double-right am-fr am-margin-right"></i>
                            </a>
                            <ul class="secondul am-list admin-sidebar-sub" id="user-nav2-3">
                                <li class="menu-li work-8-1">
                                    <a target="iframepage" href="${path}/pages/repertory/qm-warehouse.jsp?all=1"
                                       class="am-cf menu-li-a">
                                        总部仓库
                                    </a>
                                </li>
                                <li class="menu-li work-8-2">
                                    <a target="iframepage" href="${path}/pages/repertory/qm-warehouserecord.jsp"
                                       class="am-cf menu-li-a">
                                        进仓记录
                                    </a>
                                </li>
                                <li class="menu-li work-8-3">
                                    <a target="iframepage" href="${path}/pages/repertory/qm-checkrecord.jsp"
                                       class="am-cf menu-li-a">
                                        盘点记录
                                    </a>
                                </li>
                                <li class="menu-li work-8-4">
                                    <a target="iframepage" href="${path}/pages/repertory/qm-transferrecord.jsp"
                                       class="am-cf menu-li-a">
                                        调货记录
                                    </a>
                                </li>
                                <li class="menu-li work-8-5">
                                    <a target="iframepage" href="${path}/pages/repertory/qm-transferapprove.jsp"
                                       class="am-cf menu-li-a">
                                        调货审批
                                    </a>
                                </li>
                                <li class="menu-li work-8-6">
                                    <a target="iframepage" id="skipBranch"
                                       class="am-cf menu-li-a">

                                        分销点库存
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-li work-9">
                            <a target="iframepage" href="${path}/pages/customer/qm-customerlist.jsp?resource=2"
                               class="am-cf menu-lia">
                                <%--<span class="am-icon-angle-double-right am-fr am-margin-right"></span>--%>
                                客户资源
                            </a>
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
        <iframe src="" id="iframepage" name="iframepage" allowfullscreen="true" allowtransparency="true" frameBorder=0
                scrolling="0" width="100%"
                height="99.99%"></iframe>
    </div>

</div>

</body>

<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>

<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/pages/index/qm-index.js"></script>
<script>
    qm_index.inint()
</script>
<script type="text/javascript">

    //左侧菜单移入显示移出消失
    Mouseon = function (item)
    {
        $(item).find(".menu-div").css("display", "block");
    };
    Mouseout = function (item)
    {
        $(item).find(".menu-div").css("display", "none");
    };
    //----------
    IconTab = function (item)
    {
        var $icon = $(item).find(".am-margin-right");
        if ($icon.hasClass("am-icon-angle-double-right"))
        {
            $icon.removeClass("am-icon-angle-double-right").addClass("am-icon-angle-double-down")
        } else
        {
            $icon.removeClass("am-icon-angle-double-down").addClass("am-icon-angle-double-right")
        }
    };

    $(window).resize(function ()
    {
        var height = $(this).height() - 100;
        $('#menu-list-box').height(height + 'px')

    });
</script>

</html>