var qm_department = {

    optType: "",
    optTypes: {
        DELETE_DEPARTMENT: "delete"
    },

    init: function ()
    {
        qm_department.initPermission();
        if (!myjs.isNull(departmentId))
            qm_department.findDepartmentInfo();
        else
            Addduty("");
    },

    addOrUpdateDepartment: function ()
    {
        if ($("#Contbox .position-cont").length < 1)
            return;

        var url = path;
        if (myjs.isNull(departmentId))
            url += "/s/addDepartment.action";
        else
            url += "/s/updateDepartment.action";
        var params = {};
        var items = $("#Contbox").find(".position-cont");
        var positions = [];
        for (var i = 0; i < items.length; i++)
        {
            var permissions = [];
            var position = {};
            position["positionName"] = $(items[i]).find("input").val();
            position["positionId"] = $(items[i]).find("input").attr("id");
            var arr = $(items[i]).find("hidden").val().split(Constant.COMMA);
            for (var j = 0; j < arr.length - 1; j++)
                permissions.push({"permissionId": arr[j]});
            position["permission"] = JSON.stringify(permissions);
            positions.push(JSON.stringify(position));
        }

        params["departmentId"] = departmentId;
        params["departmentName"] = $("#department-name").val();
        params["createDate"] = $("#create-date").val();
        params["position"] = JSON.stringify(positions);

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data);
        });
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
        var ids = $("#" + pid).val().split(",");
        var checkbox = $("#worker-permission").find("input[type='checkbox']");
        for (var i = 0; i < checkbox.length; i++)
            $(checkbox[i])[0].checked = false;
        for (var i = 0; i < ids.length - 1; i++)
            for (var j = 0; j < checkbox.length; j++)
                if ($(checkbox[j]).val() == ids[i])
                    $(checkbox[j]).prop('checked', 'true');
        DutyPower();
    },

    initPermission: function ()
    {
        var url = path + "/s/listQmPermission.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data);
            data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
            {
                item += '<tr><td class="describe-td-1"><div class="describe">' + data[i]["name"] + '</div></td>';
                item += '<td><div><input type="checkbox"  value="' + data[i]["permissionId"] + '"/><span>' + data[i]["permissionName"] + '</span></div></td>' +
                    '<td><span class="duty-describe">' + data[i]["permissionDescribe"] + '</span></td></tr>';
            }
            $("#worker-permission").empty();
            $("#worker-permission").append(item);
        });
    },

    getPermission: function (data, type)
    {
        for (var i = 0; i < data.length; i++)
            if (data[i]["id"] == type)
                return data[i]["children"];
    },

    findDepartmentInfo: function ()
    {
        var url = path + "/s/findDepartmentInfo.action";
        var params = {};

        params["departmentId"] = departmentId;

        myjs.ajax_post(url, params, function (data)
        {
            data = myjs.replaceNull(data.result);

            var positionList = data["positionList"];
            $("#department-name").val(data["departmentName"]);
            $("#create-date").val(new Date(data["createDate"]).format("yyyy-MM-dd"));
            for (var i = 0; i < positionList.length; i++)
            {
                var perPosReList = positionList[i]["perPosReList"];
                var permission = "";
                for (var j = 0; j < perPosReList.length; j++)
                    if (!myjs.isNull(perPosReList[j]["permissionId"]))
                        permission += perPosReList[j]["permissionId"] + ",";
                var id = Addduty(positionList[i]["positionName"], positionList[i]["positionId"]);
                $("#" + id).val(permission);
            }
        });
    },

    deleteWindow: function ()
    {
        qm_department.optType = qm_department.optTypes.DELETE_DEPARTMENT;
        Delall("是否要删除 " + $("#department-name").val());
    },

    deleteInfo: function (text)
    {
        $("#delete-info .prompt-frame1").html(text);
        $("#delete-info").css("display", "block");
    },

    deletePosition: function (item, pid)
    {
        var url = path + "/s/countPositionMember.action";
        var params = {};

        if (myjs.isNull(pid))
        {
            Delduty(item);
            return;
        }

        params["positionId"] = pid;
        myjs.ajax_post(url, params, function (data)
        {
            data = parseInt(data.result);
            if (data > 0)
                qm_department.deleteInfo("该职位正在使用，不能删除");
            else
                Delduty(item);
        });
    },

    onPositiveClick: function ()
    {
        switch (qm_department.optType)
        {
            case qm_department.optTypes.DELETE_DEPARTMENT:
                qm_department.deleteDepartment();
                break;
        }
    },

    deleteDepartment: function ()
    {
        var url = path + "/s/deleteDepartment.action";
        var params = {};

        params["departmentId"] = departmentId;

        myjs.ajax_post(url, params, function (data)
        {
            var state = parseInt(data.state);
            if (state == 2)
                qm_department.deleteInfo("该部门有成员存在，不能删除");
            else if (state == 1)
                qm_department.deleteInfo("删除成功");
            PromptOff($("#Delall .prompt-frame-left")[0]);
            parent.qm_index.init();
            qm_department.goBack();
        });
    },

    goBack: function ()
    {
        history.go(-1);
    }
};