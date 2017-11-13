/**
 * 登录操作集合
 */
var login = {
    /**
     * 执行登录
     */
    login: function ()
    {
        if (!login.checkInput())
            return;
        var url = path + "/login_on_browser.action";
        var params = {
            "userPhone": $("#userPhone").val(),
            "userPassword": md5($("#userPassword").val()),
            "myTeamId": $("#myTeamId").val()
        };

        myjs.ajax_post(url, params, function (data)
        {
            if (parseInt(data.state) != 1)
            {
                alert(data);
                return;
            } else
                window.location.href = path + "/pages/index/qm-indexLogin.jsp";
        });
    },

    /**
     * 检查用户名和密码
     * @returns {boolean}
     */
    checkInput: function ()
    {
        var userName = $("#userPhone").val().trim();
        var password = $("#userPassword").val().trim();
        var myTeamId = $("#myTeamId").val().trim();
        if (myjs.isNull(userName) || myjs.isNull(password) || myjs.isNull(myTeamId))
        {
            alert("请将信息填写完整");
            return false;
        } else
            return true;
    },

    test: function ()
    {
    }

};