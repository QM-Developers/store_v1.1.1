/**
 * Created by Administrator on 2017/9/6.
 */
var qm_experiencelist = {
    self: '',
    inint: function ()
    {
        var urltype = urlParams.split('=')[0]
        switch (urltype){
            case 'client':
             //   拜访客户
             $.cookie('cExperience',urlParams)
                break;
            case 'resource':
                //客户资源
                $.cookie('rExperience',urlParams);
                $('#addexperience').parent('div').remove();
                break;
        }
        console.log(urlParams)
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_experiencelist.getdata(pageNum,pageSize);
    },
    getdata: function (pageNum,pageSize)
    {
        //获取
        var url = path + '/s/listUserBreed.action';
        var params = {};
        params['userPlaceId'] = urlParams.split('=')[1];
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#pageright').text(data.pageCount)
                $('#table').find('tr:first').nextAll().remove();
                for (var i = 0; i < data.length; i++)
                {
                  var  $tr = '<tr>' +
                        '<td>'+data[i].breedCategory +'</td>' +
                        '<td>'+data[i].breedVariety +'</td>' +
                        '<td>'+ data[i].breedType+'</td>' +
                        '<td>'+data[i].breedAge +'</td>' +
                        '<td>' +
                        '<a class="personnel-details" id="'+ data[i].breedId +'" onclick="qm_experiencelist.removeData(this)">删除</a>' +
                        '</td>' +
                        '</tr>';
                    $('#table').append($tr);
                }
            }
        })
    },
    submitdata: function ()
    {
        //提交
        var breedAge = $('#breedAge').val();
        if (!myjs.isNull(breedAge))
        {
            var url = path + '/s/saveUserBreed.action';
            var params = {};
            var breedCategory = $("#breedCategory").find("option:selected").text();
            var breedVariety = $("#breedVariety").find("option:selected").text();
            var breedType = $("#breedType").find("option:selected").text();
            params['userPlaceId'] = urlParams.split('=')[1];
            params['breedCategory'] = breedCategory;
            params['breedVariety'] = breedVariety;
            params['breedType'] = breedType;
            params['breedAge'] = breedAge;
            myjs.ajax_post(url, params, function (data)
            {
                console.log(data)
                var pageNum = $.trim($('#pageleft').text());
                var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
                qm_experiencelist.getdata(pageNum,pageSize);
                qm_experiencelist.pophidden();
            })
        }
    },
    removeData:function (item)
    {
        //提示
        self = item;
        var titletext = '提示';
        var conttext = '是否删除' ;
        var leftbuttext ='是' ;
        var fnleft ='qm_experiencelist.breedDataRemove(this)';
        var rightbuttext = '否';
        var fnright ='indenxlogin.ErrorpopRemove(this)' ;
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    breedDataRemove:function (item)
    {
        //删除数据
        var $item =item;
        var breedId = $(self).attr('id');
        var url = path + '/s/removeUserBreed.action';
        var params = {};
        params['breedId'] = breedId ;
        myjs.ajax_post(url,params,function (data)
        {
            console.log(data);
            var state = data.state;
            if(state == '1'){
                $('#pageleft').text('1')
                var pageNum = $.trim($('#pageleft').text());
                var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
                qm_experiencelist.getdata(pageNum,pageSize);
                indenxlogin.ErrorpopRemove($item)
            }
        })
    },
    popshow: function ()
    {
        //显示弹窗
        $('#addmessage').css('display', 'block');
    },
    pophidden: function ()
    {
        //关闭弹窗
        $('select').each(function ()
        {
            $(this).find("option:first").prop("selected", 'selected');
        })
        $('#breedAge').val('');
        $('#addmessage').css('display', 'none');
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
        qm_experiencelist.getdata(pageNum, pageSize);

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

            qm_customerlist.customerList(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_experiencelist.getdata(pageNum, pageSize);
        }
    },
}