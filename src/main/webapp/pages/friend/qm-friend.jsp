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

        var userId = "${sessionScope.loginInfo.userId}";
        var teamId = "${sessionScope.loginInfo.myTeamId}";
    </script>
    <meta charset="UTF-8">

    <title>好友列表</title>

    <link rel="stylesheet" href="${path}/script/Amaze/assets/css/amazeui.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/pages/common/reset.css"/>
    <link rel="stylesheet" href="${path}/pages/friend/qm-friend.css">
</head>

<body>

<div class="am-tabs" data-am-tabs id="friendtoplist">
    <ul class="am-tabs-nav am-nav am-nav-tabs friend-header">
        <li class="am-active">
            <a href="#tab-4-1">好友列表
                <span class="listfixed-circle listfixed-circlelist" style="display: none" num="0" id="friend-notify-num"></span>
            </a>
        </li>
        <li>
            <a href="#tab-4-2">聊天窗口
                <span class="listfixed-circle listfixed-circlelist" style="display: none" num="0" id="chat-notify-num"></span>
            </a>
        </li>
    </ul>
    <div class="am-tabs-bd am-tabs-bd-ofv" style="border: 0">
        <div class="am-tab-panel am-active" id="tab-4-1" style="padding: 0">
            <div class="friend-list am-g">
                <div class="friend-list-left ">
                    <header class="listfixed">
                        <input type="" name="" class="seek-friend" value="" placeholder="搜索好友..."/>
                        <div class="listfixed-addfriend">
                            <div class="listfixed-addfriend-left"><i class="am-icon-plus"></i></div>

                            <div class="listfixed-addfriend-right">
                                <span>新的朋友</span>
                                <span class="listfixed-circle" style="display: none;" num="0" id="friend-request-count"></span></div>
                            <a href="###" class="listfixed-a" onclick="friendJS.findFriendRequest();"></a>
                        </div>
                        <div class="listseek">
                            <div class="seek-list">
                                <div class="seek-logo"><img/></div>
                                <div class="seek-name">
                                    <span class="seek-span">啊贾克斯<i class="am-icon-female"></i></span>
                                    <span class="seek-span color-ccc">快看啊头上有风车</span>
                                </div>
                                <span class="seek-list-input"></span>
                            </div>
                        </div>
                    </header>
                    <!--<div id="letter" >中间显示字母</div>-->
                    <!--<input class="sort-list-input" type="checkbox" />不要删-->
                    <div class="sort-box" id="friend-list"></div>
                </div>

                <!--点击右边资料显示 第一块-->
                <div class="friend-cont " id="FriendData">
                    <div class="cont-box">
                        <div class="cont-a">
                            <div class="cont-data">
                                <hidden id="friend-user-id"></hidden>
                                <hidden id="friend-id"></hidden>
                                <hidden id="friend-sex"></hidden>
                                <span class="cont-spanleft">好友名称：</span><span class="cont-spanright" id="friend-name-text"></span>
                            </div>
                            <div class="cont-data">
                                <span class="cont-spanleft">备注名称：</span><input class="cont-spanright" id="friend-remark-name"/>
                            </div>
                            <div class="cont-data">
                                <span class="cont-spanleft">手机号码：</span><span class="cont-spanright" id="friend-phone-text"></span>
                            </div>
                            <div class="cont-data">
                                <span class="cont-spanleft">所在地址：</span><span class="cont-spanright" id="friend-address-text"></span>
                            </div>
                            <div class="cont-data">
                                <span class="cont-spanleft">好友来源：</span><span class="cont-spanright" id="friend-origin-text"></span>
                            </div>
                        </div>
                        <div class="cont-b">
                            <img id="friend-img" alt="头像"/>
                        </div>
                        <div class="cont-c">
                            <div class="cont-cthree"><span class="cont-cbox-left">添加备注:</span>
                                <textarea id="friend-remark-text" class="add-cbox-put" placeholder="可输入150字描述..."></textarea>
                            </div>
                            <div class="cont-manage">
                                <ul>
                                    <li class="cont-manage-li" onclick="friendJS.toChat()">聊天</li>
                                    <li class="cont-manage-li" onclick="friendJS.updateFriendRemark()">保存资料</li>
                                    <li class="cont-manage-li">推荐此人</li>
                                    <li class="cont-manage-li">删除好友</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!--点击推荐好友 第二块-->
                <div class="recommend-friend" id="Recommend">
                    <div class="recommend-friend-top">
                        <div class="recommend-friend-img"><img src=""/></div>
                        <div class="recommend-friend-name">
                            <span>张三李<i class="am-icon-male"></i></span>
                            <span>手机号码 : </span><span>13688888888</span>

                        </div>
                    </div>
                    <div class="recommend-friend-text">
                        请勾选得到名片的好友：
                    </div>
                    <div class="recommend-friend-but">
                        <div class="recommend-friend-butbox">
                            <button>确定</button>
                            <button>取消</button>
                        </div>
                    </div>
                </div>

                <!--添加新朋友 第三块-->
                <div class="newfriend" id="AddFriend">
                    <div class="newfriend-title-box">
                        <div class="newfriend-title">新朋友</div>
                        <button data-am-modal="{target: '#friend-window'}" type="button" class="am-btn am-btn-sm am-btn-default newfriend-title-but">
                            <i class="am-icon-plus"></i>添加好友
                        </button>
                    </div>
                    <div class="approve-box">
                        <div class="newfriend-now" id="friend-request-list"></div>
                    </div>
                </div>
            </div>

        </div>
        <!--聊天界面内容-->
        <div class="am-tab-panel" id="tab-4-2"  style="padding: 0">
            <div class="friend-list am-g">
                <div class="friend-list-left ">
                    <%--<div class="groupchat">发起群聊</div>--%>
                    <header class="listfixed chat">
                        <input type="" name="" class="seek-friend" value="" placeholder="搜索好友..."/>
                        <div class="listseek"></div>
                    </header>
                    <!--聊天列表-->
                    <div class="chat-sort-box" id="chat-list">
                        <%--<div class="groupname-friend-but ">--%>
                        <%--<div class="groupname-friend-butbox chat-friend-but">--%>
                        <%--<button>确定</button>--%>
                        <%--<button>取消</button>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                    </div>
                </div>

                <div class="chatinterface" id="chat-room-list">
                    <!--发起群聊界面-->
                    <%--<div class="groupname">--%>
                        <%--<span>群名 :</span><input type="" class="groupname-input"/>--%>
                        <%--<div>请勾选进入群聊的好友</div>--%>
                        <%--<div class="groupname-friend-but ">--%>
                            <%--<div class="groupname-friend-butbox">--%>
                                <%--<button>确定</button>--%>
                                <%--<button>取消</button>--%>
                            <%--</div>--%>

                        <%--</div>--%>
                    <%--</div>--%>
                    <!--好友聊天界面-->
                    <%--<!--时间显示-->--%>
                    <%--<div class="chatroom-time">--%>
                    <%--<div class="chatroom-time-cont">昨天18:60</div>--%>
                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>
