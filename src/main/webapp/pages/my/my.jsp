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
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/my/my.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/script/webuploader-0.1.5/webuploader.css"/>
</head>

<body>
<!--<div class="my_site">添加收货地址</div>-->
<div id="portrait" style="width: 100%;height: 100%;">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong></div>
    </div>
    <hr>

    <div id="site_box" style="min-width: 730px">
        <div class="img_box">
            <div id="user-img-box" class="portrait_box">
                <img class="portrait_user_img" id="userImg" src="" alt="头像" title="点击更换头像"/>
            </div>
            <div class="portrait_box">
                <img src="${path}/user_findMyQRCode.action" alt="二维码" title="二维码"/>
            </div>
        </div>

        <div class="am-form-group ">
            <label class="am-u-sm-2 am-form-label add_label">所在城市:</label>
            <div class="am-u-sm-10 add_selectdiv">
                <div class="info">
                    <div id="show">
                        <select id="s_province" name="s_province"></select>
                        <select id="s_city" name="s_city"></select>
                        <select id="s_county" name="s_county"></select>
                    </div>
                </div>
            </div>
        </div>

        <div class="am-form-group">
            <label class="am-u-sm-2 am-form-label add_label">收货人:</label>
            <div class="am-u-sm-10 add_selectdiv">
                <input id="userName" type="text">
            </div>
        </div>
        <div class="am-form-group">
            <label class="am-u-sm-2 am-form-label add_label">手机号码:</label>
            <div class="am-u-sm-10 add_selectdiv">
                <input id="userPhone" type="text">
            </div>
        </div>
        <div class="am-form-group">
            <label class="am-u-sm-2 am-form-label add_label">详细地址:</label>
            <div class="am-u-sm-10 add_selectdiv">
                <input id="userAddress" type="text">
            </div>
        </div>
        <div id="add_sitelast">
            <div>
                <button type="button" onclick="my.resetAddress()" class="am-btn am-btn-default">清空</button>
            </div>
            <div>
                <button type="button" onclick="my.saveOrUpdateAddress();" class="am-btn am-btn-primary">保存地址</button>
            </div>
        </div>
    </div>

    <div id="site_table" style="min-width: 730px">
        <table id="addressList">
            <tr>
                <th>收货人</th>
                <th>所在城市</th>
                <th>详细地址</th>
                <th>手机/电话</th>
                <th>操作</th>
            </tr>
        </table>
    </div>
</div>
<!--收货地址弹框-->
</div>
</body>

<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script src="${path}/script/webuploader-0.1.5/webuploader.js"></script>
<script src="${path}/script/js/myjs.js"></script>
<script src="${path}/script/js/area.js"></script>
<script type="text/javascript">
    _init_area();
</script>

<script type="text/javascript" src="${path}/pages/my/my.js"></script>

<script type="text/javascript">
    my.init();
</script>

</html>