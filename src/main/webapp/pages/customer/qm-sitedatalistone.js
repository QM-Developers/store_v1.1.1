/**
 * Created by Administrator on 2017/9/1.
 */
var qm_sitedatalistone = {
    inint: function ()
    {
        console.log(urlParams)
        switch (urlParams.split('=')[0])
        {
            case 'grid':
                $.cookie('grid',urlParams)
                qm_sitedatalistone.setData()
                break;
            case 'grsiteback':
                if($.cookie('grid')!=null){
                    urlParams =$.cookie('grid');
                    qm_sitedatalistone.setData()
                }
                break;
            case 'graddsiteback':
                if($.cookie('grid')!=null){
                    urlParams =$.cookie('grid');
                    qm_sitedatalistone.setData()
                }
                break;
            case 'resource':
                $.cookie('rindividual',urlParams)
                qm_sitedatalistone.setData()
                $('#removeheader').remove();
                break;
            case 'rGrSiteMessage':
              if ($.cookie('rindividual')){
              urlParams =$.cookie('rindividual');
                  qm_sitedatalistone.setData()
                  $('#removeheader').remove();
              }
                break;
        }
    },
    setData:function ()
    {
        $('#addsite').attr('href', 'qm-sitemessageone.jsp?graddsite=' + urlParams.split('=')[1]);
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_sitedatalistone.getData(pageNum, pageSize);
    },
    getData: function (pageNum, pageSize)
    {
        var url = path + '/s/listUserPlace.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        myjs.ajax_post(url, params, function (data)
        {

            var pageCount = data.pageCount;
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                var sign = urlParams.split('=')[0] != 'resource' ? 'grsite' : 'rGrSite';
                $('#pageright').text(pageCount);
                $('#table tr:first-child').nextAll().remove();
                for (var i = 0; i < data.length; i++)
                {
                    var $tr = '<tr>' +
                        '<td>' + data[i].userPlaceArea + '</td>' +
                        '<td>' + qm_sitedatalistone.userPlaceType(data[i].userPlaceType) + '</td>' +
                        '<td>' + data[i].userEmployeeNum + '</td>' +
                        '<td>' +
                        '<a class="personnel-details" href=qm-sitemessageone.jsp?'+sign+'=' + data[i].userPlaceId + '&userid=' + urlParams.split('=')[1] + '>详细信息</a>' +
                        '</td>' +
                        '</tr>';
                    $('#table').append($tr);
                }
            }
        })
    },
    userPlaceType: function (data)
    {
        switch (data)
        {
            case 'no' :
                return data = '无限定';
                break;
            case 'allow' :
                return data = '可养区';
                break;
            case 'forbid' :
                return data = '限养区';
                break;
            case 'restrict' :
                return data = '禁养区';
                break;
        }
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

        qm_sitedatalistone.getData(pageNum, pageSize);

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

            qm_sitedatalistone.getData(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_sitedatalistone.getData(pageNum, pageSize);
        }
    },
    gobock: function ()
    {
        location.href = "qm-customerdata.jsp?grClient=1";
        var url = urlParams.split('=')[0];
        console.log(url, '地址')
        switch (url)
        {
            case 'grid':
                location.href = "qm-customerdata.jsp?cDataGO=1";
                break;
            case 'resource':
                location.href = "../clientresource/qm-clientresource.jsp?rDataGO=2";
                break;
            default:
                break;
        }
    }
}