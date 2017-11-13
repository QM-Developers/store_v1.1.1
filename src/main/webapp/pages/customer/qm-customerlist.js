var qm_customerlist = {
    record: '',
    url_sign: '',
    inint: function ()
    {
        var urltype = urlParams.split('=')[0];
        console.log(urltype)
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        switch (urltype)
        {
            // 拜访客户入口
            case 'client':
                url_sign = 'clientlist';
                $.cookie('clientlist', urlParams)
                qm_customerlist.customerList(pageNum, pageSize)
                $('#fristSeo').attr('onchange', 'qm_customerlist.getType()');
                $('#secondSeo').attr('onchange', 'qm_customerlist.getStatus()');
                break;
            case 'cListGo':
                if ($.cookie('clientlist') != null)
                {
                    url_sign = 'clientlist';
                    urlParams = $.cookie('resourcelist');
                    qm_customerlist.customerList(pageNum, pageSize)
                    $('#fristSeo').attr('onchange', 'qm_customerlist.getType()');
                    $('#secondSeo').attr('onchange', 'qm_customerlist.getStatus()');
                }
                break;
            // 客户资源人口
            case 'resource':

                $.cookie('resourcelist', urlParams);
                $('#fristSeo').remove();
                qm_customerlist.getClientListData(pageNum, pageSize);
                qm_customerlist.secondSeoData();
                $('#fristSeo').attr('onchange', 'qm_customerlist.secondSeoData(this.value)');
                $('#secondSeo').attr('onchange', 'qm_customerlist.getClient(this.value)');
                break;
            case 'rListGo':
                if ($.cookie('resourcelist') != null)
                {
                    url_sign = 'resourcelist';
                    urlParams = $.cookie('resourcelist');
                    // qm_customerlist.fristSeoData();
                    $('#fristSeo').remove();
                    qm_customerlist.getClientListData(pageNum, pageSize);
                    qm_customerlist.secondSeoData();
                    $('#fristSeo').attr('onchange', 'qm_customerlist.secondSeoData(this.value)');
                    $('#secondSeo').attr('onchange', 'qm_customerlist.getClient(this.value)');
                }
                break;
            default:
                break;
        }
    },
    // getData: function ()
    // {
    //     //拜访获取客户
    //     var pageNum = $.trim($('#pageleft').text());
    //     var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
    //
    // },
    getType: function ()
    {
        //类型搜索
        url_sign = 'cSeoType';
        $('#pageleft').text('1');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_customerlist.customerList(pageNum, pageSize)
    },
    getStatus: function ()
    {
        //状态搜索
        url_sign = 'cSeoStatus';
        $('#pageleft').text('1');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_customerlist.customerList(pageNum, pageSize)
    },
    inputSeo: function ()
    {
        //input搜索
        url_sign = 'InputSeo';
        $('#pageleft').text('1');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_customerlist.inputSeoData(pageNum, pageSize)

    },
    inputSeoData: function (pageNum, pageSize)
    {
        var url = path;
        if (urlParams.split('=')[0] == 'client')
        {
            url += '/s/listCustomerByKeyword.action';
        } else
        {
            url += '/s/listVisitCustomerByKeyword.action';
        }

        var params = {};
        params['keyword'] = $('#inputSeo').val();
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var pageCount = data.pageCount;
            $("#pageright").text(pageCount);
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                qm_customerlist.listData(data)
            }
        })
    },
    customerList: function (pageNum, pageSize)
    {
        //拜访客户列表
        var url = path + "/s/listCustomer.action";
        var params = {};
        if (url_sign == 'cSeoType')
        {
            //类型搜索
            params["customerType"] = $('#fristSeo').val();
            params["pageNum"] = pageNum;
            params["pageSize"] = pageSize;
            console.log('类型搜索')
        } else if (url_sign == 'cSeoStatus')
        {
            //状态搜索
            params["hadAccount"] = $('#secondSeo').val();
            params["pageNum"] = pageNum;
            params["pageSize"] = pageSize;
            console.log('状态搜索')
        } else
        {
            // 获取所有
            params["pageNum"] = pageNum;
            params["pageSize"] = pageSize;
            console.log('搜索所有')
        }

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '数据')
            var pageCount = data.pageCount;
            $("#pageright").text(pageCount);
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                qm_customerlist.listData(data)
            }
        });
    },
    listData: function (data)
    {
        $('#customerlist tr:first-child').nextAll().remove();
        var item = "";
        for (var i = 0; i < data.length; i++)
        {
            item += '<tr>' +
                '<td>' + data[i].userName + '</td>' +
                '<td>' + data[i].userSex + '</td>' +
                '<td>' + data[i].userPhone + '</td>' +
                '<td>' + qm_customerlist.customerType(data[i].customerType) + '</td>' +
                '<td>' + qm_customerlist.hadAccountType(data[i].hadAccount) + '</td>' +
                '<td>' +
                '<a class="personnel-details" id="' + data[i].customerId + '" onclick="qm_customerlist.recordShow(this)">创建拜访</a>' +
                '<a class="personnel-details" href="qm-customerdata.jsp?client=' + data[i].customerId + '">查看详情</a>' +
                '</td></tr>';
        }
        $("#customerlist").append(item);
    },
    hadAccountType: function (datatype)
    {
        var text = '';
        switch (datatype)
        {
            case 0:
                text = '未建账';
                break;
            case 1:
                text = '已建账';
                break;
            case 2:
                text = '已冻结';
                break;
            default:
                break;
        }
        return text
    },
    customerType: function (n)
    {
        //判断类型
        var showType = '';
        switch (n)
        {
            case 'personal':
                showType = '个体农户';
                break;
            case 'dealer':
                showType = '经销商';
                break;
            case 'cooperation':
                showType = '合作农户';
                break;
            case 'cooperative':
                showType = '合作社';

                break;
            default:
                break;
        }
        return showType;
    },


    recordShow: function (item)
    {
        //拜访信息显示
        $('#recordBox').css("display", "block");
        record = $.trim($(item).next().attr('href').split('=')[1]);
        $('#customerName').val($(item).parents('tr').find('td:first-child').text());
        $('#userName').val($.trim($('#userName', window.parent.document).text()));

    },
    recordHidden: function ()
    {
        //拜访信息隐藏
        $("#recordBox").css("display", "none");
        $('#recordBox').find('#followDate').attr('value', '');
        $('#recordBox').find('textarea').val('');
        $('#recordBox').find('#recordTitle').val('');
    },
    recordBut: function ()
    {
        //添加拜访信息
        if (!myjs.isNull($('#recordTitle').val()) && !myjs.isNull($('#followContent').val()) && !myjs.isNull($('#followResult').val()))
        {
            $("#recordBox").css("display", "none");
            var titletext = '提示';
            var conttext = '是否保存记录';
            var leftbuttext = '是';
            var fnleft = 'qm_customerlist.recordSubmit()';
            var rightbuttext = '否';
            var fnright = 'qm_customerlist.removepop()';
            indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
        } else
        {
            console.log('2222')

            var titletext = '提示';
            var conttext = '提交失败！输入的信息不全';
            var fnclick = 'indenxlogin.removepop()';
            var buttext = '确定';
            indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext)
        }

    },
    recordSubmit: function ()
    {

        var url = path + '/s/saveCustomerFollow.action';
        var params = {};
        params['customerId'] = record;
        params['followTitle'] = $('#recordTitle').val();
        params['customerName'] = $.trim($('#customerName').val());
        params['followDate'] = $.trim($('#followDate').val());
        params['followContent'] = $.trim($('#followContent').val());
        params['followResult'] = $.trim($('#followResult').val());
        console.log(params, '提交记录')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '返回数据')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                indenxlogin.removepop();
            }
        })
    },
    removepop: function ()
    {
        $('.password-box').remove();
        qm_customerlist.recordHidden()
    },

