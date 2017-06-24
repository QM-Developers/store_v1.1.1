var nx_teamJS = {
    init: function ()
    {
        nx_teamJS.findCorporationTree();
    },

    findCorporationTree: function ()
    {
        var url = path + "/s/findCorporationTree.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            var setting = {
                data: {
                    simpleData: {enable: true},
                    key: {url: ''}
                },
                callback: {onClick: nx_teamJS.zTreeOnClick}
            };
            $.fn.zTree.init($("#type-tree"), setting, data.result);
        });
    },

    zTreeOnClick: function (event, treeId, treeNode)
    {
        if (treeNode.isParent)
            return;

        var url = path + "/s/findDepartmentMember.action";
        var params = {};
        params["teamDepartmentId"] = treeNode.id;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<tr>' +
                    '<td>' + data[i]["departmentName"] + '</td>' +
                    '<td>' + data[i]["userName"] + '</td>' +
                    "<td>" + (parseInt(data[i]['roleId']) > 1003 ? '负责人' : '人员') + "</td>" +
                    '<td>' + data[i]["userPhone"] + '</td>' +
                    '<td><button type="button" class="am-btn am-btn-default">查看详情</button></td>' +
                    '</tr>';
            $("#attr-list").empty();
            $("#attr-list").append(item);
        });
    }
};