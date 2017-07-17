var qm_memberList = {
    memberList:$("#member-list"),

    init: function ()
    {
        qm_memberList.initUI();
        qm_memberList.findMemberList();
    },

    initUI: function ()
    {
        if (myjs.isNull(departmentId))
            $("#btn-update-department").hide();
    },

    findMemberList: function ()
    {
        var url = path + "/s/findMemberList.action";
        var params = {};

        params["departmentId"] = departmentId;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            for (var i = 0; i < data.length; i++)
            qm_memberList.insertMemberColumn(
                data[i]["userName"],data[i]["userSex"],
                data[i]["userPhone"],data[i]["departmentName"],
                data[i]["positionName"],data[i]["userId"]
            );
        });
    },

    insertMemberColumn: function (name, sex, phone, department, position, id)
    {
        var item = "";
        item += '<tr>' +
            '<td>' + name + '</td>' +
            '<td>' + sex + '</td>' +
            '<td>' + phone + '</td>' +
            '<td>' + department + '</td>' +
            '<td>' + position + '</td>' +
            '<td><a class="personnel-details" href="' + path + '/pages/management/qm-member.jsp?' + id + '">编辑</a></td>' +
            '</tr>';
        qm_memberList.memberList.append(item);
    },

    searchMember: function ()
    {
        var url = path + "/s/findMemberByNameOrPhone" + Constant.URL_SUFFIX;
        var params = {};

        params["userName"] = $("#search-keyword").val().trim();
        params["teamDepartmentId"] = departmentId;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            qm_memberList.memberList.empty();
            for(var i = 0;i<data.length;i++)
                qm_memberList.insertMemberColumn(
                    data[i]["userName"],data[i]["userSex"],
                    data[i]["userPhone"],data[i]["departmentName"],
                    data[i]["positionName"],data[i]["memberId"]
                );
        });
    },

    toDepartmentInfo: function ()
    {
        window.location.href = "qm-departments.jsp?" + departmentId;
    }
};