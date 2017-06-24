var registerJS = {
    register:function ()
    {
        var url = path + "/user_register.action";
        var params = {};

        params["myTeamId"] = $("#myTeamId").val();
        params["userPhone"] = $("#userPhone").val();
        params["hxName"] = $("#userPhone").val();
        params["hxPassword"] = $("#userPhone").val();
        params["userPassword"] = md5($("#userPassword").val());

        myjs.ajax_post(url,params,function (data)
        {
            console.log(data);
        });
    },
};