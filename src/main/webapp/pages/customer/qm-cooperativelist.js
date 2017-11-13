/**
 * Created by Administrator on 2017/9/7.
 */
var qm_cooperativelist = {

    inint: function ()
    {
        var urltype = urlParams.split('=')[0]
        switch (urltype)
        {
            case 'client':
                $.cookie('cCooperative', urlParams)
                $('#addsite').attr('href', 'qm-cooperativesite.jsp?cId=' + urlParams.split('=')[1]);
                break;
            case 'cSiteGo':
               if($.cookie('cCooperative')!=null)
               {
                   urlParams = $.cookie('cCooperative');
                   $('#addsite').attr('href', 'qm-cooperativesite.jsp?cId=' + urlParams.split('=')[1]);
               }
                break;

            case 'resource':
                $.cookie('rCooperative', urlParams);
                $('#addsite').parent('div').remove();
                break;
            case 'rSiteGo':
                if($.cookie('rCooperative')!=null)
                {
                    urlParams = $.cookie('rCooperative');
                    $('#addsite').parent('div').remove();
                }
                break;
        }
        console.log(urlParams)
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_cooperativelist.getdata(pageNum, pageSize);

    },

    getdata: function (pageNum, pageSize)
    {
        var url = path + '/s/listUserPlace.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        console.log(params);
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#table tr:first-child').nextAll().remove();
                var sign = urlParams.split('=')[0] != 'resource' ? 'cSite' : 'rSite';
                for (var i = 0; i < data.length; i++)
                {
                    var $tr = '<tr>' +
                        '<td>' + data[i].userPlaceArea + '</td>' +
                        '<td>' + data[i].userPlaceType + '</td>' +
                        '<td>' + data[i].userOwnerNum + '</td>' +
                        '<td>' +
                        '<a class="personnel-details" href=qm-cooperativesite.jsp?' + sign + '=' + data[i].userPlaceId + '>详细信息</a>' +
                        '</td>' +
                        '</tr>';
                    $('#table').append($tr);
                }
            }
        })
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

        qm_cooperativelist.getdata(pageNum, pageSize);

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
            qm_cooperativelist.getdata(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_cooperativelist.getdata(pageNum, pageSize);
        }
    },
    gobock: function ()
    {
        var url = urlParams.split('=')[0];
        console.log(url, '地址')
        switch (url)
        {
            case 'client':
                location.href = "qm-customerdata.jsp?cDataGO=1";
                break;
            case 'resource':
                location.href = "../clientresource/qm-clientresource.jsp?rDataGO=2";
                break;
            default:
                break;
        }
    },
}