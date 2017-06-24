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
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${path}/pages/customer/message.css"/>
</head>

<body>
<div id="message_box">
    <div id="message_box_header">
        个人基本信息
    </div>
    <div id="form_box">

        <div class="am-form am-form-horizontal">
            <div class="am-form-group">
                <label for="user-name" class="am-u-sm-3 am-form-label">姓　　名:</label>
                <div class="am-u-sm-9">
                    <input type="text" id="user-name" placeholder="姓名">
                    <small></small>
                </div>
            </div>

            <div class="am-form-group">
                <label class="am-u-sm-3 am-form-label">手机号码:</label>
                <div class="am-u-sm-9">
                    <input type="email" id="user-date" placeholder="手机号码">
                    <small></small>
                </div>
            </div>

            <div class="am-form-group">
                <label class="am-u-sm-3 am-form-label">所在城市:</label>
                <div class="am-u-sm-9">
                    <div class="info">

                        <div id="show">

                            <select id="s_province" name="s_province"></select>

                            <select id="s_city" name="s_city"></select>

                            <select id="s_county" name="s_county"></select>
                            <script class="resources library select_s" src="assets/js/area.js"
                                    type="text/javascript"></script>
                            <script type="text/javascript">
                                _init_area();
                            </script>
                        </div>

                    </div>
                </div>
            </div>
            <div class="am-form-group">
                <label class="am-u-sm-3 am-form-label">出生日期:</label>
                <div class="am-u-sm-9">
                    <input type="text" id="user-riqi" placeholder="出生日期">
                </div>
            </div>

            <div class="am-form-group">
                <label class="am-u-sm-3 am-form-label">性　　别:</label>
                <div class="am-u-sm-9">
                    <input type="radio" name="1" id="user-nan" value=""/>男
                    <input type="radio" name="1" id="user-nv" value=""/>女
                </div>
            </div>

            <div class="am-form-group">
                <div class="am-u-sm-9 am-u-sm-push-3">
                    <button type="button" class="am-btn ">提交</button>
                </div>
            </div>
        </div>

    </div>
</div>
</body>

<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>

</html>