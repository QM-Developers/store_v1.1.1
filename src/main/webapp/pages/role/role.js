var roleJS = {
    init: function ()
    {
        var url = path + "/s/findRoles.action";
        myjs.ajax_post(url, {}, function (data)
        {
            $("#role-list").empty();
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<tr>' +
                    '<td>' + data[i]["roleName"] + '</td>' +
                    '<td>' + data[i]["roleText"] + '</td>' +
                    '<td>' +
                    '<button onclick="roleJS.permissionWindow(\'' + data[i]["roleId"] + '\')" class="am-btn am-btn-default am-btn-xs am-text-secondary">分配权限</button>' +
                    '<button onclick="roleJS.roleWindow(\'' + data[i]["roleId"] + '\')" class="am-btn am-btn-default am-btn-xs">编辑</button>' +
                    '<button onclick="roleJS.deleteRole(\'' + data[i]["roleId"] + '\')" class="am-btn am-btn-default am-btn-xs am-text-danger">删除</button>' +
                    '</td>' +
                    '</tr>';

            $("#role-list").append(item);
        });
    },

    saveRolePermission: function ()
    {
        var treeObj = $.fn.zTree.getZTreeObj("roleTree");
        var nodes = treeObj.getCheckedNodes(true);
        var menuIds = "";

        for (var i = 0; i < nodes.length; i++)
            menuIds += nodes[i].id + ",";

        var url = path + "/s/addPermissionInRole.action";
        var params = {
            "multiId": menuIds,
            "singleId": $("#roleId").val()
        };

        myjs.ajax_post(url, params, function (data)
        {
            $('#permission-window').modal('close');
        });
    },

    permissionWindow: function (roleId)
    {
        var url = path + "/s/findPermissionByRole.action";
        var params = {};

        params['roleId'] = roleId;
        myjs.ajax_post(url, params, function (data)
        {
            var setting = {
                check: {enable: true},
                data: {simpleData: {enable: true}}
            };

            $.fn.zTree.init($("#roleTree"), setting, data);

            $('#permission-window').modal('open');
        });
    },

    roleWindow: function (roleId)
    {
        if (!myjs.isNull(roleId))
        {
            $("#update-role-label").text("编辑角色");
            var url = path + "/s/findRoleById.action";
            var params = {};
            params['roleId'] = roleId;
            myjs.ajax_post(url, params, function (data)
            {
                $("#roleName").val(data["roleName"]);
                $("#roleText").val(data["roleText"]);
                roleJS.init();
            });
        } else
            $("#update-role-label").text("新建角色");

        $("#roleId").val(roleId);
        $('#role-window').modal('open');
    },

    saveOrUpdateRole: function ()
    {
        var url = "";
        var params = {};
        params['roleName'] = $("#roleName").val();
        params['roleId'] = $("#roleId").val();
        params['roleText'] = $("#roleText").val();

        if (myjs.isNull(params['roleId']))
        {
            url = path + "/s/addRole.action";

            myjs.ajax_post(url, params, function (data)
            {
                $('#role-window').modal('close');
                roleJS.init();
            });
        } else
        {
            url = path + "/s/updateRole.action";

            myjs.ajax_post(url, params, function (data)
            {
                $('#role-window').modal('close');
                roleJS.init();
            });
        }
    },

    deleteRole: function (roleId)
    {
        if (confirm("确定删除吗？"))
        {
            var url = path + "/s/deleteRole.action";
            var params = {};
            params['roleId'] = roleId;

            myjs.ajax_post(url, params,function (data)
            {
                roleJS.init();
            });
        }
    },
};