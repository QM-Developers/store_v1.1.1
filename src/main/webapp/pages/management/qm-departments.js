var qm_department = {
    permissionId: {
        WORKER_PERMISSION: "worker_permission",  // 办事权
        PERSONAL_PERMISSION: "personal_permission"   // 人事权
    },

    init: function ()
    {
        qm_department.initPermission();
    },

    addDepartment: function ()
    {
        var items = $("#Contbox").find(".position-cont");
        for (var i = 0; i < items.length; i++)
        {
            console.log($(items[i]).find("input").val());
            console.log($(items[i]).find("hidden").val());
        }
    },

    permissionClick: function ()
    {
        var permission = "";
        var permissionItem = $("#worker-permission").find("input[type='checkbox']:checked");
        for (var i = 0; i < permissionItem.length; i++)
            permission += $(permissionItem[i]).val() + ",";
        $("#" + $("#position-id").val()).val(permission);
        Dutyoff();
    },

    permissionWindow: function (item, pid)
    {
        $("#position-name").text($(item).prev(".position-input:eq(0)").find("input").val());
        $("#position-id").val(pid);
        DutyPower();
    },

    initPermission: function ()
    {
        var url = path + "/s/findQMPermissionTree.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = qm_department.getPermission(data.result, qm_department.permissionId.WORKER_PERMISSION);
            var item = "";
            for (var i = 0; i < data.length; i++)
            {
                var permission = data[i]["children"];
                item += '<tr><td class="describe-td-1"><div class="describe">' + data[i]["name"] + '</div></td>';
                for (var j = 0; j < permission.length; j++)
                    item += '<td><div><input type="checkbox" value="' + permission[j]["id"] + '"/><span>' + permission[j]["name"] + '</span></div></td>' +
                        '<td><span class="duty-describe">' + permission[j]["url"] + '</span></td></tr>';
            }
            $("#worker-permission").empty();
            $("#worker-permission").append(item);
            $("#worker-permission").append(item);
        });
    },

    getPermission: function (data, type)
    {
        for (var i = 0; i < data.length; i++)
            if (data[i]["id"] == type)
                return data[i]["children"];
    }
};