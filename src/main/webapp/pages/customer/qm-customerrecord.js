var qm_customerrecord = {
    sign_popup:null,
    inint: function ()
    {
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_customerrecord.getlist(pageNum, pageSize)
        if(urlParams.split('=')[0] == 'cRecord'){
           $('#addRecord').css('display','block');
           $('#siteheader').attr('onclick','qm_customerrecord.recordShow(this)')
        }
    },
    getlist: function (pageNum, pageSize)
    {
        var url = path + '/s/listCustomerFollow.action';
        var params = {};
        params['customerId'] = urlParams.split('&')[0].split('=')[1];
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        console.log(params, '客户跟进提交')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '客户跟进返回')
            var pageCount = data.pageCount;
            $("#pageright").text(pageCount);
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#table tr:first-child').nextAll().remove();
                for (var i = 0; i < data.length; i++)
                {
                    var $tr ='';
                     $tr += '<tr>' +
                        '<td>' + data[i].followTitle + '</td>' +
                        '<td>' + data[i].customerName + '</td>' +
                        '<td> '+data[i].promoterName+' </td>' +
                        '<td> '+new Date(data[i].followDate).format("yyyy-MM-dd")+' </td><td>';
                          if(urlParams.split('=')[0] == 'cRecord')
                          {
                              $tr +=  '<a  class="tab4-a" id="' + data[i].followId + '" onclick="qm_customerrecord.recordCheck(this)">查看/编辑</a>';
                          }else {
                              $tr +=  '<a  class="tab4-a" id="' + data[i].followId + '" onclick="qm_customerrecord.recordCheck(this)">查看</a>';
                          }
                    $tr += '</td></tr>';

                    $('#table').append($tr);
                }
            }
        })
    },
    recordShow: function (item)
    {
        $('#recordBox').css("display", "block");
        $('#customerName').val(unescape(urlParams.split('&')[1].split('=')[1]));
        $('#userName').val($.trim($('#userName', window.parent.document).text()));
    },
    recordHidden: function ()
    {
        $('#save').removeAttr('onclick');
        $("#recordBox").css("display", "none");
        $('#recordBox').find('#followDate').attr('value', '');
        $('#recordBox').find('textarea').val('');
        $('#recordBox').find('#recordTitle').val('');
    },
    recordBut: function ()
    {
        if ( !myjs.isNull($('#followDate').val()) && !myjs.isNull($('#recordTitle').val()) && !myjs.isNull($('#followContent').val()) && !myjs.isNull($('#followResult').val()))
        {
            console.log('111')
            $("#recordBox").css("display", "none");
            var titletext = '提示';
            var conttext = '是否保存记录';
            var leftbuttext = '是';
            var fnleft = 'qm_customerrecord.recordSubmit()';
            var rightbuttext = '否';
            var fnright = 'qm_customerrecord.removepop()';
            indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
        }else {
            console.log('2222')

            var titletext = '提示';
            var conttext = '提交失败！输入的信息不全';
            var fnclick = 'indenxlogin.removepop()';
            var buttext = '确定';
            indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext)
        }
        $('#save').attr('onclick','qm_customerrecord.recordSubmit()')
    },

    recordSubmit: function ()
    {
        //提交记录
        var url = path + '/s/saveCustomerFollow.action';
        var params = {};
        params['customerId'] = urlParams.split('&')[0].split('=')[1];
        params['customerName'] = $.trim($('#customerName').val());
        params['followTitle']= $('#recordTitle').val();
        params['followDate'] = $.trim($('#followDate').val());
        params['followContent'] = $.trim($('#followContent').val());
        params['followResult'] = $.trim($('#followResult').val());
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                var pageNum = $.trim($('#pageleft').text());
                var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
                qm_customerrecord.getlist(pageNum, pageSize);
                indenxlogin.removepop();
            }
        })
    },
    recordCheck:function (item)
    {
        $('#recordBox').css("display", "block");
        var url = path +'/s/getCustomerFollow.action';
        var params ={};
        params['followId']=$(item).attr('id');
        console.log(params)
        $itemid = $(item).attr('id');
        myjs.ajax_post(url,params,function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if(state =='1'){
                if(urlParams.split('=')[0] == 'cRecord')
                {
                    $('#customerName').val(data.customerName);
                    $('#userName').val(data.promoterName);
                    $('#recordTitle').val(data.followTitle);
                    $('#followDate').val(new Date(data.followDate).format("yyyy-MM-dd"))
                    $('#followContent').val(data.followContent);
                    $('#followResult').val(data.followResult)
                    $('#save').attr('onclick', 'qm_customerrecord.recordlookSubmit()')
                }else {
                    $('#customerName').val(data.customerName);
                    $('#userName').val(data.promoterName);
                    $('#recordTitle').attr('disabled','disabled').val(data.followTitle);
                    $('#followDate').attr('disabled','disabled').val(new Date(data.followDate).format("yyyy-MM-dd"))
                    $('#followContent').attr('disabled','disabled').val(data.followContent);
                    $('#followResult').attr('disabled','disabled').val(data.followResult);
                    $('#save').parent().remove();
                }
            }
        })
    },
    recordlookSubmit: function ()
    {
        //修改记录
        var url = path + '/s/updateCustomerFollow.action';
        var params = {};
        params['followId'] = $itemid ;
        params['customerName'] = $.trim($('#customerName').val());
        params['followTitle']= $('#recordTitle').val();
        params['followDate'] = $.trim($('#followDate').val());
        params['followContent'] = $.trim($('#followContent').val());
        params['followResult'] = $.trim($('#followResult').val());
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                var pageNum = $.trim($('#pageleft').text());
                var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
                qm_customerrecord.getlist(pageNum, pageSize);
                qm_customerrecord.removepop()
            }
        })
    },
    removepop: function ()
    {
        $('.password-box').remove();
        qm_customerrecord.recordHidden()
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

        qm_customerrecord.getlist(pageNum, pageSize);

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

            qm_customerrecord.getlist(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_customerrecord.getlist(pageNum, pageSize);
        }
    },


}