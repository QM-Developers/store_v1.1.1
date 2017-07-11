var qm_seolist = {
    init: function ()
    {
        qm_seolist.findDepartmentList();
    },

    findDepartmentList: function ()
    {
        var url = path + "/s/findDepartmentList" + Constant.URL_SUFFIX;
        var params = {};

        params["myTeamId"] = myTeamId;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;

            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<li class="qm-c-li">' +
                    '<a class="list-a" href="' + path + "/pages/group/qm-department.jsp?" + data[i]["departmentId"] + '">' + data[i]["departmentName"] + '</a>' +
                    '</li>';

            $("#department-list").empty();
            $("#department-list").append(item);
        });
    }
};