</div>

<!--添加好友-->
<div class="am-popup" id="friend-window" style="width: 800px;">
    <div class="am-popup-inner">
        <div class="am-popup-hd popup-hd-background">
            <h4 class="am-popup-title" style="text-align: left;color: #fff;">查找好友</h4>
            <span data-am-modal-close class="am-close" style="color: #fff;opacity:1">&times;</span>
        </div>
        <div class="am-popup-bd am-fl popup-bd-top">
            <div class="am-u-lg-12 popup-input-box">
                <div class="am-input-group popup-input-group">
                    <input type="text" onkeydown="if(event.keyCode==13) friendJS.findUserByPhoneOrName();" id="input-search-friend" class="am-form-field" placeholder="输入手机号/名字">
                    <span class="am-input-group-btn"><button class="am-btn am-btn-default" onclick="friendJS.findUserByPhoneOrName()" type="button">查找</button></span>
                </div>
            </div>
            <div class="popup-bd-botton">
                <div class="popup-friend-seo"><span class="color-ccc">搜索 : </span><span id="search-result-name"></span>
                </div>
                <div class="popup-friend-seo color-ccc">找到 <span id="search-result-num"></span> 个人:</div>
                <div id="search-result-list"></div>
            </div>
        </div>
    </div>
    <div class="add-friend">
        <div class="add-friend-title am-popup-hd">
            <div class="add-friend-text">添加好友</div>
            <span class="am-close am-fr" onclick="Addfriend(this)" style="color: #fff;opacity:1">&times;</span>
        </div>
        <div class="add-friend-box" id="add-user-info"></div>
        <div class="add-friend-texttarea">
            <span>验证信息 :</span><textarea id="add-request-info"></textarea>
        </div>
        <div class="add-friend-butbox">
            <div class="add-friend-but">
                <button onclick="friendJS.addFriendRequest();">添加好友</button>
            </div>
        </div>

    </div>
</div>
<div id="Prompt-box" class="prompt-box">
    <div id="Prompt" class="pop-one pop-one1">
        <div class="prompt-title">提示</div>
        <div class="prompt-frame1" id="confirm-text"></div>
        <div class="prompt-frame2">
            <div class="prompt-frame-box">
                <div class="prompt-frame-left" onclick="PromptOff(this)">取消</div>
                <div class="prompt-frame-right" onclick="friendJS.btnOkClick()">确定</div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/script/jquery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${path}/script/Amaze/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/script/js/myjs.js"></script>
<script type="text/javascript" src="${path}/script/js/date.js"></script>
<script type="text/javascript" src="${path}/script/js/jquery.charfirst.pinyin.js"></script>
<script type="text/javascript" src="${path}/script/js/ulmover.js"></script>
<script type="text/javascript" src="${path}/pages/friend/qm-friend.js"></script>

<script type="text/javascript">
    friendJS.init();
    $('#friendtoplist').tabs({noSwipe: 1});
    //    Friendbut = function ()
    //    {
    //        $(".add-friend").css("display", "blck")
    //    }

    PromptSel = function (type, text, data)
    { //提示框
        friendJS.optType = type;
        friendJS.optData = data;
        $("#confirm-text").text(text);
        $("#Prompt-box").css("display", "block");
        $("#Prompt").css("display", "block")

    }
    PromptOff = function (item)
    {
        $(item).parents(".prompt-box").css("display", "none")
    }


</script>

</html>