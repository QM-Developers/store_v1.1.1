var typeJS = {
    initTree: function ()
    {
        var url = path + "/s/findGoodsTypeTree.action";

        myjs.ajax_post(url, {}, function (data)
        {
            var setting = {
                data: {
                    simpleData: {enable: true},
                    key: {url: ''}
                },
                callback: {onClick: typeJS.zTreeOnClick}
            };
            $.fn.zTree.init($("#type-tree"), setting, data);
            console.log(data);
        });
    },

    saveOrUpdateType: function ()
    {
        var url = path + "/s/addGoodsType.action";
        var params = {};

        params["goodsTypeName"] = $("#type-name").val();
        params["goodsTypePid"] = $("#parent-type").val();

        myjs.ajax_post(url, params, function (data)
        {
            typeJS.initTree();
        });
    },

    zTreeOnClick: function (event, treeId, treeNode)
    {
        var url = path + "/s/findGoodsTypeAttr.action";
        var params = {};

        params['goodsTypeId'] = treeNode.id;
        $("#goodsTypeName").val(treeNode.name);
        $("#goodsTypeId").val(treeNode.id);

        $("#parent-type").empty();
        $("#parent-type").append('<option value="0">无</option><option value="' + treeNode.id + '">' + treeNode.name + '</option>');

        myjs.ajax_post(url, params, function (data)
        {
            $("#attr-list").empty();

            for (var i = 0; i < data.length; i++)
                typeJS.appendAttr(data[i]);
        });
    },

    appendAttr: function (data)
    {
        var item = '<tr>' +
            '<td>' + data["goodsTypeAttrName"] + '</td>' +
            '<td>' + data["goodsTypeAttrValue"] + '</td>' +
            '<td>' + (data["goodsTypeAttrConst"] == "1" ? "是" : "否") + '</td>' +
            '<td>' + data["goodsTypeAttrInputType"] + '</td>' +
            '</tr>';

        $("#attr-list").append(item);
    },

    saveOrUpdateAttr: function ()
    {
        var url = path + "/s/addGoodsTypeAttr.action";
        var params = {};

        params['goodsTypeId'] = $("#goodsTypeId").val();
        params['goodsTypeAttrInputType'] = $("#goodsTypeAttrInputType").val();
        params['goodsTypeAttrConst'] = $("input:radio[name='goodsTypeAttrConst']:checked").val();
        params['goodsTypeAttrValue'] = $("#goodsTypeAttrValue").val();
        params['goodsTypeAttrName'] = $("#goodsTypeAttrName").val();

        myjs.ajax_post(url, params, function (data)
        {
            params['goodsTypeAttrInputType'] = typeJS.getInputType(params['goodsTypeAttrInputType']);
            if(parseInt(data) > 0)
                typeJS.appendAttr(params);
        });
    },

    getInputType:function (data)
    {
        switch(data)
        {
            case "in_t_1":
                return "选择";
            case "in_t_0":
                return "填写";
            case "in_t_2":
                return "填写选择";
        }
    },

    deleteType: function ()
    {
        var nodes = $.fn.zTree.getZTreeObj("type-tree").getSelectedNodes();
        if (myjs.isNull(nodes))
            return;

        if (nodes[0].isParent)
            alert("当前类型不为空");
        else
        {
            if (!confirm("确定删除吗？"))
                return;

            var url = path + "/s/deleteGoodsType.action";
            myjs.ajax_post(url, {"goodsTypeId":$("#goodsTypeId").val()},function (data)
            {
               typeJS.initTree();
            });
        }
    },
};

