var qm_goodslist = {
    init: function ()
    {
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_goodslist.findGoodsList(pageNum, pageSize);
    },

    findGoodsList: function (pageNum, pageSize)
    {
        var url = path + "/s/findGoodsList" + Constant.URL_SUFFIX;
        var params = {};
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        myjs.ajax_post(url, params, function (data)
        {

            var pageCount = data.pageCount;
            data = data.result;

            $('#pageright').text(pageCount)
            $('#goods-list tr:first-child').nextAll().remove();
            qm_goodslist.insertToGoodsList(data);
        });
    },

    insertToGoodsList: function (data)
    {
        console.log(data,'搜索')
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
                '<a  onclick="qm_goodslist.toReleaseGoods(\'' + data[i]["goodsId"] + '\')">详情/编辑</a>' +
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
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        var url = path + "/s/findGoodsListByKeyword" + Constant.URL_SUFFIX;
        var params = {};
        params["goodsName"] = $("#keyword").val().trim();
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        myjs.ajax_post(url, params, function (data)
        {
            var pageCount = data.pageCount;
            $('#pageright').text(pageCount);
            data = data.result;
            qm_goodslist.insertToGoodsList(data);
        });
    },

    pageShowNum: function (item)
    {
        //选择显示数量
        $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
        var pageNum = '1';
        var pageSize = $.trim($(item).text());
        var pageCount = $.trim($('#pageright').text());
        var pageresult = (pageNum == pageCount) ? 1 : pageNum;
        $('#branchpageleft').html(pageresult);
        if (myjs.isNull($("#keyword").val().trim()))
            qm_goodslist.findGoodsList(pageNum, pageSize);
        else
            qm_goodslist.findGoodsListByKeyword()
        $('#pageleft').text('1');
    },
    NextPage: function (item)
    {
        //翻页
        var pagetext = $.trim($(item).text());
        var pageSizetext = $.trim($('#pageleft').text());
        var pageCount = $.trim($('#pageright').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        if (pagetext == '下一页')
        {
            if (pageSizetext >= pageCount)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) + 1);
            $('#pageleft').html(pageNum);

            if (myjs.isNull($("#keyword").val().trim()))
                qm_goodslist.findGoodsList(pageNum, pageSize);
            else
                qm_goodslist.findGoodsListByKeyword()
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            if (myjs.isNull($("#keyword").val().trim()))
                qm_goodslist.findGoodsList(pageNum, pageSize);
            else
                qm_goodslist.findGoodsListByKeyword()
        }
    },
};