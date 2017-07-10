var qm_personage = {
    init:function ()
    {
        qm_personage.findMemberDetail();
    },

    findMemberDetail:function ()
    {
        var url = path + "/s/findDepartmentMember.action";
        var params = {};

        params["memberId"] = memberId;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result[0];
            $("#user-img").attr("src",data["userImg"]);
            $("#user-name").val(data["userName"]);
            $("#user-sex").val(data["userSex"]);
            $("#user-phone").val(data["userPhone"]);
            $("#user-identity").val(data["userIdentity"]);
            $("#team-name").val(data["myTeamName"]);
            $("#department-name").val(data["departmentName"]);
            $("#position-name").val(data["positionName"]);
        });
    },


};