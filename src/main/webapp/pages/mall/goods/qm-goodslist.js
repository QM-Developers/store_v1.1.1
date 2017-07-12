var qm_goodslist = {
    init: function ()
    {
        qm_goodslist.findGoodsList();
    },

    findGoodsList: function ()
    {
        var url = path + "/s/findGoodsList" + Constant.URL_SUFFIX;
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            console.log(data);
            var item = "";
            for (var i = 0; i < data.length; i++)
            {
                item += '<li class="goodslist-list-tr">' +
                    '<div class="item1">' + (i + 1) + '</div>' +
                    '<div class="item2">' + data[i]["goodsName"] + '</div>' +
                    '<div class="item3">';
                var standardList = data[i]["standardList"];
                for (var j = 0; j < standardList.length; j++)
                    item += '<div class="item3-box">' +
                        '<div class="item3-1">' + data[i]["goodsTypeName"] + '</div>' +
                        '<div class="item3-2">' + standardList[j]["standardName"] + '</div>' +
                        '<div class="item3-3">' + standardList[j]["standardPrice"] + '</div>' +
                        '<div class="item3-4">' + standardList[j]["standardCount"] + '</div>' +
                        '<div class="item3-5">' + new Date(data[i]["createDate"]).format("yyyy/MM/dd") + '</div>' +
                        '<div class="item3-6">' +
                        '<a href="' + path + "/pages/mall/goods/qm-goodsRelease.jsp?" + data[i]["goodsId"] + '">详情/编辑</a>' +
                        '</div></div>';
                item += '</div></li>';
            }
            $("#goods-list").append(item);
        });
    },
};