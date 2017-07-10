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

    findMemberByNameOrPhone: function ()
    {
        var url = path + "/s/findMemberByNameOrPhone" + Constant.URL_SUFFIX;
        var params = {};

        params["userName"] = $("#search-keyword").val();
        params["teamDepartmentId"] = $("#search-department").val();

        myjs.ajax_post(url,params,function (data)
        {
            console.log(data);
        });
    }
};