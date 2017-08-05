var qm_selllist = {
    init: function ()
    {
        qm_selllist.findDepartment();
        qm_selllist.initMap();
    },

    findDepartment: function ()
    {
        var url = path + "/s/findDepartmentList" + Constant.URL_SUFFIX;
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["departmentId"] + '">' + data[i]["departmentName"] + '</option>';
            $("#department-list").append(item);
            qm_selllist.findMemberList(data[0]["departmentId"]);
        });
    },

    findMemberList: function (did)
    {
        var url = path + "/s/findMemberList" + Constant.URL_SUFFIX;
        var params = {};

        params["departmentId"] = did;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            $("#member-list").empty();
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["userPhone"] + '" id="' + data[i]["userId"] + '">' + data[i]["userName"] + '</option>';
            $("#member-list").append(item);
            qm_selllist.findMemberPhone(data[0]["userPhone"]);
        });
    },

    findMemberPhone: function (phone)
    {
        $("#member-phone").val(phone);
    },

    initMap: function ()
    {
        var success = function (rep)
        {
            var location = rep.regeocode.pois[0].location;
            $("#branch-lat-lng").val(location.lat + "," + location.lng);
            $("#branch-area").val(rep.regeocode.pois[0].name);
        };

        var fail = function (rep)
        {
            console.log(rep);
        };
        dragMap.init("map", "tip", success, fail);
    },

    addBranch: function ()
    {
        var url = path + "/s/addBranch" + Constant.URL_SUFFIX;
        var params = {};

        params["branchName"] = $("#branch-name").val();
        params["branchArea"] = $("#branch-area").val();
        params["departmentId"] = $("#department-list").val();
        params["departmentName"] = $("#department-list option:selected").text();
        params["managerId"] = $("#member-list option:selected").attr("id");
        params["managerName"] = $("#member-list option:selected").text();
        params["managerPhone"] = $("#member-phone").val();
        params["latLng"] = $("#branch-lat-lng").val();

        console.log(params);
        // myjs.ajax_post(url,params,function (data)
        // {
        //     console.log(data);
        // });
    },
};