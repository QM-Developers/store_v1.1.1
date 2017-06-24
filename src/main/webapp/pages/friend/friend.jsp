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
    <link rel="stylesheet" href="${path}/pages/friend/friend.css">
</head>

<body>
<div class="am-cf am-padding am-padding-bottom-0">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">我的好友</strong></div>
</div>

<hr>

</div>
<!-- 代码部分begin -->
<header class="listfixed">
    <div class="header">
        <input type="" name="" id="seek_friend" value="" placeholder="搜索好友..."/>
        <div id="listseek">
            <div class="seek_list">
                <div class="seek_logo"><img/></div>
                <div class="seek_name">天津市</div>
            </div>
        </div>
    </div>
</header>
<!--<div id="letter" >中间显示字母</div>-->
<div class="sort_box" id="friend-list">
</div>
<div class="initials">
    <ul>
    </ul>
</div>

<div id="add_find">
    <button style="margin-left: 35px" data-am-modal="{target: '#friend-window'}" type="button"
            class="am-btn am-btn-sm am-btn-default">
        <i class="am-icon-plus"></i>
        添加好友
    </button>
</div>

<div id="friend_cont">
    <div class="cont_box">
        <div class="cont_a">
            <span class="cont_spanleft">姓　　名：</span><span class="cont_spanright" id="userName"></span>
            <span class="cont_spanleft">手机号码：</span><span class="cont_spanright" id="userPhone"></span>
            <span class="cont_spanleft">地　　区：</span><span class="cont_spanright" id="userArea"></span>
            <span class="cont_spanleft">来　　源：</span><span class="cont_spanright" id="friendOrigin"></span>
        </div>
        <div class="cont_b">
            <img id="userImg" alt="头像"/>
        </div>
        <div class="cont_c">
            <div class="cont_cone"><span class="cont_cbox_left">备注姓名:</span>
                <input class="add_cbox_put" id="friendRemardName" placeholder="点击修改备注名"/>
            </div>
            <div class="cont_ctwo"><span class="cont_cbox_left">备注手机:</span>
                <input class="add_cbox_put" id="friendRemardPhone" placeholder="点击修改备住手机"/>
            </div>
            <div class="cont_cthree"><span class="cont_cbox_left">描　　述:</span>
                <textarea id="friendRemardText" class="add_cbox_put" placeholder="可输入150字描述..."></textarea>
            </div>
            <button type="button" onclick="friendJS.deleteFriend();"
                    style="margin-top: 10px;margin-right: 70px;float: right" class="am-btn am-btn-danger">删除好友
            </button>
            <button type="button" onclick="friendJS.saveOrUpdateRemard();"
                    style="margin-top: 10px;float: right" class="am-btn am-btn-primary">保存修改
            </button>
        </div>

    </div>
</div>

<div class="am-popup" id="friend-window" style="width: 650px">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">查找添加好友</h4>
            <span data-am-modal-close class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd am-fl">
            <div class="am-u-lg-12">
                <div class="am-input-group">
                    <input type="text" onkeydown="if(event.keyCode==13) friendJS.findUserByPhone();" id="s_friendPhone" class="am-form-field">
                    <span class="am-input-group-btn">
                        <button class="am-btn am-btn-default" onclick="friendJS.findUserByPhone()" type="button">查找</button>
                    </span>
                </div>
            </div>
            <div class="am-fl add_i">
                <img style="width: 100%;height: 100%;display: block;" id="friendImg" class="am-img-thumbnail">
            </div>
            <div class="am-fl add_s">
                <span><i>姓名:</i><em id="friendName"></em></span>
                <span><i>手机号:</i><em id="friendPhone"></em></span>
                <span><i>地区:</i><em id="friendArea"></em></span>
            </div>
            <div class="am-fl add_f1">
                <div class="am-fr add_f2" style="margin-right: 15px">
                    <button type="button" onclick="friendJS.addFriend();" class="am-btn am-btn-sm am-btn-primary">添加好友</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script src="${path}/script/js/jquery.charfirst.pinyin.js"></script>
<script src="${path}/script/js/ulmover.js"></script>
<script src="${path}/script/js/myjs.js"></script>
<script src="${path}/pages/friend/friend.js"></script>

<script type="text/javascript">
    friendJS.init();
</script>
</html>