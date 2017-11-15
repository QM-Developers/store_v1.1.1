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
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/windowstyle.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/clientresource/qm-clientresource.css"/>

</head>
<body>
<div class="bodybox opacity-box">
    <div class="customerdata qm-team">
        <div class="customerdata-box">
            <div class="customerdata-title">
                <h4 class="h4">客户资料</h4>
            </div>
            <div class="customerdata-cont">
                <div id="sitelist" class=""></div>
                <ul class="frist-ul">
                    <li class="customerdata-li"><span class="am-u-sm-2">客户名称 :</span>
                        <input id="userName" class="am-u-sm-8 am-u-end disable-sign"/>
                    </li>
                    <li class="customerdata-li"><span class="am-u-sm-2">客户性别 :</span>
                        <input id="userSex" class="am-u-sm-8 am-u-end disable-sign"/>
                    </li>
                    <li class="customerdata-li"><span class="am-u-sm-2">联系电话 :</span>
                        <input id="userPhone" class="am-u-sm-8 am-u-end disable-sign"/>
                    </li>
                    <li class="customerdata-li"><span class="am-u-sm-2">出生年月 :</span>
                        <input id="userBirthday" class="am-u-sm-8 am-u-end disable-sign"/>
                    </li>
                    <li class="customerdata-li"><span class="am-u-sm-2">客户评级 :</span>
                        <input id="creditRating" class="am-u-sm-8 am-u-end disable-sign"/>
                    </li>
                    <li class="customerdata-li"><span class="am-u-sm-2">客户住址 :</span>
                        <input id="userAddress" class="am-u-sm-8 am-u-end disable-sign"/>
                    </li>
                    <li class="customerdata-li"><span class="am-u-sm-2">客户分类 :</span>
                        <%--<div id="" class=" customerType"></div>--%>
                        <input id="customerType" class="am-u-sm-8 am-u-end disable-sign"/>
                    </li>
                </ul>

            </div>
        </div>
    </div>

    <div class="container">
        <span class='containertitle'>身份证照片</span>
        <ul class="thumbnails" id="gallery">
            <li class="span3">
                <div class="imgbox img-1 " id="front">
                    <%--<a class="img-a">--%>
                    <%--<img src="../images/ceshi5.jpg">--%>
                    <%--</a>--%>
                </div>
            </li>
            <li class="span3">
                <div class="imgbox img-2 " id="reverse"></div>
            </li>
            <li class="span3">
                <div class="imgbox img-3 " id="idcard"></div>
            </li>

        </ul>
    </div>
    <!--客户状态-->
    <div class="customerdata qm-team">
        <div class="customerdata-title">
            <h4 class="h4">客户状态</h4>
        </div>
        <div class="customerdata-cont customerdata-cont2">
            <div class="am-u-sm-12">
                <ul class="frist-ul">
                    <li class="customerdata-li">
                        <span class="am-u-sm-2">建立档案:</span>
                        <span class="customerdata-record" id="userCreateDate"></span>
                    </li>

                    <li class="customerdata-li"><span class="am-u-sm-2">建立账号:</span>
                        <div class="am-u-sm-10 am-u-end customerdata-credit">
                            <span id="hadAccount" class="deal-state2">未建账</span>
                        </div>
                    </li>
                    <li class="customerdata-li">
                        <span class="am-u-sm-2">更新次数:</span><span class="deal-state2" id="updateCount">5</span>
                    </li>
                    <%--<li class="customerdata-li">--%>
                    <%--<span class="am-u-sm-2">跟单人员:</span><span class="deal-state2">张三and李四</span>--%>

                    <%--</li>--%>
                    <li class="customerdata-li">
                        <span class="am-u-sm-2">更新时间:</span>
                        <span class="deal-state2" id="userUpdateTime">2017-8-25</span>
                    </li>
                    <%--<li class="customerdata-li">--%>
                    <%--<span class="am-u-sm-2">最近交易 :</span><span class="deal-state2">2017-6-26</span>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </div>
    </div>
    <!--删除-->
    <div class=" data-del-off ">
        <div>
            <a class="del-but" onclick="qm_clientresource.goback()">返回</a>
        </div>
        <div>
            <a class="del-but" id="record">拜访记录</a>
        </div>
        <div>
            <a class="del-but freeze-but" id="freeze" onclick="">冻结账号</a>
        </div>
    </div>

</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/pages/common/regularandpop.js"></script>
<script type="text/javascript" src="${path}/pages/clientresource/qm-clientresource.js"></script>
<script type="text/javascript">
    qm_clientresource.init()
</script>

</html>