var qm_branchwarehouse={
    inint:function ()
    {
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        signCheck = parent.document.getElementById('positionName').getAttribute('name');

        qm_branchwarehouse.getData(pageNum, pageSize)
    },
    getData:function (pageNum, pageSize)
    {

            var url = path + "/s/listBranch.action";
            var params = {};
            params["pageNum"] = pageNum;
            params["pageSize"] = pageSize;
            myjs.ajax_post(url, params, function (data)
            {
                console.log(data)
                $('#list-table tr:first-child').nextAll().remove();
                var pageCount = data.pageCount;
                $("#pageright").text(pageCount);
                var data = data.result;
                var item = "";
                for (var i = 0; i < data.length; i++)
                {
                    item += '<tr>' +
                        '<td>' + data[i].branchName + '</td>' +
                        '<td>' + data[i].departmentName + '</td>' +
                        '<td>' + data[i].managerName + '</td>' +
                        '<td>' + data[i].managerPhone + '</td>' +
                        '<td>' +
                        '<a class="personnel-details" href="qm-warehouse.jsp?looksingle=' + data[i].branchId + '">查看库存</a>';
                    if (signCheck == 'logistics_manager' )
                    {
                        item += '<a class="personnel-details" href="qm-checkwarehouse.jsp?branch=' + data[i].branchId +'&branchName='+escape(data[i].branchName)+ '">创建盘点单</a>';
                    }
                       item += '</td></tr>';
                }
                $("#list-table").append(item);
            });

    },
    pageShowNum: function (item)
    {
        //选择显示数量
        $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($(item).text());
        var pageCount = $.trim($('#pageright').text());
        var pageresult = (pageNum == pageCount) ? 1 : pageNum;
        var Clientid = $.trim($('#Clientid>a:first-child').attr('id'));
        $('#branchpageleft').html(pageresult);
        qm_branchwarehouse.getData(pageNum, pageSize)
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
            qm_branchwarehouse.getData(pageNum, pageSize)
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_branchwarehouse.getData(pageNum, pageSize)
        }
    },
}