/**
 * Created by Administrator on 2017/10/16.
 */
var qm_checkrecord = {
    sign_check: '',
    inint: function ()
    {
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
         signCheck = parent.document.getElementById('positionName').getAttribute('name');

        if (signCheck == 'salesman' || signCheck == 'salesman_manager')
        {
            $('#seoSelBox').remove();
            qm_checkrecord.getThisbranch(pageNum, pageSize);
            console.log('盘点1')
        } else
        {
            qm_checkrecord.getBranchOption();
            qm_checkrecord.getFirstBranchId(pageNum, pageSize);

            console.log('盘点2')

        }
    },
    getBranchOption: function ()
    {
        //获取销售点选项
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
        //以部门搜索
        var thisid = item;
        console.log(thisid)
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_checkrecord.getData(pageNum, pageSize, thisid);
        sign_check = 'branchSeo';
    },
    getFirstBranchId: function (pageNum, pageSize)
    {
        //获取总部编号
        var url = path + '/s/getFirstBranchId.action';
        var params = {};
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var dataid = data.result;
            console.log(dataid, '记录')
            if (state == '1')
            {
                $('#headerName').attr('name', dataid)

                qm_checkrecord.getData(pageNum, pageSize, '');
            }
        })
    },
    getData: function (pageNum, pageSize, dataid)
    {
        //获取所有数据
        var url = path + '/s/listRepertoryRecord.action';
        var params = {};
        params['branchId'] = dataid;
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        console.log(params, '获取数据')
        myjs.ajax_post(url, params, function (data)
        {
            sign_check = 'allbranch';
            var state = data.state;
            var pageCount = data.pageCount;
            var data = data.result;
            $('#pageright').text(pageCount)

            if (state == '1')
            {
                qm_checkrecord.listData(data)
            }
        })
    },
    timeSeo: function ()
    {
        //时间搜索
        $('#pageleft').text('1');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_checkrecord.seoResult(pageNum, pageSize)
        sign_check = 'timeSeo';
    },
    seoResult: function (pageNum, pageSize)
    {
        //搜索结果
        var url = '';
        var params = {};
        if (signCheck == 'salesman' || signCheck == 'salesman_manager'){
            // 当前销售点记录
            url += path + '/s/listCurrentRepertoryRecord.action';
            console.log('当前')
        }else {
            //所有盘点记录
            url += path + '/s/listRepertoryRecord.action';
            console.log('所有')

        }
        params['branchId'] = $('#headerName').attr('name');
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        params['createDate'] = $('#txtBeginDay').val().trim();
        params['finishDate'] = $('#txtEndDay').val().trim();

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
                qm_checkrecord.listData(data)
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
                '<td class="list-td">' + data[i]["recordCode"] + '</td>' +
                '<td class="list-td">' + data[i]["operatorName"] + '</td>' +
                '<td class="list-td">' + new Date(data[i]["createDate"]).format("yyyy/MM/dd") + '</td>' +
                '<td class="list-td">' + data[i]["branchName"] + '</td>' +
                '<td class="list-td">' +
                '<a href="qm-checkwarehouse.jsp?record=' + data[i]["recordId"] + '">查看详情</a>' +
                '</td>' +
                '</tr>';

        }
        $('#ul-table').append(item)
    },
    getThisbranch: function (pageNum, pageSize)
    {
        //    获取当前销售点
        var url = path + '/s/listCurrentRepertoryRecord.action';
        var params = {};
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            var pageCount = data.pageCount;
            $('#pageright').text(pageCount)
            var state = data.state;
            var data = data.result;
            console.log(data,'分销点盘点记录')
            if (state == '1')
            {
                $('#headerName').attr('name', data.branchId);
                sign_check = 'thisBranch';
                qm_checkrecord.listData(data)
            }
        })
    },
    resetBut: function ()
    {
        //重置
        $('#txtBeginDay').val('');
        $('#txtEndDay').val('');
        $('#seoSel').val('');
        $('#pageleft').text('1');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        if (signCheck == 'salesman' || signCheck == 'salesman_manager')
        {
            qm_checkrecord.getThisbranch(pageNum, pageSize);
        } else
        {
            qm_checkrecord.getFirstBranchId(pageNum, pageSize);
        }
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
        switch (sign_check)
        {
            case 'thisBranch':
                qm_checkrecord.getThisbranch(pageNum, pageSize);
                break;
            case 'timeSeo':
                qm_checkrecord.seoResult(pageNum, pageSize);
                break;
            case 'branchSeo':
                var seoSel = $('#seoSel').val();
                qm_checkrecord.getData(pageNum, pageSize, seoSel);
                break;
            case 'allbranch':
                qm_checkrecord.getFirstBranchId(pageNum, pageSize);
                break;
            default:
                break;
        }


        $.trim($('#pageleft').text('1'))
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
            switch (sign_check)
            {
                case 'timeSeo':
                    qm_checkrecord.seoResult(pageNum, pageSize);
                    break;
                case 'Recordseo':
                    var seoSel = $('#seoSel').val();
                    qm_checkrecord.getData(pageNum, pageSize, seoSel);
                    break;
                default:
                    qm_checkrecord.getFirstBranchId(pageNum, pageSize);
                    break;
            }
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            switch (sign_check)
            {
                case 'timeSeo':
                    qm_checkrecord.seoResult(pageNum, pageSize);
                    break;
                case 'Recordseo':
                    var seoSel = $('#seoSel').val();
                    qm_checkrecord.getData(pageNum, pageSize, seoSel);
                    break;
                default:
                    qm_checkrecord.getFirstBranchId(pageNum, pageSize);
                    break;
            }
        }
    },
}