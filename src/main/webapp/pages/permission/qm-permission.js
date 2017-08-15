var qm_permission = {
    initTree: function ()
    {
        qm_permission.findPermissionTree();
        qm_permission.findQMPermissionTree();
    },

    findQMPermissionTree: function ()
    {
        var url = path + "/s/findQMPermissionTree.action";

        myjs.ajax_post(url, null, function (data)
        {
            data = data.result;
            var setting = {
                data: {
                    simpleData: {enable: true},
                    key: {url: ''}
                },
                callback: {onClick: qm_permission.zTreeOnClick}
            };

            $.fn.zTree.init($("#qm-permission-tree"), setting, data);

            var item = "";
            item += '<option value="0">--无--</option>';
            for (var i = 0; i < data.length; i++)
                if (myjs.isNull(data[i]["url"]))
                    item += '<option value="' + data[i]["id"] + '">' + data[i]["name"] + '</option>';
            $("#permissionPid").empty();
            $("#permissionPid").append(item);
        });
    },

    findPermissionTree: function ()
    {
        var url = path + "/s/findPermissionTree.action";

        myjs.ajax_post(url, null, function (data)
        {
            var setting = {
                data: {
                    simpleData: {enable: true},
                    key: {url: ''}
                },
                check: {
                    enable: true
                },
                callback: {onClick: qm_permission.zTreeOnClick}
            };

            $.fn.zTree.init($("#permissionTree"), setting, data);
        });
    },

    zTreeOnClick: function (event, treeId, treeNode)
    {
        $("#permissionName").val(treeNode.name);
        $("#permissionDescribe").val(treeNode.url);
        $("#permissionId").val(treeNode.id);
    },

    saveOrUpdatePermission: function ()
    {
        var permissionRe = "";
        var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
        var nodes = treeObj.getChangeCheckedNodes();
        for (var i = 0; i < nodes.length; i++)
            if (!nodes[i].isParent)
                permissionRe += nodes[i].id + ",";

        var permissionId = $("#permissionId").val();
        var url = '';
        var params = {
            'permissionId': permissionId,
            'permissionName': $("#permissionName").val(),
            'permissionDescribe': $("#permissionDescribe").val(),
            'permissionPid': $("#permissionPid").val(),
            'permissionRe': permissionRe
        };

        if (myjs.isNull(permissionId))
            url = path + "/s/addQMPermission.action";
        else
        {
            url = path + "/s/updateQMPermission.action";
            var qmTree = $.fn.zTree.getZTreeObj("qm-permission-tree");
            params['permissionPid'] = qmTree.getSelectedNodes()[0].getParentNode().id;
        }

        myjs.ajax_post(url, params, function (data)
        {
            qm_permission.initTree();
        });
    },

    addPermission: function ()
    {
        $("#permissionId").val('');
        $("#permissionName").val('');
        $("#permissionDescribe").val('');
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
                console.log(data);
                qm_permission.initTree();
            });
        }
    },

};