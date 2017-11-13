/**
 * Created by Administrator on 2017/10/16.
 */
var qm_transferRtecord = {
    sign_transfer: '',
    inint: function ()
    {
        sign_transfer = '';
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        signCheck = parent.document.getElementById('positionName').getAttribute('name');

        if (signCheck == 'salesman' || signCheck == 'salesman_manager')
        {
            $('#seoSelBox').remove();
            qm_transferRtecord.getThisbranch(pageNum, pageSize);
            console.log('盘点1')
        } else
        {
            qm_transferRtecord.getBranch();
            qm_transferRtecord.getData(pageNum, pageSize)
            console.log('盘点2')
        }
        qm_transferRtecord.stataList();
    },
    stataList: function ()
    {
        var $item = '<option value="10">待审批</option>' +
            '<option value="11">已通过</option>' +
            '<option value="12">已签收</option>';
        $('#stataSeo').append($item);
    },
    getBranch: function ()
    {
        //获取分销点列表
        var url = path + '/s/listBranch.action';
        var params = {};
        params['pageNum'] = '1';
        params['pageSize'] = '999';
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                var item = '';
                for (var i = 0; i < data.length; i++)
                {
                    item += '<option value="' + data[i]['branchId'] + '" >' + data[i]['branchName'] + '</option>';
                }
                $('#seoSel').append(item);
            }
        })
    },
    getBranchRecord: function (item)
    {
        //部门搜索
        thisid = item;

        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        sign_transfer = 'Recordseo';
        qm_transferRtecord.getData(pageNum, pageSize);
    },

    getData: function (pageNum, pageSize)
    {
        //获取数据
        var url = path + '/s/listRepertoryApply.action';
        ;
        var params = {};

        if (sign_transfer == 'Recordseo')
        {
            params['branchId'] = thisid;
            params['pageNum'] = pageNum;
            params['pageSize'] = pageSize;
            console.log(thisid)
        } else if (sign_transfer == 'stataSeo')
        {
            params['applyStatus'] = $('#stataSeo').val();
            params['pageNum'] = pageNum;
            params['pageSize'] = pageSize;
        }
        else
        {
            params['pageNum'] = pageNum;
            params['pageSize'] = pageSize;
        }
        console.log(params, '获取数据')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '数据')
            var state = data.state;
            var pageCount = data.pageCount;
            console.log(pageCount, '页数')
            var data = data.result;
            $('#pageright').text(pageCount)

            if (state == '1')
            {
                qm_transferRtecord.listData(data)
            }
        })
    },


    listData: function (data)
    {
        //创建列表
        $('#ul-table tr:first-child').nextAll().remove();
        var item = '';
        console.log(data.length, 'data长度')
        for (var i = 0; i < data.length; i++)
        {
            item += '<tr class="list-tr">' +
                '<td class="list-td" >' + data[i]["proposerName"] + '</td>' +
                '<td class="list-td">' + data[i]["applyCode"] + '</td>' +
                '<td class="list-td">' + new Date(data[i]["createDate"]).format("yyyy/MM/dd") + '</td>' +
                '<td class="list-td">' + (data[i]["acceptDate"] == null?'': new Date(data[i]["acceptDate"]).format("yyyy/MM/dd")) + '</td>' +
                '<td class="list-td">' + qm_transferRtecord.statusType(data[i]["applyStatus"]) + '</td>' +
                '<td class="list-td">' +
                '<a href="qm-addwarehouse.jsp?apply=' + data[i]["applyId"] + '">详细信息</a>' +
                '</td>' +
                '</tr>';

        }
        $('#ul-table').append(item)
    },
    statusType: function (num)
    {
        //状态
        var text = '';
        switch (num)
        {
            case 10:
                text = '待审批';
                break;
            case 11:
                text = '已通过';
                break;
            case 12:
                text = '已签收';
                break;
            default:
                break;
        }
        return text;
    },
    getThisbranch: function (pageNum, pageSize)
    {
        //    获取当前销售点

        var url = path + '/s/listCurrentRepertoryApply.action';
        var params = {};
        if (sign_transfer == 'stataSeo')
        {
            params['applyStatus'] = $('#stataSeo').val();

        }
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var pageCount = data.pageCount;
            var state = data.state;
            var data = data.result;
            $('#pageright').text(pageCount)
            if (state == '1')
            {
                // $('#headerName').attr('name', data.branchId);
                if (sign_transfer == '')
                {
                    sign_transfer = 'thisbranch';
                }
                qm_transferRtecord.listData(data)
            }
        })
    },
    stataSeo: function ()
    {
        var pageNum = '1';
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());

        qm_transferRtecord.stataData(pageNum, pageSize)
        console.log(sign_transfer, '状态')
    },
    stataData: function (pageNum, pageSize)
    {
        // if (!myjs.isNull($('#stataSeo').val()))
        // {
        sign_transfer = 'stataSeo';
        if (signCheck == 'salesman' || signCheck == 'salesman_manager')
        {
            qm_transferRtecord.getThisbranch(pageNum, pageSize);
            console.log('当前状态')
        }
        else
        {
            qm_transferRtecord.getData(pageNum, pageSize);
            console.log('所有状态')
        }
        // }
    },
    timeSeo: function ()
    {
        //时间搜索
        $('#pageleft').text('1');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_transferRtecord.seoResult(pageNum, pageSize)

    },
    seoResult: function (pageNum, pageSize)
    {
        //搜索结果
        var url = path + '/s/listCurrentRepertoryApply.action';
        var params = {};

        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        params['createDate'] = $('#d5221').val().trim();
        params['finishDate'] = $('#d5222').val().trim();
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '搜索返回值')
            var state = data.state;
            var pageCount = data.pageCount;
            var data = data.result;

            $('#pageright').text(pageCount)
            if (state == '1')
            {
                sign_transfer = 'timeSeo';//时间搜索状态

                qm_transferRtecord.listData(data)
            }
        })
    },
    resetBut: function ()
    {
        //重置
        sign_check = '';//重置状态
        $('#d5221').val('');
        $('#d5222').val('');
        $('#seoSel').val('');
        $('#pageleft').text('1');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_transferRtecord.getFirstBranchId(pageNum, pageSize);

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
        qm_transferRtecord.pageType(pageNum, pageSize);

        $('#pageleft').text('1')
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
            qm_transferRtecord.pageType(pageNum, pageSize);

        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_transferRtecord.pageType(pageNum, pageSize);

        }
    },
    pageType: function (pageNum, pageSize)
    {
        switch (sign_transfer)
        {
            case 'timeSeo':
                qm_transferRtecord.seoResult(pageNum, pageSize);
                break;
            case 'Recordseo':
                var seoSel = $('#seoSel').val();
                qm_transferRtecord.getData(pageNum, pageSize, seoSel);
                break;
            case 'thisbranch':
                qm_transferRtecord.getThisbranch(pageNum, pageSize);
                break;
            case 'stataSeo':
                qm_transferRtecord.stataData(pageNum, pageSize);
                break;
            default:
                qm_transferRtecord.getData(pageNum, pageSize);
                break;
        }
        ;
    },
}