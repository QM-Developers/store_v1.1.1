var qm_salesOrderList = {
    sign_seo: '',
    inint: function ()
    {
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        signCheck = parent.document.getElementById('positionName').getAttribute('name');
        switch (signCheck)
        {
            case 'follower':
                //跟单员
                $('#selseo-ul-1').css('visibility', 'hidden');

                break;
            case 'salesman':
                //业务员
                $('#selseo-ul-1').css('visibility', 'hidden');

                break;
            case 'salesman_manager':
                //业务主管
                $('#selseo-ul-1').css('display', 'block');
                qm_salesOrderList.getSales();

                break;
            case 'finance':
                $('#text-th4').text('跟单员');
                $('#selseo-ul-1').css('display', 'block');
                qm_salesOrderList.getBranchList();//部门
                //财务人员
                break;
            case 'finance_manager':
                //财务主管
                $('#text-th4').text('跟单员');
                $('#selseo-ul-1').css('display', 'block');
                qm_salesOrderList.getBranchList();
                break;
            default:
                break;
        }
        sign_seo = 'all';
        qm_salesOrderList.getOrderData(pageNum, pageSize);
    },
    getSales: function ()
    {
        //获取业务员筛选
        var url = path + "/s/sales/listSales.action";
        var params = {};
        myjs.ajax_post(url, params, function (data)
        {
            var data = data.result;
            console.log(data, '业务员')
            var item = '<ul class="selseo-ul"  onmouseleave="qm_salesOrderList.SelectHidden()">';
            item += '<li class="selseo-li"  onClick="qm_salesOrderList.onSelect(this,event);" ><a class="selseo-a">全部</a></li>';
            for (var i = 0; i < data.length; i++)
                item += '<li class="selseo-li"  onClick="qm_salesOrderList.onSelect(this,event);" id="' + data[i]["userId"] + '"><a class="selseo-a">' + data[i]["userName"] + '</a></li>';
            item += '</ul>';
            $("#selseo-ul-1").append(item);
        })
    },
    getBranchList: function ()
    {
        //获取部门
        var url = path + "/s/listTeamDepartment.action";
        var params = {};
        myjs.ajax_post(url, params, function (data)
        {
            var data = data.result;
            console.log(data, '部门')
            var item = '<ul class="selseo-ul"  onmouseleave="qm_salesOrderList.SelectHidden()">';
            item += '<li class="selseo-li"  onClick="qm_salesOrderList.onSelect(this,event);" ><a class="selseo-a">全部</a></li>';
            for (var i = 0; i < data.length; i++)
                item += '<li class="selseo-li"  onClick="qm_salesOrderList.onSelect(this,event);" id="' + data[i]["teamDepartmentId"] + '"><a class="selseo-a">' + data[i]["teamDepartmentName"] + '</a></li>';
            item += '</ul>';
            $("#selseo-ul-1").append(item);
        })
    },
    getOrderData: function (pageNum, pageSize)
    {
//获取数据
        var url = path;
        var params = {};
        switch (signCheck)
        {
            case 'follower':
                //跟单员
                url += '/s/listSalesOrderSelective.action';
                console.log('跟单员')
                break;
            case 'salesman':
                //业务员
                url += '/s/sales/listOrderSelective.action';
                console.log('业务员')

                break;
            case 'salesman_manager':
                //业务主管
                url += '/s/sales/listOrderSelectiveByManager.action';
                console.log('业务主管')

                break;
            case 'finance':
                //财务人员
                url += '/s/listFinanceOrderSelective.action';
                console.log('财务人员')

                break;
            case 'finance_manager':
                //财务主管
                url += '/s/listFinanceOrderSelective.action';
                console.log('财务主管')

                break;
            default:
                break;
        };

        if (sign_seo == 'salesmanSeo')
        {
            params['memberId'] = $('#firstSeo').attr('name');//以业务员
        } else if (sign_seo == 'seoBranch')
        {
            params['departmentId'] = $('#firstSeo').attr('name');//以部门
        } else if (sign_seo == 'stateSeo')
        {
            console.log($('#stateSeo').attr('name'))
            params['orderStatus'] = $('#stateSeo').attr('name');//订单状态
        } else if (sign_seo == 'timeSeo')
        {
            params['createDate'] = $('#txtBeginDay').val();//开始时间
            params['finishDate'] = $('#txtEndDay').val();//结束时间
        }
        console.log(sign_seo)

        params['pageNum'] = pageNum;//页数
        params['pageSize'] = pageSize;//显示数
        console.log(params, 'aaaa')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var pageCount = data.pageCount;
            $('#pageright').text(pageCount)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                qm_salesOrderList.listData(data)
            }
        })
    },
    keyWordBut: function ()
    {
        //搜索
        sign_seo = 'keyWord';
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_salesOrderList.keyWordSeo(pageNum, pageSize);
    },
    keyWordSeo: function (pageNum, pageSize)
    {

        var url = path;
        if (signCheck == 'salesman' || signCheck == 'salesman_manager')
        {
            url += '/s/sales/listOrderByKeyword.action';
        } else if (signCheck == 'finance' || signCheck == 'finance_manager')
        {
            url += '/s/listFinanceOrderByKeyword.action';
        } else if (signCheck == 'follower')
        {
            url += '/s/listSalesOrderByKeyword.action';
        }
        var params = {};
        params['keyword'] = $('#keyWord').val();
        params['pageNum'] = pageNum;//页数
        params['pageSize'] = pageSize;//显示数
        console.log(params, 'aaaa')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                qm_salesOrderList.listData(data)
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
                '<td>' + data[i].orderNumber + '</td>' +
                '<td>' + data[i].userName + '</td>' +
                '<td>' + new Date(data[i].createDate).format("yyyy-MM-dd") + '</td>' +
                '<td>' + data[i].merchandiserName + '</td>' +
                '<td>' + qm_salesOrderList.fristType(data[i].paymentStatus) + '</td>' +
                '<td>' + qm_salesOrderList.threedType(data[i].orderStatus) + '</td>' +
                '<td><a href="qm-orderdetails.jsp?member=' + data[i].userId + '&orderdetails=' + data[i].orderId + '">订单详情</a></td>' +
                '</tr>';
        }
        $("#table").append(item);
    },
    fristType: function (num)
    {
        //付款状态
        var text1 = '';
        switch (num)
        {
            case 111:
                text1 = '已付款';
                break;
            case 112:
                text1 = '未付款';
                break;
            default:
                break;
        }
        return text1;
    },
    threedType: function (num)
    {
        //订单状态
        var text3 = '';
        switch (num)
        {
            case 90:
                text3 = '待财务审核';
                break;
            case 92:
                text3 = '待跟单审核';
                break;
            case 101:
                text3 = '待发货';
                break;
            case 102:
                text3 = '已发货';
                break;
            case 105:
                text3 = '财务已拒绝';
                break;
            case 107:
                text3 = '退货成功';
                break;
            case 108:
                text3 = '交易成功';
                break;
            case 120:
                text3 = '退货待审批';
                break;
            case 122:
                text3 = '退货待收货';
                break;
            case 123:
                text3 = '待退款';
                break;
            default:
                break;
        }
        return text3;
    },
    resetBut: function ()
    {
        $('#firstSeo').attr('name', '').text('');
        $('#stateSeo').attr('name', '').text('');
        $('#txtBeginDay').val('');
        $('#txtEndDay').val('');
        $('#keyWord').val('');
        qm_salesOrderList.inint();
    },
    seoData: function ()
    {
        $('#pageleft').text('1')
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_salesOrderList.getOrderData(pageNum, pageSize);
    },
    seoBranch: function ()
    {
        //以部门搜索
        sign_seo = 'seoBranch';
        qm_salesOrderList.seoData()
    },
    timeSeo: function ()
    {
        //以时间搜索
        sign_seo = 'timeSeo';
        qm_salesOrderList.seoData()
    },
    onSelect: function (item, event)
    {
        sign_seo = 'salesmanSeo';
        $(item).parents('.selseo').find('span').text($(item).find('a').text()).attr('name', $(item).attr('id'));
        $(item).parents('.selseo').find('.selseo-ul').css('display', 'none');
        qm_salesOrderList.seoData();
        event.stopPropagation()
    },
    onstateSelect: function (item, event)
    {
        sign_seo = 'stateSeo';
        $(item).parents('.selseo').find('span').text($(item).find('a').text()).attr('name', $(item).attr('name'));
        $(item).parents('.selseo').find('.selseo-ul').css('display', 'none');
        qm_salesOrderList.seoData();
        event.stopPropagation()
    },
    SelectShow: function (item)
    {
        //选项显示
        $(item).find('ul').css('display', 'block')
    },
    SelectHidden: function ()
    {
        //选项隐藏
        $('.selseo-ul').css('display', 'none');
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

        qm_salesOrderList.getOrderData(pageNum, pageSize);

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
            qm_salesOrderList.getOrderData(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_salesOrderList.getOrderData(pageNum, pageSize);
        }
    },
}