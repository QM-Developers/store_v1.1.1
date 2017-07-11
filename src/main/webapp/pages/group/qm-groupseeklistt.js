var qm_groupseeklist = {
    keyword: "",
    department: "",

    init: function ()
    {
        qm_groupseeklist.initData();
        qm_groupseeklist.initUI();
        qm_groupseeklist.findMemberByNameOrPhone();
    },

    initUI: function ()
    {
        $("#keyword").text(qm_groupseeklist.keyword);
    },

    initData: function ()
    {
        var json = JSON.parse(document.cookie);
        qm_groupseeklist.keyword = json.keyword;
        qm_groupseeklist.department = json.department;
    },

    findMemberByNameOrPhone: function ()
    {
        var url = path + "/s/findMemberByNameOrPhone" + Constant.URL_SUFFIX;
        var params = {};

        params["userName"] = qm_groupseeklist.keyword;
        params["teamDepartmentId"] = qm_groupseeklist.department;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;

            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<tr>' +
                    '<td>' + data[i]["userName"] + '</td>' +
                    '<td>' + data[i]["userSex"] + '</td>' +
                    '<td>' + data[i]["userPhone"] + '</td>' +
                    '<td>' + data[i]["departmentName"] + '</td>' +
                    '<td class="tab-td4">' + data[i]["positionName"] + '</td>' +
                    '<td>' +
                    '<a class="personnel-details" href="' + path + '/pages/group/qm-personage.jsp?' + data[i]["memberId"] + '">详细信息</a>' +
                    '</td>' +
                    '</tr>';
            $("#result-list").empty();
            $("#result-list").append(item);
        });
    }
};