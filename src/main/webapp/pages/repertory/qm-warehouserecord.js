/**
 * Created by Administrator on 2017/10/13.
 */
var qm_warehouserecord =
    {
        sign_seo: '',
        inint: function ()
        {
            sign_seo = '';
            var pageNum = $.trim($('#pageleft').text());
            var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
            qm_warehouserecord.getData(pageNum, pageSize);

        },

        getData: function (pageNum, pageSize)
        {
            var url = path + '/s/listCurrentRepertoryIncome.action';
            var params = {};
            if (sign_seo == 'timeSeo')
            {
                params['createDate'] = $('#d5221').val().trim();
                params['finishDate'] = $('#d5222').val().trim();
            }
            params['pageNum'] = pageNum;
            params['pageSize'] = pageSize;
            console.log(params, '获取数据')
            myjs.ajax_post(url, params, function (data)
            {
                console.log(data, '数据')
                var state = data.state;
                var pageCount = data.pageCount;
                var data = data.result;
                $('#pageright').text(pageCount)

                if (state == '1')
                {
                    qm_warehouserecord.listData(data)
                }
            })
        },
        timeSeo: function ()
        {
            sign_seo = 'timeSeo';
            var pageNum = '1';
            var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
            qm_warehouserecord.getData(pageNum, pageSize)
        },

        listData: function (data)
        {
            $('#ul-table tr:first-child').nextAll().remove();
            var item = '';
            console.log(data.length, 'data长度')
            for (var i = 0; i < data.length; i++)
            {
                item += '<tr class="list-tr">' +
                    '<td class="list-td">' + data[i]["recordCode"] + '</td>' +
                    '<td class="list-td">' + data[i]["operatorName"] + '</td>' +
                    '<td class="list-td">' + new Date(data[i]["createDate"]).format("yyyy/MM/dd") + '</td>' +
                    '<td class="list-td">' + data[i]["branchName"] + '</td>' +
                    '<td class="list-td">' +
                    '<a href="qm-addwarehouse.jsp?record=' + data[i]["recordId"] + '">查看详情</a>' +
                    '</td>' +
                    '</tr>';
            }
            $('#ul-table').append(item)
        },

        resetBut: function ()
        {
            sign_seo = '';
            $('#d5221').val('');
            $('#d5222').val('');
            var pageNum = '1';
            var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
            qm_warehouserecord.getData(pageNum, pageSize);
        },
        pageShowNum: function (item)
        {
            //选择显示数量
            $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
            $('#pageleft').text('1');
            var pageNum = '1';
            var pageSize = $.trim($(item).text());
            var pageCount = $.trim($('#pageright').text());
            var pageresult = (pageNum == pageCount) ? 1 : pageNum;
            $('#branchpageleft').html(pageresult);
            qm_warehouserecord.getData(pageNum, pageSize);
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
                qm_warehouserecord.getData(pageNum, pageSize);
            } else
            {
                if (pageSizetext <= 1)
                    return;
                var pageNum = Math.ceil((pageSizetext - 0) - 1);
                $('#pageleft').html(pageNum);
                qm_warehouserecord.getData(pageNum, pageSize);

            }
        },
    }