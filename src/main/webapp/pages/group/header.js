var header = {
    init: function ()
    {
        header.findDepartmentList();
    },

    findDepartmentList: function ()
    {
        var url = path + "/s/findDepartmentList" + Constant.URL_SUFFIX;
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            var item = "";
            item += '<option value="">所有部门</option>';
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["departmentId"] + '">' + data[i]["departmentName"] + '</option>';
            $("#search-department").empty();
            $("#search-department").append(item);
        });
    },

    toSearch: function ()
    {
        var json = {};
        json["keyword"] = $("#search-keyword").val();
        json["department"] = $("#search-department").val();
        document.cookie = JSON.stringify(json);
        window.location.href = path + "/pages/group/qm-groupseeklistt.jsp";
    },

};