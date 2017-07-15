var friendJS = {
    socket: null,
    /**
     * 好友请求状态
     */
    requestState: {
        FRIEND_REQUEST: "request",
        FRIEND_AGREE: "agree",
        FRIEND_NEGATIVE: "negative"
    },

    /**
     * 确认操作框标记变量
     */
    optData: null,
    optType: "",
    optTypes: {agree: "agree", negative: "negative"},
    chatStr: "_chat",

    /**
     * 发送消息对象
     */
    messageType: {TEXT: 0x00000001, REQUEST: 0x00000002},
    message: {myTeamId: "", sendUserId: "", dataType: "", receiveUserId: "", sendData: ""},

    /**
     * 页面初始化函数
     */
    init: function ()
    {
        friendJS.findFriendRequestCount();
        friendJS.findFriendList();
        friendJS.findNotReadMessage();
        friendJS.initWebSocket();
    },

    /**
     * WebSocket 初始化方法
     */
    initWebSocket: function ()
    {
        if (!window.WebSocket)
            window.WebSocket = window.MozWebSocket;
        if (window.WebSocket)
        {
            friendJS.socket = new WebSocket("ws://112.74.32.113:8099/websocket");
            friendJS.socket.onmessage = function (event)
            {
                console.log(event);
                console.log(event.data);
                friendJS.receiveData(event.data);
            };
            friendJS.socket.onopen = function (event)
            {
                friendJS.message.sendUserId = userId;
                friendJS.socket.send(JSON.stringify(friendJS.message));
            };
            friendJS.socket.onclose = function (event)
            {
            };
        } else
            alert("抱歉，您的浏览器不支持WebSocket协议!");
    },

    /**
     * 查找拼接好友列表
     */
    findFriendList: function ()
    {
        var url = path + "/user_findFriendList.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            var item = "";
            data = data.result;
            for (var i = 0; i < data.length; i++)
            {
                var icon = data[i]["friendSex"] == "sex_0" ? "am-icon-female" : "am-icon-male";
                item += '<div class="sort-list" onclick="friendJS.findFriendData(\'' + data[i]["friendId"] + '\')">';
                item += '<div class="num-logo"><img src="' + path + data[i]["friendImg"] + '"/></div>';
                item += '<div class="num-name">';
                item += '<span class="num-span friend-span">' + data[i]["friendName"] + '<i class="' + icon + '"></i></span>';
                item += '<span class="friend-span">' + data[i]["friendRemarkName"] + '</span>';
                item += '</div></div>';
            }
            $("#friend-list").empty();
            $("#friend-list").append(item);
        });
    },

    /**
     * 查找好友信息
     * @param fid 好友Id
     */
    findFriendData: function (fid)
    {
        var url = path + "/user_findFriendData.action";
        var params = {};
        params["friendId"] = fid;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            $("#friend-name-text").text(data["friendName"]);
            $("#friend-phone-text").text(data["friendPhone"]);
            $("#friend-address-text").text(data["friendArea"] + " " + data["friendAddress"]);
            $("#friend-img").attr("src", path + data["friendImg"]);
            $("#friend-sex").val(data["friendSex"]);
            $("#friend-id").val(data["friendId"]);
            $("#friend-user-id").val(data["userId"]);
            $("#friend-remark-name").val(data["friendRemarkName"]);
            $("#friend-remark-text").val(data["friendRemarkText"]);
            FriendData();
        });
    },

    /**
     * 查找新好友申请消息的总数
     */
    findFriendRequestCount: function ()
    {
        var url = path + "/user_findFriendRequestCount.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            friendJS.updateNotifyNum(parseInt(data.result), $("#friend-notify-num"));
            friendJS.updateNotifyNum(parseInt(data.result), $("#friend-request-count"));
        });
    },

    /**
     * 查找好友请求
     */
    findFriendRequest: function ()
    {
        ListfixedA();
        if(parseInt($("#friend-request-count").attr("num")) < 1)
            return;
        friendJS.updateRequestIsRead();
        var url = path + "/user_findFriendRequest.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data);
            data = data.result;
            var today = new Date(Date.parse(new Date())).format("yyyy-MM-dd");
            var lastTime = "";
            $("#friend-request-list").empty();
            for (var i = 0; i < data.length; i++)
                lastTime = friendJS.appendRequestList(today, data[i], lastTime);
        });
    },

    appendRequestList: function (today, data, lastTime)
    {
        var item = "";
        var time = new Date(data["createDate"]).format("yyyy-MM-dd");
        var icon = data["friendSex"] == "sex_0" ? "am-icon-female" : "am-icon-male";
        var state = "";
        var stateText = "";
        var timeText = "";
        if (time == today)
            timeText = "今天";
        if (time != lastTime)
            item += '<div class="newfriend-now-title">' + timeText + '</div>';
        switch (data["requestState"])
        {
            case friendJS.requestState.FRIEND_REQUEST:
                var args = data["requestId"] + "=" + data["friendId"] + "=" + data["friendOrigin"];
                state = '<span onclick="PromptSel(friendJS.optTypes.agree,\'是否同意添加 ' + data["friendName"] + ' 为好友\',\'' + args + '\')">同意</span>' +
                    '<span onclick="PromptSel(friendJS.optTypes.negative,\'是否拒绝添加 ' + data["friendName"] + '\',\'' + args + '\')">拒绝</span>';
                stateText = "申请加为好友";
                break;
            case friendJS.requestState.FRIEND_AGREE:
                state = "已同意";
                stateText = "";
                break;
            case friendJS.requestState.FRIEND_NEGATIVE:
                state = '已拒绝';
                stateText = "";
                break;
        }
        item += '<div class="newfriend-now-cont">';
        item += '<div class="newfriend-now-img"><img src="' + path + data["friendImg"] + '"/></div>';
        item += '<div class="newfriend-now-span">';
        item += '<span class="newfriend-now-name">' + data["friendName"] + '<i class="' + icon + '"></i></span>';
        item += '<span class="newfriend-now-state">' + stateText + '</span>';
        item += '<span class="newfriend-now-describe">' + data["requestInfo"] + '</span>';
        item += '<div class="newfriend-now-sel">' + state + '</div>';
        item += '</div>';
        item += '</div>';
        lastTime = time;

        $("#friend-request-list").append(item);
        return lastTime;
    },

    /**
     * 同意好友申请
     */
    agreeFriendRequest: function ()
    {
        var url = path + "/user_agreeFriendRequest.action";
        var params = {};
        var args = friendJS.optData.split("=");
        params["requestId"] = args[0];
        params["friendId"] = args[1];

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data);
        });
    },

    /**
     * 拒绝好友申请
     */
    negativeFriendRequest: function ()
    {
        var url = path + "/user_negativeFriendRequest.action";
        var params = {};
        var args = friendJS.optData.split("=");
        params["requestId"] = args[0];
        params["friendId"] = args[1];

        console.log(params);

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data);
        });
    },

    /**
     * 把好友申请通知设置为已读
     */
    updateRequestIsRead: function ()
    {
        var num = parseInt($("#friend-notify-num").attr("num"));
        if (num < 1)
            return;

        var url = path + "/user_updateRequestIsRead.action";
        myjs.ajax_post(url);
        friendJS.updateNotifyNum(-num, $("#friend-notify-num"));
        friendJS.updateNotifyNum(-num, $("#friend-request-count"));
    },

    /**
     * 发起添加好友申请
     */
    addFriendRequest: function ()
    {
        var url = path + "/user_addFriendRequest.action";
        var params = {};
        params["friendId"] = $("#add-user-info").find("[data-type='userId']").attr("value");
        params["requestInfo"] = $("#add-request-info").val();

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data);
        });
    },

    /**
     * 根据手机或姓名查找用户
     */
    findUserByPhoneOrName: function ()
    {
        var url = path + "/user_findUserByPhone.action";
        var params = {};
        params["friendPhone"] = $("#input-search-friend").val();

        if (!myjs.objIsNull(params))
        {
            myjs.ajax_post(url, params, function (data)
            {
                data = data.result;
                $("#search-result-name").text(params["friendPhone"]);
                var item = "";
                for (var i = 0; i < data.length; i++)
                {
                    item += '<div class="add-box">';
                    item += '<div class="am-fl add-i">';
                    item += '<img data-type="userImg" value="' + data[i]["friendImg"] + '" src="' + path + data[i]["friendImg"] + '"/>';
                    item += '</div>';
                    item += '<hidden data-type="userId" value="' + data[i]["friendId"] + '"/>';
                    item += '<hidden data-type="userArea" value="' + data[i]["friendArea"] + '"/>';
                    item += '<span data-type="userName" value="' + data[i]["friendName"] + '" class="friend-name">' + data[i]["friendName"] + '</span>';
                    item += '<span data-type="userPhone" value="' + data[i]["friendPhone"] + '" class="friend-phone color-ccc">' + data[i]["friendPhone"] + '</span>';
                    item += '<button type="button" class="am-btn friend-add" onclick="friendJS.fillUserToWindow(this)">添加好友</button>';
                    item += '</div>';
                }
                $("#search-result-list").empty();
                $("#search-result-list").append(item);
            });
        } else
            alert("内容不能为空");
    },

    /**
     * 展示用户详情窗口
     * @param item 添加好友按钮
     */
    fillUserToWindow: function (item)
    {
        var parent = $(item).parent("div:eq(0)");
        var params = {};
        var item = "";
        params["userId"] = $(parent).find("[data-type='userId']").attr("value");
        params["userName"] = $(parent).find("[data-type='userName']").attr("value");
        params["userPhone"] = $(parent).find("[data-type='userPhone']").attr("value");
        params["userImg"] = $(parent).find("[data-type='userImg']").attr("value");
        params["userArea"] = $(parent).find("[data-type='userArea']").attr("value");

        item += '<hidden data-type="userId" value="' + params["userId"] + '"/>';
        item += '<div class="am-fl add-friend-img">';
        item += '<img src="' + path + params["userImg"] + '"/>';
        item += '</div>';
        item += '<span class="add-friend-name">' + params["userName"] + '</span>';
        item += '<span class="add-friend-phone color-ccc">' + params["userPhone"] + '</span>';
        item += '<span class="add-friend-site">地址 :<span>' + params["userArea"] + '</span></span>';

        $("#add-user-info").empty();
        $("#add-user-info").append(item);
        Friendadd();
    },

    /**
     * 提示框点击确定按钮时的事件
     */
    btnOkClick: function ()
    {
        switch (friendJS.optType)
        {
            case friendJS.optTypes.agree:
                friendJS.agreeFriendRequest();
                break;
            case friendJS.optTypes.negative:
                friendJS.negativeFriendRequest();
                break;
            default:
                break;
        }
    },

    /**
     * 切换到聊天界面
     */
    toChat: function ()
    {
        var fid = $("#friend-user-id").val();
        var name = $("#friend-name-text").text();
        var img = $("#friend-img").attr("src").replace(path, "");
        var icon = $("#friend-sex").val() == "sex_0" ? "am-icon-female" : "am-icon-male";
        var remark = $("#friend-remark-text").text();
        if ($("#" + fid).length < 1)
            friendJS.appendChatList(fid, name, remark, img, icon);
        Chat();
    },

    /**
     * 添加正在聊天人员的列表
     * @param fid 好友Id
     * @param name 好友名称
     * @param remark 好友备注名称
     * @param img 头像图片路径
     * @param icon 男/女图标
     * @param num 消息数量
     */
    appendChatList: function (fid, name, remark, img, sex)
    {
        var item = "";
        var data = {};
        var icon = sex == "sex_0" ? "am-icon-female" : "am-icon-male";
        data["fid"] = fid;
        data["name"] = name;
        data["img"] = img;
        item += '<hidden style="display: none" id="' + fid + '">' + JSON.stringify(data) + '</hidden>';
        item += '<div onclick="friendJS.showChatView(\'' + fid + '\',\'' + name + '\')">';
        item += '<div class="chat-sort-list">';
        item += '<div class="chat-num-logo"><img src="' + path + data["img"] + '"/></div>';
        item += '<div class="chat-num-name">';
        item += '<span class="chat-friend-span">' + name + '<i class="' + icon + '"></i></span>';
        item += '<span class="chat-friend-span">' + remark + '</span>';
        item += '</div>';
        item += '<div data-type="notify" style="display: none" class="chat-num-circle">' + 0 + '</div>';
        item += '</div></div>';
        $("#chat-list").append(item);
    },

    receiveData: function (json)
    {
        var data = JSON.parse(json);
        switch (parseInt(data["dataType"]))
        {
            case friendJS.messageType.TEXT:
                friendJS.receiveMessage(data["sendUserId"], data["userName"],
                    data["userImg"], data["userSex"],
                    data["sendData"], data["friendRemarkName"]);
                break;
            case friendJS.messageType.REQUEST:
                friendJS.receiveRequest(data);
                break;
        }
    },

    /**
     * 接收消息
     * @param json 接收到的数据
     */
    receiveMessage: function (fid, name, img, sex, msg, remark)
    {
        var icon = sex == "sex_0" ? "am-icon-female" : "am-icon-male";

        if ($("#" + fid).length < 1)
            friendJS.appendChatList(fid, name, remark, img, sex, 1);

        var chatView = $("#" + fid + friendJS.chatStr);
        if ($(chatView).length < 1)
        {
            friendJS.appendChatView(fid, name);
            chatView = $("#" + fid + friendJS.chatStr);
        }
        var item = "";

        item += '<div class="chatroom-middle-left">';
        item += '<div class="chatroom-leftimg" onclick="Addcard(this,event)"><img src="' + path + img + '"/></div>';
        item += '<span class="chatroom-middle-leftname">' + name + '</span>';
        item += '<div class="chatroom-middle-left-cont">';
        item += '<span class="lefttrigon"></span>';
        item += '<span class="chatroom-font-size">' + msg + '</span>';
        item += '</div></div>';

        $(chatView).append(item);
        friendJS.updateChatListNotifyNum(fid, 1);
        friendJS.updateNotifyNum(1, $("#chat-notify-num"));
    },

    receiveRequest: function (data)
    {
        var today = new Date(Date.parse(new Date())).format("yyyy-MM-dd");
        friendJS.appendRequestList(today, JSON.parse(data["sendData"]), "");
        friendJS.updateNotifyNum(1, $("#friend-notify-num"));
        friendJS.updateNotifyNum(1, $("#friend-request-count"));
    },

    updateChatListNotifyNum: function (fid, num)
    {
        var item = $("#" + fid).next("div").find("div[data-type='notify']");
        if (item.length < 1)
            return;
        var notifyNum = num + parseInt($(item).text());
        if (notifyNum <= 0)
            $(item).hide();
        else
            $(item).show();
        $(item).text(notifyNum);
    },

    /**
     * 发送消息
     * @param fid 好友Id
     */
    sendMessage: function (fid)
    {
        var json = $("#" + fid).text();
        var data = JSON.parse(json);
        var chatView = $("#" + fid + friendJS.chatStr);
        var textArea = $(chatView).next().find("textarea");
        friendJS.message.sendData = $(textArea).val();
        friendJS.message.myTeamId = teamId;
        friendJS.message.receiveUserId = data["fid"];
        friendJS.message.dataType = friendJS.messageType.TEXT;
        console.log(JSON.stringify(friendJS.message));
        if (!window.WebSocket)
            return;
        if (friendJS.socket.readyState == WebSocket.OPEN)
            friendJS.socket.send(JSON.stringify(friendJS.message));
        else
            alert("WebSocket连接没有建立成功!");

        var item = "";
        item += '<div class="chatroom-middle-left chatroom-middle-right">';
        item += '<div class="chatroom-leftimg chatroom-rightimg" onclick="Addcard(this,event)">';
        item += '<img src="" alt=""/></div>';
        item += '<span class="chatroom-middle-leftname chatroom-middle-rightname">我</span>';
        item += '<div class="chatroom-middle-right-cont">';
        item += '<span class="righttrigon"></span>';
        item += '<span class="chatroom-font-size">' + $(textArea).val() + '</span>';
        item += '</div></div>';

        $(chatView).append(item);
        $(textArea).val("");
    },

    receiveCard: function ()
    {
        // <div class="chatroom-middle-left">
        // <div class="chatroom-leftimg " onclick="Addcard(this,event)"><img src="" alt=""/></div>
        // <span class="chatroom-middle-leftname">李云龙</span>
        // <div class="chatroom-middle-left-cont">
        // <!--三角形图标-->
        // <span class="lefttrigon"></span>
        // <span class="chatroom-middle-card">
        // <span class="chatroom-middle-card-text">个人名片</span>
        // <img class="chatroom-middle-card-img" src="" alt=""/>
        // <span class="chatroom-middle-card-name">李云龙</span>
        // </span>
        // </div>
        // </div>
    },

    sendCard: function ()
    {
        // <div class="chatroom-middle-left chatroom-middle-right">
        // <div class="chatroom-leftimg chatroom-rightimg" onclick="Addcard(this,event)">
        // <img src="" alt=""/></div>
        // <span class="chatroom-middle-leftname chatroom-middle-rightname">李云龙</span>
        // <div class="chatroom-middle-right-cont">
        // <!--三角形图标-->
        // <span class="righttrigon"></span>
        // <span class="chatroom-middle-card">
        // <span class="chatroom-middle-card-text">个人名片</span>
        // <img class=" chatroom-middle-card-img" src="" alt=""/>
        // <span class=" chatroom-middle-card-name">李云龙</span>
        // </span>
        // </div>
        // </div>
    },

    updateChatHistoryIsRead: function (fid)
    {
        var numItem = $("#" + fid).next("div").find("div[data-type='notify']");
        if (numItem.length < 1)
            return;
        var num = parseInt($(numItem).text());
        if (num > 0);
        {
            var url = path + "/user_updateChatHistoryIsRead.action";
            myjs.ajax_post(url);
            $(numItem).text(0);
            $(numItem).hide();
            friendJS.updateNotifyNum(-num, $("#chat-notify-num"));
        }
    },

    appendChatView: function (fid, name)
    {
        var item = "";
        item += '<div class="chatroom" style="display: none">';
        item += '<div class="chatroom-title">';
        item += '<span class="chatroom-name">' + name + '</span>';
        item += '</div>';
        item += '<div class="chatroom-middle" id="' + fid + friendJS.chatStr + '">';
        item += '</div>';
        item += '<div class="chatroom-foot">';
        item += '<textarea></textarea>';
        item += '<div class="chatroom-but">';
        item += '<div onclick="friendJS.sendMessage(\'' + fid + '\')" class="chatroom-but-send">';
        item += '发送';
        item += '</div></div></div></div>';
        $("#chat-room-list").append(item);
        friendJS.updateNotifyNum(0, $("#chat-notify-num"));
    },

    /**
     * 添加聊天窗口
     * @param fid 窗口 id（好友Id）
     * @param name 窗口名称
     */
    showChatView: function (fid, name)
    {
        if ($("#" + fid + "_chat").length < 1)
            friendJS.appendChatView(fid, name);
        $(".chatroom").hide();
        friendJS.updateChatHistoryIsRead(fid);
        $("#" + fid + "_chat").parent(".chatroom").show();
    },

    /**
     * 更新好友备注信息
     */
    updateFriendRemark: function ()
    {
        var url = path + "/user_updateFriendRemark.action";
        var params = {};
        params["friendId"] = $("#friend-id").val();
        params["friendRemarkName"] = $("#friend-remark-name").val();
        params["friendRemarkText"] = $("#friend-remark-text").val();

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data);
        });
    },

    /**
     * 获取未读消息
     */
    findNotReadMessage: function ()
    {
        var url = path + "/user_findNotReadChatHistoryCount.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            for (var i = 0; i < data.length; i++)
                friendJS.appendChatList(data[i]["sendUserId"],
                    data[i]["userName"], data[i]["friendRemarkName"],
                    data[i]["userImg"], data[i]["userSex"], data[i]["count"]);

            url = path + "/user_findNotReadChatHistory.action";
            params = {};
            myjs.ajax_post(url, params, function (data)
            {
                data = data.result;
                for (var i = 0; i < data.length; i++)
                {
                    var fid = data[i]["sendUserId"];
                    var name = data[i]["userName"];
                    var img = data[i]["userImg"];
                    var sex = data[i]["userSex"];
                    var msg = data[i]["sendData"];
                    friendJS.receiveMessage(fid, name, img, sex, msg);
                }
            });
        });
    },

    updateNotifyNum: function (num, item)
    {
        var realNum = parseInt($(item).attr("num"));
        realNum += num;
        if (realNum > 99)
            $(item).text("99+");
        else
            $(item).text(realNum);
        $(item).attr("num", realNum);
        if (realNum <= 0)
            $(item).hide();
        else
            $(item).show();
    },
};

