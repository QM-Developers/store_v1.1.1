/**
 * Created by Administrator on 2017/9/15.
 */
var qm_manageunitlist = {
        inint: function ()
        {
            var urltype = urlParams.split('=')[0]
            switch (urltype)
            {
                case 'client':
                    $.cookie('cUnit',urlParams)
                    $('#addmanageunit>a').attr('href','qm-manageunit.jsp?addunit='+urlParams.split('=')[1])
                    break;
                case 'cUnitGo':
                  if($.cookie('cUnit') != null)
                  {
                      urlParams = $.cookie('cUnit');
                      $('#addmanageunit>a').attr('href','qm-manageunit.jsp?addunit='+urlParams.split('=')[1])
                  }
                    break;

                case 'resource':
                    $.cookie('rUnit',urlParams);
                    $('#addmanageunit').remove();
                    break;
                case 'rUnitGo':
                    if($.cookie('rUnit') != null)
                    {
                        urlParams = $.cookie('rUnit');
                        $('#addmanageunit').remove();
                    }
                    break;
            }
            console.log(urlParams)
                var pageNum = $.trim($('#pageleft').text());
                var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
                qm_manageunitlist.getdata(pageNum,pageSize);

        },
        getdata: function (pageNum,pageSize)
        {
            //获取
            var url = path ;
            var params = {};
            if(urlParams.split('=')[0]=='client'){
                url += '/s/listManageUnit.action';
            }else {
                url += '/s/listVisitManageUnit.action';
            }
            params['customerId'] = urlParams.split('=')[1];
            params['pageNum'] = pageNum;
            params['pageSize'] = pageSize;
            console.log(params)
            myjs.ajax_post(url, params, function (data)
            {
                console.log(data)
                var pageCount = data.pageCount;
                var state = data.state;
                var data = data.result;
                if (state == '1')
                {
                    $('#pageright').text(pageCount)
                    $('#table').find('tr:first').nextAll().remove();
                    var sign = urlParams.split('=')[0] == 'client' ? 'cUnit' : 'rUnit';
                    for (var i = 0; i < data.length; i++)
                    {
                        var  $tr = '<tr>' +
                            '<td>'+data[i].manageName +'</td>' +
                            '<td>'+data[i].manageAcreage +'</td>' +
                            '<td>'+data[i].manageAddress +'</td>' +
                            '<td>' +
                            '<a class="personnel-details"  href=qm-manageunit.jsp?'+ sign +'='+ data[i].manageId +'&sitelist='+urlParams+'>详情</a>' +
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
            qm_manageunitlist.getdata(pageNum, pageSize);

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

                qm_manageunitlist.getdata(pageNum, pageSize);
            } else
            {
                if (pageSizetext <= 1)
                    return;
                var pageNum = Math.ceil((pageSizetext - 0) - 1);
                $('#pageleft').html(pageNum);
                qm_manageunitlist.getdata(pageNum, pageSize);
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