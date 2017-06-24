var dictJS = {
    findParDict: function ()
    {
        var url = path + "/sr/findParDict.action";

        myjs.ajax_post(url, {}, function (data)
        {
            var item = "";

            $("#par-dict-list").empty();

            for (var i = 0; i < data.length; i++)
                item += '<tr><td>' +
                    '<div class="am-radio">' +
                    '<label>' +
                    '<input type="radio" onclick="dictJS.findDictionary(\'' + data[i]["parDictId"] + '\')" name="doc-radio-1" checked/>'
                    + data[i]["parDictName"] +
                    '</label>' +
                    '</div></td></tr>';

            $("#par-dict-list").append(item);
        });
    },

    findDictionary: function (parDictId)
    {
        var url = path + "/sr/loadDict.action";
        var params = {"parDictId": parDictId};
        $("#parDictId").val(parDictId);

        myjs.ajax_post(url, params, function (data)
        {
            $("#dict-list").empty();
            if (!myjs.isNull(data))
            {
                $(data).each(function (i, obj)
                {
                    dictJS.addRow(obj);
                });
            } else
                dictJS.addRow();
        });
    },

    canAddRow: function ()
    {
        if ($(".dict-row").length == 0)
        {
            alert("请选择父类字典");
            return;
        }

        var arrInput = $(".dict-row:last input");
        var canAdd = true;
        $(arrInput).each(function (i, obj)
        {
            if (myjs.isNull($(obj).val()))
                canAdd = false;
        });
        if (canAdd == true)
            dictJS.addRow();
        else
            alert("数据未填写完整");
    },

    addRow: function (data)
    {
        var dictCode = "";
        var dictName = "";
        var dictIndex = $(".dict-row").length;
        if (!myjs.isNull(data))
        {
            dictCode = data['dictCode'];
            dictName = data['dictName']
        }

        var row = '<div class="col-lg-12 dict-row">' +
            '<input type="text" value="' + dictName + '" class="dict-input" placeholder="字典名称">' +
            '<input type="text" value="' + dictCode + '" class="dict-input" placeholder="字典编码">' +
            '<a href="###" onclick="dictJS.moveToLeft(this);">上移</a>&nbsp;&nbsp;<a href="###" onclick="dictJS.moveToRight(this);">下移</a></div>';

        $("#dict-list").append(row);
    },

    deleteRow: function ()
    {
        if ($(".dict-row").length <= 1)
        {
            alert("无可删除栏位");
            return;
        }

        var arrInput = $(".dict-row:last input");
        var canDelete = true;
        $(arrInput).each(function (i, obj)
        {
            if (!myjs.isNull($(obj).val()))
                canDelete = false;
        });
        if (canDelete == true)
            $(".dict-row:last").remove();
        else if (confirm("确定最后一条数据吗"))
            $(".dict-row:last").remove();
    },

    saveDict: function ()
    {
        if ($(".dict-row").length == 0)
        {
            alert("还未添加任何栏位");
            return;
        }
        var arrInput = $(".dict-row:last input");
        var flag = false;
        $(arrInput).each(function (i, obj)
        {
            if (myjs.isNull($(obj).val()))
                flag = true;
        });
        if (flag == true)
        {
            alert("数据未填写完整");
            return;
        }

        var params = {};
        var dictionaryCodes = "";
        var dictionaryNames = "";
        var sort = "";
        var dictRows = $(".dict-row");
        for (var i = 0; i < dictRows.length; i++)
        {
            dictionaryNames += $(dictRows[i]).find("input:eq(0)").val() + ",";
            dictionaryCodes += $(dictRows[i]).find("input:eq(1)").val() + ",";
            sort += i + ",";
        }
        var url = path + "/sr/saveDict.action";
        var parDictId = $("#parDictId").val();
        params["dictionaryCodes"] = dictionaryCodes;
        params["dictionaryNames"] = dictionaryNames;
        params["sort"] = sort;
        params["parDictId"] = parDictId;
        myjs.ajax_post(url, params, function (data)
        {
            if (parseInt(data))
            {
                $("#DictList").empty();
                dictJS.findDictionary(parDictId);
            }
        });
    },

    saveOrUpdateParDict: function ()
    {
        var url = path + "/sr/addParentDict.action";
        var params = {};
        params['parDictName'] = $("#parDictName").val();

        // 添加操作
        myjs.ajax_post(url, params,function (data)
        {
            dictJS.findParDict();
            $('#parDict-window').modal('close');
        });

        // params["parentId"] = $(selItem).attr("id");
        // 更新用的 url
        // url = path + "/sr/updateParentDict.action";
    },

    deleteParDict: function ()
    {
        var parDictId = $("#parDictId").val();

        if (myjs.isNull(parDictId))
        {
            alert("请选择字典");
            return;
        }

        if (confirm("是否删除"))
        {
            var url = path + "/sr/deleteParDict.action";
            $http.post(url, {"parDictId": parDictId}).then(function (response)
            {
                $scope.findParDict();
            });
        }
    },

    moveToRight: function (item)
    {
        var $current = $(item).parent("div");
        var $next = $($current).next("div");

        if ($next.length > 0)
            dictJS.moveDict($current, $next);
    },

    moveToLeft: function (item)
    {
        var $current = $(item).parent("div");
        var $prev = $($current).prev("div");

        if ($prev.length > 0)
            dictJS.moveDict($prev, $current);
    },

    moveDict:function (org, tar)
    {
        $(org).remove();
        $(tar).after(org);
    },
};