$(function ()
{
    $(".add_friend_off").click(function ()
    {
        $(this).parent().parent().parent().fadeIn();
    });

    //input搜索显示
    var $seek_friend = $(".seek-friend");
    $seek_friend.bind('input propertychange', function ()
    {

        var value = $(this).val();
        if (value)
        {
            $(".listseek").fadeIn();
        } else
        {
            $(".listseek").fadeOut();
        }
    });

    $(".add-find-a").click(function ()
    {
        $("#shade").fadeIn();
    });

    $(".add-friend-off").click(function ()
    {
        $("#shade").fadeOut();
    });
    //备注框

    var $Acont = $(".add_acont");
    var $Cboxleft = $(".add_cbox_put");
    $Cboxleft.attr("disabled", false);
    $Acont.click(function ()
    {
        if ($Acont.hasClass("add_acont"))
        {
            $Cboxleft.attr("disabled", true);
            $(this).removeClass("add_acont").addClass("add_bcont").text("修改备注");
        } else
        {
            $Cboxleft.attr("disabled", false);
            $(this).removeClass("add_bcont").addClass("add_acont").text("保存修改");

        }

    });
    //限制描述文字字数
    $("#TextArea1").keydown(function ()
    {
        var curLength = $("#TextArea1").val().length;
        if (curLength >= 150)
        {
            var num = $("#TextArea1").val().substr(0, 150);
            $("#TextArea1").val(num);
            //          $("#textCount").text("超过150字数" );
        }
        //      else{
        //          $("#textCount").text(150-$("#TextArea1").val().length)
        //      }
    })

});

