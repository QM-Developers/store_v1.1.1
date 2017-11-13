/**
 * Created by Administrator on 2017/10/27.
 */
var qm_universalApply= {
    inint: function ()
    {
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_universalApply.getAccountApply(pageNum, pageSize);
    },
    getAccountApply: function (pageNum, pageSize)
    {
        var url = path + '/s/listCommonApplyByApprove.action';
        var params = {};

        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        params['applyResult'] = $('#selState').val();
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            var pageCount = data.pageCount;
            $('#pageright').text(pageCount)
            var state = data.state;
            var data = data.result;
            console.log(data,'获取申请列表')
            if (state == '1')
            {
                qm_universalApply.listData(data)
            }
        })
    },
    listData: function (data)
    {
        $('#table tr:first-child').nextAll().remove();
        var item = "";
        for (var i = 0; i < data.length; i++)
        {
            item += '<tr>' +
                '<td>'+data[i].proposerName+'</td>' +
                '<td>'+data[i].applyTitle+'</td>' +
                '<td>'+new Date(data[i].createDate).format("yyyy/MM/dd")+'</td>' +
                '<td>'+qm_universalApply.statusType(data[i].applyResult) +'</td>' +
                '<td><a href="../apply/qm-application.jsp?approveApply='+data[i].applyId+'">详细信息</a></td>' +
                '</tr>';
        }
        $("#table").append(item);
    },
    stateSeo:function ()
    {
        $('#pageleft').text('1')
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_universalApply.getAccountApply(pageNum, pageSize);
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
                text = '已拒绝';
                break;
            default:
                break;
        }
        return text;
    },
    pageShowNum: function (item)
    {
        //选择显示数量
        $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($(item).text());
        var pageCount = $.trim($('#pageright').text());
        var pageresult = (pageNum == pageCount) ? 1 : pageNum;
        $('#branchpageleft').html(pageresult);

        qm_universalApply.getAccountApply(pageNum, pageSize);

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
            qm_universalApply.getAccountApply(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_universalApply.getAccountApply(pageNum, pageSize);
        }
    },
}