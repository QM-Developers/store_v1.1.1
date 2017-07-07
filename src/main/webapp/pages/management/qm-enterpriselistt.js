var qm_memberList = {
    init: function ()
    {
        qm_memberList.findMemberList();
    },

    findMemberList: function ()
    {
        var url = path + "/s/findMemberList.action";
        var params = {};

        params["departmentId"] = departmentId;

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
                    '<td>' + data[i]["positionName"] + '</td>' +
                    '<td><a class="personnel-details" href="' + path + '/pages/management/qm-member.jsp?"' + data[i]["userId"] + '>编辑</a></td>' +
                    '</tr>';
            $("#member-list").append(item);
        });
    },

    toDepartmentInfo: function ()
    {
        window.location.href = "qm-departments.jsp?" + departmentId;
    }
};