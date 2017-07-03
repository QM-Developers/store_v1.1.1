var qm_login = {
    login:function ()
    {
        var url = path + "/s/login.action";
        var params = {};

        params["userId"] = $("#user-id").text();
        params["userPassword"] = md5($("#user-password").val().trim());

        if(params["userId"] == null || params["userId"] == "")
        {
            alert("错误的操作");
            return;
        }

        myjs.ajax_post(url,params,function (data)
        {
            data = parseInt(data.result);
            if(data == 1)
            {
                $("body").css({'background': '', 'padding': '0'});
                $("body").load(path + "/pages/management/qm-index.jsp");
            }
        });
    }
};