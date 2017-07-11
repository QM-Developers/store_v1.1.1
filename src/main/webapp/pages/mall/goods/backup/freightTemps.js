var freightJS = {
    freightFlag: true,

    init: function ()
    {
        freightJS.findFreightTemps();
    },

    findFreightTemps: function ()
    {
        var url = path + "/s/findFreightTemps.action";

        myjs.ajax_post(url, {}, function (data)
        {
            data = data.result;
            $("#fright-table").empty();
            var item = "";
            var rule = "";
            for (var i = 0; i < data.length; i++)
            {
                rule = data[i]["templateDefaultNum"] + " 件内 " + data[i]["templateDefaultPrice"] +
                    " 元，每增加 " + data[i]["templateAddNum"] + " 件，增加运费 " + data[i]["templateAddPrice"] + " 元";
                item += '<tr>' +
                    '<td>' + data[i]["templateFreightName"] + '</td>' +
                    '<td>' + (data[i]["templateFreightIsfree"] == 1 ? "包邮" : "不包邮") + '</td>' +
                    '<td>' + (data[i]["templateFreightIsfree"] == 1 ? "" : rule) + '</td>' +
                    '<td>' +
                    '<div class="am-btn-toolbar">' +
                    '<div class="am-btn-group am-btn-group-xs">' +
                    '<button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>' +
                    '<button onclick="freightJS.deleteFreightTemp(\'' + data[i]["templateFreightId"] + '\');" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</button>' +
                    '</div>' +
                    '</div>' +
                    '</td>' +
                    '</tr>';
            }

            $("#fright-table").append(item);
        });
    },

    isNegative: function (item)
    {
        if (item.value < 0)
            item.value = 0;
    },

    addFreightTemp: function ()
    {
        var url = path + "/s/addFreightTemp.action";
        var params = {};

        params['templateFreightName'] = $("#templateFreightName").val();
        params['templateFreightIsfree'] = $("input:radio[name='templateFreightIsfree']:checked").val();
        params['templateDefaultNum'] = $("#templateDefaultNum").val();
        params['templateDefaultPrice'] = $("#templateDefaultPrice").val();
        params['templateAddNum'] = $("#templateAddNum").val();
        params['templateAddPrice'] = $("#templateAddPrice").val();
        if (!freightJS.freightFlag)
        {
            params['templateDefaultNum'] = "";
            params['templateDefaultPrice'] = "";
            params['templateAddNum'] = "";
            params['templateAddPrice'] = "";
        }

        console.log(freightJS.getAreaFreight());

        // myjs.ajax_post(url, params, function (data)
        // {
        //     if (parseInt(data["state"]) == 1)
        //         freightJS.findFreightTemps();
        // });
    },

    getAreaFreight: function ()
    {
        var tr = $("#area-freight tbody tr");
        var values = [];
        for (var i = 0; i < tr.length; i++)
        {
            var value = {};
            value["areaFirstNum"] = $(tr[i]).find("input:eq(0)").val();
            value["areaFirstPrice"] = $(tr[i]).find("input:eq(1)").val();
            value["areaContinueNum"] = $(tr[i]).find("input:eq(2)").val();
            value["areaContinuePrice"] = $(tr[i]).find("input:eq(3)").val();
            values.push(value);
        }
        return values;
    },

    addAreaFreight: function ()
    {
        $("#area-freight").show();
        var item = "";
        item += '<tr>';
        item += '<td width="30%"><div></div><a href="###">编辑</a></td>';
        item += '<td width="14%"><input type="number"></td>';
        item += '<td width="14%"><input type="number"></td>';
        item += '<td width="14%"><input type="number"></td>';
        item += '<td width="14%"><input type="number"></td>';
        item += '<td width="14%"><a href="###">删除</a></td>';
        item += '</tr>';
        $("#area-freight tbody").append(item);
    },

    deleteFreightTemp: function (tid)
    {
        if (confirm("确定删除此模板吗？"))
        {
            var url = path + "/s/deleteFreightTemp.action";

            myjs.ajax_post(url, {"templateFreightId": tid}, function (data)
            {
                if (parseInt(data["state"]) == 1)
                    freightJS.findFreightTemps();
            });
        }
    },

    hideFreight: function ()
    {
        $("#define-fright").hide();
        freightJS.freightFlag = false;
    },

    showFreight: function ()
    {
        $("#define-fright").show();
        freightJS.freightFlag = true;
    },
};