//  客户资源
//     fristSeoData: function ()
//     {
//         var url = path + '/s/listVisitCurrentMember.action';
//         var params = {};
//         console.log(params)
//         myjs.ajax_post(url, params, function (data)
//         {
//             console.log(data)
//             var state = data.state;
//             var data = data.result;
//
//             if (state == '1')
//             {
//                 var $option = '';
//                 for (var i = 0; i < data.length; i++)
//                 {
//                     $option += '<option value="' + data[i].memberId + '">' + data[i].userName + '</option>';
//                 }
//                 $('#fristSeo').empty().append($option)
//                 qm_customerlist.secondSeoData(data[-1].memberId)
//
//             }
//         })
//     },
    getClientListData: function (pageNum, pageSize)
    {
        //获取当前部门下的客户列表
        var url = path + '/s/listVisitCurrentCustomer.action';
        var params = {};

        params["pageNum"] = pageNum;
        params["pageSize"] = pageSize;

        myjs.ajax_post(url, params, function (data)
        {

            var pageCount = data.pageCount;
            $("#pageright").text(pageCount);
            var state = data.state;
            var data = data.result;
            console.log('资源搜索')
            if (state == '1')
            {
                url_sign = 'resourcelist';
                qm_customerlist.clientListData(data);
            }
        })

    },
    secondSeoData: function (thisval)
    {
        //以业务员搜索
        var url = path + "/s/listVisitCurrentMember.action";
        var params = {};
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '')
            var data = data.result;
            var item = "";
            item += '<option  value="">全部</option>';
            for (var i = 0; i < data.length; i++)
                item += '<option  value="' + data[i].memberId + '">' + data[i].userName + '</option>';
            $("#secondSeo").empty().append(item);


        });
    },

    getClient: function (thisid)
    {
        //获取某个成员的客户
        console.log(thisid, '名字')

        if (url_sign != 'rMember')
            $('#Clientid>a:first-child').attr('id', thisid);
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        if(myjs.isNull(thisid))
        {
            qm_customerlist.getClientListData(pageNum, pageSize);

        }
        var url = path + '/s/listVisitCustomer.action';
        var params = {};
            var thisarr = [];
            var json = {"promoterId": thisid};
            thisarr.push(json);
            params['promoter'] = JSON.stringify(thisarr);
            params['pageNum'] = pageNum;
            params['pageSize'] = pageSize;


        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            console.log('成员搜索')

            var pageCount = data.pageCount;
            $("#pageright").text(pageCount);
            var data = data.result;
            url_sign = 'rMember';
            qm_customerlist.clientListData(data);
        })
    },

    clientListData: function (data)
    {
        $('#customerlist tr:first-child').nextAll().remove();
        var item = "";
        for (var i = 0; i < data.length; i++)
        {
            item += '<tr>' +
                '<td>' + data[i].userName + '</td>' +
                '<td>' + data[i].userSex + '</td>' +
                '<td>' + data[i].userPhone + '</td>' +
                '<td>' + qm_customerlist.customerType(data[i].customerType) + '</td>' +
                '<td>' + qm_customerlist.hadAccountType(data[i].hadAccount) + '</td>' +
                '<td>' +
                '<a class="personnel-details" href="../clientresource/qm-clientresource.jsp?resource=' + data[i].customerId + '">查看详情</a>' +
                '</td></tr>';
        }
        $("#customerlist").append(item);
    },
    pageShowNum: function (item)
    {
        //选择显示数量
        $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
        $('#pageleft').text('1');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($(item).text());
        var pageCount = $.trim($('#pageright').text());
        var pageresult = (pageNum == pageCount) ? 1 : pageNum;
        var Clientid = $.trim($('#Clientid>a:first-child').attr('id'));
        $('#branchpageleft').html(pageresult);
        qm_customerlist.pageType(pageNum, pageSize)
    },
    NextPage: function (item)
    {
        //翻页
        var pagetext = $.trim($(item).text());
        var pageSizetext = $.trim($('#pageleft').text());
        var pageCount = $.trim($('#pageright').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        var Clientid = $.trim($('#Clientid>a:first-child').attr('id'));
        console.log(Clientid)

        if (pagetext == '下一页')
        {
            if (pageSizetext >= pageCount)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) + 1);
            $('#pageleft').html(pageNum);
            console.log(url_sign)
            qm_customerlist.pageType(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            console.log(url_sign)
            qm_customerlist.pageType(pageNum, pageSize);
        }
    },
    pageType: function (pageNum, pageSize)
    {
        //翻页的条件
        switch (url_sign)
        {
            case 'clientlist':
                //拜访客户-所有
                qm_customerlist.customerList(pageNum, pageSize);
                break;
            case 'cSeoType':
                //拜访客户-类型搜索
                qm_customerlist.customerList(pageNum, pageSize);
                break;
            case 'cSeoStatus':
                //拜访客户-状态搜索
                qm_customerlist.customerList(pageNum, pageSize);
                break;

            case 'resourcelist':
                //客户资源-所有
                qm_customerlist.getClientListData(pageNum, pageSize);
                break;
            case 'rMember':
                //客户资源-成员客户搜索
                var thisid = $('#Clientid>a:first-child').attr('id');
                qm_customerlist.getClient(thisid);
                break;
            case 'InputSeo':
                //input搜索
                qm_customerlist.inputSeoData(pageNum, pageSize);
                break;
        }
    },
};