var qm_goodslist = {
    init: function ()
    {
        qm_goodslist.findGoodsList();
    },

    findGoodsList: function ()
    {
        var url = path + "/s/findGoodsList" + Constant.URL_SUFFIX;
        var params = {};
        params["pageNum"] = "1";
        params["pageSize"] = "10";

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            qm_goodslist.insertToGoodsList(data);
        });
    },

    insertToGoodsList: function (data)
    {
        var liList = $("#goods-list li");
        for (var i = 1; i < liList.length; i++)
            $(liList[i]).remove();

        var item = "";
        for (var i = 0; i < data.length; i++)
        {
            item += '<li class="goodslist-list-tr">' +
                '<div class="item1">' + (i + 1) + '</div>' +
                '<div class="item2">' + data[i]["goodsName"] + '</div>' +
                '<div class="item4">' + data[i]["goodsTypeName"] + '</div>' +
                '<div class="item3">';
            var standardList = data[i]["standardList"];
            for (var j = 0; j < standardList.length; j++)
                item += '<div class="item3-box">' +
                    '<div class="item3-2">' + standardList[j]["standardName"] + '</div>' +
                    '<div class="item3-3">' + standardList[j]["standardPrice"] + '</div>' +
                    '<div class="item3-4">' + standardList[j]["standardCount"] + '</div>' +
                    '</div>';
            item += '</div><div class="item4">' + new Date(data[i]["createDate"]).format("yyyy/MM/dd") + '</div>' +
                '<div class="item4">' +
                '<a onclick="qm_goodslist.toReleaseGoods(\'' + data[i]["goodsId"] + '\')">详情/编辑</a>' +
                '</div></li>';
        }
        $("#goods-list").append(item);
    },

    toReleaseGoods: function (gid)
    {
        var params = new qm_urlParams();
        params.option = Constant.urlOptUpdate;
        params.goodsId = gid;

        location.href = path + "/pages/mall/goods/qm-goodsRelease.jsp?" + urlUtil.objToParams(params);
    },

    findGoodsListByKeyword: function ()
    {
        var url = path + "/s/findGoodsListByKeyword" + Constant.URL_SUFFIX;
        var params = {};

        params["goodsName"] = $("#keyword").val().trim();

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            qm_goodslist.insertToGoodsList(data);
        });
    },
};