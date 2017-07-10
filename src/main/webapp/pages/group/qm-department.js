var qm_department = {
    init: function ()
    {
        qm_department.findDepartmentDetail();
        if (departmentId != Constant.DEPARTMENT_MANAGER)
            qm_department.findDepartmentMember(departmentId);
    },

    findDepartmentDetail: function ()
    {
        var url = path + "/s/findDepartmentDetail.action";
        var params = {};

        if (departmentId == Constant.DEPARTMENT_MANAGER)
            params["departmentType"] = departmentId;
        else
            params["teamDepartmentId"] = departmentId;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            $("#team-name").text(data["myTeamName"]);
            $("#department-name").text(data["teamDepartmentName"]);
            $("#member-count").text(data["count"]);
            $("#create-date").text(new Date(data["createDate"]).format("yyyy-MM-dd"));
            if (departmentId == Constant.DEPARTMENT_MANAGER)
                qm_department.findDepartmentMember(data["teamDepartmentId"]);
        });
    },

    findDepartmentMember: function (did)
    {
        var url = path + "/s/findDepartmentMember.action";
        var params = {};

        params["teamDepartmentId"] = did;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<tr>' +
                    '<td class="list-th1">' + data[i]["userName"] + '</td>' +
                    '<td>' + data[i]["userSex"] + '</td>' +
                    '<td>' + data[i]["userPhone"] + '</td>' +
                    '<td>' + data[i]["departmentName"] + '</td>' +
                    '<td>' + data[i]["positionName"] + '</td>' +
                    '<td>' +
                    '<a class="personnel-details" href="' + path + '/pages/group/qm-personage.jsp?' + data[i]["memberId"] + '">详细信息</a>' +
                    '</td>' +
                    '</tr>';
            $("#member-list").append(item);
        });
    },
};