//添加名片
Addcard = function (item, e)
{
    console.log("111")
    var $Card = '<div class="card">' +
        '<div class="card-title">个人名片</div>' +
        '<div class="card-imgbox">' +
        '<div class="card-logo"><img src="" /></div>' +
        '<div class="card-name">' +
        '<span class="card-span">啊贾克斯<i class="am-icon-female"></i></span>' +
        '<span class="card-span">快看啊头上有风车</span>' +
        '</div>'

        +
        '</div>' +
        '<div class="card-text">' +
        '<div class="card-text-div"><span class="card-text-span">所在地址 :</span><span class="card-text-spancont">广东江门鹤山文华路381号旁边小道露露商店</span></div>' +
        '<div class="card-text-div"><span class="card-text-span">好友来源 :</span><span class="card-text-spancont">好友推荐</span></div>' +
        '<div class="card-text-div"><span class="card-text-span">备注名字 :</span><span class="card-text-spancont">大佬</span></div>' +
        '</div>' +
        '<div class="card-text-butbox" style="display: none;">' +
        '<div class="card-butbox">' +
        '<div class="card-text-but1">聊天</div>' +
        '<div class="card-text-but1">发送名片</div>' +
        '</div>' +
        '</div>' +
        '<div class="card-text-butbox">' +
        '<div class="card-butbox">' +
        '<div class="card-text-but2">添加好友</div>' +
        '</div>' +
        '</div>' +
        '</div>';

    if ($(item).find("div").length <= 0)
    {
        $(item).append($Card)

    }
    if ($(item).css("float") == "left")
    {

        $(item).find(".card").css({
            "top": 18 + "px",
            "left": 20 + "px"
        })
    }
    if ($(item).css("float") == "right")
    {

        $(item).find(".card").css({
            "top": 18 + "px",
            "right": 20 + "px"
        })
    }
    $(item).parents(".chatroom-middle-left").siblings().find(".card").remove()

}
$(document).click(function (e)
{
    var target = $(e.target);
    if (!target.closest(".chatroom-leftimg").length <= 0)
    {

    } else
    {
        $(".chatroom-leftimg div").remove()
    }

});

FriendData = function ()
{
    $("#FriendData").css("display", "block")
    $("#AddFriend").css("display", "none")
};
Chat = function ()
{
    $("#friendtoplist").tabs('open', $(".am-nav-tabs a").eq(1))
}

ListfixedA = function ()
{
    $("#AddFriend").css("display", "block")
    $("#FriendData").css("display", "none")
}
Addfriend = function (item)
{
    $(item).parents(".add-friend").css("display", "none")
}

Friendadd = function ()
{
    $(".add-friend").css("display", "block")
}