var permissionJS = {
    initTree: function ()
    {
        var url = path + "/s/findPermissionTree.action";

        myjs.ajax_post(url, null, function (data)
        {
            var setting = {
                data: {
                    simpleData: {enable: true},
                    key: {url: ''}
                },
                callback: {onClick: permissionJS.zTreeOnClick}
            };

            $.fn.zTree.init($("#permissionTree"), setting, data);
            var item = "";
            item += '<option value="0">--无--</option>';
            for (var i = 0; i < data.length; i++)
                if (myjs.isNull(data[i]["url"]))
                    item += '<option value="' + data[i]["id"] + '">' + data[i]["name"] + '</option>';

            $("#permissionPid").empty();
            $("#permissionPid").append(item);
        });
    },

    zTreeOnClick: function (event, treeId, treeNode)
    {
        $("#permissionName").val(treeNode.name);
        $("#permissionUrl").val(treeNode.url);
        $("#permissionId").val(treeNode.id);
        var pNode = treeNode.getParentNode();
    },

    saveOrUpdatePermission: function ()
    {
        var permissionId = $("#permissionId").val();
        var url = '';
        var params = {
            'permissionId': permissionId,
            'permissionName': $("#permissionName").val(),
            'permissionUrl': $("#permissionUrl").val(),
            'permissionPid': $("#permissionPid").val()
        };

        if (myjs.isNull(permissionId))
            url = path + "/s/addPermission.action";
        else
            url = path + "/s/updatePermission.action";

        myjs.ajax_post(url, params, function (data)
        {
            permissionJS.initTree();
        });
    },

    addPermission: function ()
    {
        $("#permissionId").val('');
        $("#permissionName").val('');
        $("#permissionUrl").val('');
    },

    delPermission: function ()
    {
        var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
        var nodes = treeObj.getSelectedNodes();

        if (myjs.isNull(nodes))
        {
            alert("请选择一条权限");
            return;
        }
        if (nodes[0].isParent)
        {
            alert("不能选择权限集合");
            return;
        }

        if (confirm("确定删除吗？"))
        {
            var url = path + "/s/deletePermission.action";
            var params = {'permissionId': $("#permissionId").val()};

            myjs.ajax_post(url, params, function (data)
            {
                permissionJS.initTree();
            });
        }
    },

    cancelUpdate:function ()
    {
        $("#permissionId").val("");
        $("#permissionName").val("");
        $("#permissionUrl").val("");
    },
};