<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", path);
    request.setAttribute("basePath", basePath);
%>
<script type="text/javascript">
    var path = "${path}";
    var basePath = "${basePath}";
</script>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>好友列表</title>
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>

    <link rel="stylesheet" href="${path}/pages/customer/customer.css">

</head>

<body ng-app="customer-app" ng-controller="customer-ctrl">

<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg" id="page-title"></strong>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/
            <a href="group.jsp" style="margin-left: 20px" type="button" class="am-btn am-round am-btn-primary am-btn-sm">
                <i class="am-icon-tasks"></i>&nbsp;管理分组
            </a>
        </div>
    </div>
    <hr>
    <!-- 代码部分begin -->
    <header class="fixed">
        <div class="header">
            <input type="" name="" id="seek_friend" value="" placeholder="搜索客户..."/>
            <div id="listseek" class="listseek">
            </div>
        </div>
    </header>
    <!--<div id="letter" >中间显示字母</div>-->
    <div id="sort_box" class="sort_box">
    </div>
    <div class="initials">
        <ul>
            <li><img src=""></li>
        </ul>
    </div>

    <!--万恶的分隔符-->
    <div id="team_box">
        <a style="margin-left: 20px" class="am-btn am-btn-primary am-btn-sm" href="message.jsp">
            <i class="am-icon-plus"></i>&nbsp;新建用户档案
        </a>

        <div style="margin-top: 50px" id="form_box">
            <form class="am-form am-form-horizontal">
                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">姓　　名:</label>
                    <div class="am-u-sm-10">
                        <input type="text" id="userName" placeholder="姓名">
                        <small></small>
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">手机号码:</label>
                    <div class="am-u-sm-10">
                        <input type="text" id="userPhone" placeholder="手机号码">
                        <small></small>
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">所在城市:</label>
                    <div class="am-u-sm-10">
                        <div class="info">
                            <div id="show">
                                <select style="float: left;width: 33.33%" id="s_province" name="s_province"></select>
                                <select style="float: left;width: 33.33%" id="s_city" name="s_city"></select>
                                <select style="float: left;width: 33.34%" id="s_county" name="s_county"></select>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">详细地址:</label>
                    <div class="am-u-sm-10">
                        <input type="text" id="userAddress" placeholder="详细地址">
                    </div>
                </div>
                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">出生日期:</label>
                    <div class="am-u-sm-10">
                        <input type="date" class="am-form-field am-input-sm" id="userBirthday" placeholder="出生日期">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-2 am-form-label">性　　别:</label>
                    <div class="am-u-sm-10 add_feature">
                        <input type="radio" name="userSex" value="sex_1"/>男
                        <input type="radio" name="userSex" value="sex_0"/>女
                    </div>
                </div>

                <div class="am-form-group am-u-sm-10 am-u-lg-push-2">
                    <div class="am-dropdown" data-am-dropdown>
                        <button class="am-btn am-btn-primary am-dropdown-toggle" data-am-dropdown-toggle>查看场地信息<span
                                class="am-icon-caret-down"></span></button>
                        <ul class="am-dropdown-content" id="place-title"></ul>
                    </div>
                    <button type="button" onclick="customerJS.toBreedInfo();" class="am-btn am-btn-default">添加场地信息
                    </button>
                </div>
                <div class="am-u-sm-2">
                    <button type="button" onclick="customerJS.modifyInfo()"
                            class="sign_a am-btn resetbtn am-btn-default">修改信息
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script src="${path}/script/js/jquery.charfirst.pinyin.js"></script>
<script src="${path}/script/js/date.js"></script>
<script src="${path}/script/js/area.js"></script>
<script type="text/javascript">
    _init_area();
</script>

<script type="text/javascript">
    var groupId = document.URL.split("?")[1];
</script>

<script src="${path}/script/js/myjs.js"></script>
<script src="${path}/pages/customer/customer.js"></script>

<script type="text/javascript">
    customerJS.findCustomerByGroup();
</script>


</html>