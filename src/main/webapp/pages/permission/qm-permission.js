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
        });
    },

    zTreeOnClick: function (event, treeId, treeNode)
    {
        $("#permissionName").val(treeNode.name);
        $("#permissionUrl").val(treeNode.url);
        $("#permissionId").val(treeNode.id);
        $("#permissionPid").empty();
        var item = '';
        var pNode = treeNode.getParentNode();
        if (!myjs.isNull(pNode))
            item += '<option value="' + pNode.id + '">' + pNode.name + '</option>';
        else
            item = '<option value="0">无</option>';

        $("#permissionPid").append(item);
    },

    saveOrUpdatePermission: function ()
    {
        var permissionId = $("#permissionId").val();
        var url = '';
        var params = {
            'permissionId': permissionId,
            'permissionName': $("#permissionName").val(),
            'permissionUrl': $("#permissionUrl").val(),
            'permissionPid':$("#permissionPid").val()
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

    addPermission:function ()
    {
        $("#permissionId").val('');
        $("#permissionName").val('');
        $("#permissionUrl").val('');
        $("#permissionPid").empty();

        var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
        var nodes = treeObj.getSelectedNodes();
        var treeNode = nodes[0];
        var item = '';
        item += '<option value="0">无</option>';
        if (!myjs.isNull(treeNode))
            item += '<option value="' + treeNode.id + '">' + treeNode.name + '</option>';

        $("#permissionPid").append(item);
    },

    delPermission:function ()
    {
        var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
        var nodes = treeObj.getSelectedNodes();

        if(myjs.isNull(nodes))
        {
            alert("请选择一条权限");
            return;
        }
        if(nodes[0].isParent)
        {
            alert("不能选择权限集合");
            return;
        }

        if (confirm("确定删除吗？"))
        {
            var url = path + "/s/deletePermission.action";
            var params = { 'permissionId' :$("#permissionId").val()};

            myjs.ajax_post(url,params,function (data)
            {
                console.log(data);
                permissionJS.initTree();
            });
        }
    },

};