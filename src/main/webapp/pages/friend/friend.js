var friendJS = {
    init: function ()
    {
        var url = path + "/user_findFriends.action";

        myjs.ajax_post(url, {}, function (data)
        {
            $("#friend-list").empty();
            data = data.result;
            var item = "";

            for (var i = 0; i < data.length; i++)
            {
                var flag = myjs.isNull(data[i]["friendRemardName"]);
                item += '<div class="sort_list" onclick="friendJS.findFriendByPhone(\''+data[i]["userPhone"]+'\')">' +
                    '<div class="num_logo"><img src="' + path + data[i]["userImg"] + '"/></div>' +
                    '<div class="num_name">' + ( flag? "" : data[i]["friendRemardName"] + "（") + data[i]["userName"] + ( flag? "" :"）")+'</div>' +
                    '</div>';
            }
            $("#friend-list").append(item);
            initials();
        });
    },

    findFriendByPhone:function (userPhone)
    {
        var url = path + "/user_findFriendByPhone.action";

        myjs.ajax_post(url,{"userPhone":userPhone},function (data)
        {
            console.log(data);

            data = data.result;
            if(myjs.isNull(data))
                return;

            friendJS.setFriendValue(data);
        });
    },

    setFriendValue:function (data)
    {
        if(!myjs.isNull(data))
        {
            $("#userName").text(data["userName"]);
            $("#userPhone").text(data["userPhone"]);
            $("#userArea").text(data["userArea"]);
            $("#friendOrigin").text(data["friendOrigin"]);
            $("#userImg").attr("src", path + data["userImg"]);
            $("#friendRemardName").val(data["friendRemardName"]);
            $("#friendRemardPhone").val(data["friendRemardPhone"]);
            $("#friendRemardText").val(data["friendRemardText"]);
        }else
        {
            $("#userName").text("");
            $("#userPhone").text("");
            $("#userArea").text("");
            $("#friendOrigin").text("");
            $("#userImg").attr("src","");
            $("#friendRemardName").val("");
            $("#friendRemardPhone").val("");
            $("#friendRemardText").val("");
        }
    },

    findUserByPhone:function ()
    {
        var url = path + "/user_findUserByPhone.action";
        var userPhone = $("#s_friendPhone").val();

        myjs.ajax_post(url,{"userPhone":userPhone},function (data)
        {
            data = data.result;

            if(myjs.isNull(data))
                return;

            $("#friendName").text(data["userName"]);
            $("#friendPhone").text(data["userPhone"]);
            $("#friendArea").text(data["userArea"]);
            $("#friendImg").attr("src",path + data["userImg"]);
        });
    },

    saveOrUpdateRemard:function ()
    {
        var url = path + "/user_updateFriendRemard.action";
        var params = {};
        params["userPhone"] = $("#userPhone").text();
        params["friendRemardName"] = $("#friendRemardName").val();
        params["friendRemardPhone"] = $("#friendRemardPhone").val();
        params["friendRemardText"] = $("#friendRemardText").val();

        myjs.ajax_post(url,params,function (data)
        {
            if(parseInt(data["state"]) == 1)
                friendJS.init();
        });
    },

    addFriend:function ()
    {
        var url = path + "/user_addFriend.action";
        var params = {};

        params["userPhone"] = $("#friendPhone").text().trim();
        params["friendOrigin"] = "手机号查找";

        myjs.ajax_post(url,params,function (data)
        {
            if(parseInt(data["state"]) == 1)
            {
                friendJS.init();
                $("#friend-window").modal('close');
            }
        });
    },

    deleteFriend:function ()
    {
        if(!confirm("确定要删除此好友吗"))
            return;

        var url = path + "/user_deleteFriend.action";
        var params = {};

        params["userPhone"] = $("#userPhone").text().trim();
        myjs.ajax_post(url,params,function (data)
        {
            if(parseInt(data["state"]) == 1)
            {
                friendJS.init();
                friendJS.setFriendValue();
            }
        });
    },

    test:function ()
    {
        $("#friend-list").empty();
    },
};

$(function ()
{
    $(".add_friend_off").click(function ()
    {
        $(this).parent().parent().parent().fadeIn();
    });

    //input搜索显示
    var $seek_friend = $("#seek_friend");
    $seek_friend.bind('input propertychange', function ()
    {

        var value = $(this).val();
        if (value)
        {
            $("#listseek").fadeIn();

        } else
        {
            $("#listseek").fadeOut();
        }
    });

    $(".add_find_a").click(function ()
    {
        $("#shade").fadeIn();
    });

    $(".add_friend_off").click(function ()
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