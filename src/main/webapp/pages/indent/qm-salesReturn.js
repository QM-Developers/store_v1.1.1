var qm_salesReturn = {
    inint: function ()
    {

        signCheck = parent.document.getElementById('positionName').getAttribute('name');
        // switch (signCheck)
        // {
        //     case 'follower':
        //         //跟单员
        //
        //         break;
        //     case 'salesman':
        //         //业务员
        //
        //         $('#container').css('display', 'block');
        //         break;
        //     case 'salesman_manager':
        //         //业务主管
        //         $('#container').css('display', 'block');
        //         break;
        //     case 'finance':
        //         //财务人员
        //         $('#container').css('display', 'block');//凭证显示
        //         break;
        //     case 'finance_manager':
        //         //财务主管
        //         $('#container').css('display', 'block');
        //         break;
        //     default:
        //         break;
        // }
        qm_salesReturn.getOrderDetails();
    },
    getOrderDetails: function ()
    {
        //获取订单详情
        var url = path + '/s/getSalesOrder.action';
        var params = {};
        params['memberId'] = urlParams.split('&')[0].split('=')[1];
        params['orderId'] = urlParams.split('&')[1].split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '订单详情')
            var state = data.state;
            var data = data.result;
            var orderList = data.orderList;
            if (state == '1')
            {
                $('#number').text(data.orderNumber);
                $('#refundMessage').val(data.refundMessage);
                $('#orderCount').text(data.orderCount +'元');
                $('#orderstate').text(qm_salesReturn.threedType(data.orderStatus));
                $('#refundDate').text(new Date(data.refundDate).format("yyyy-MM-dd"));
                qm_salesReturn.listData(orderList);
                if (data.orderStatus =='120' ){
                     $('#refundPass').css('display','block').find('button').attr('onclick','qm_salesReturn.refundPassBut()')
                }
                if (data.orderStatus =='122'){
                    $('#refundReceive').css('display','block').find('button').attr('onclick','qm_salesReturn.refundReceiveBut()')
                }
            }
        })
    },
    listData: function (orderList)
    {
        $('#table tr:first-child').nextAll().remove();
        var item = "";
        for (var i = 0; i < orderList.length; i++)
        {
            item += '<tr>' +
                '<td>' + orderList[i].goodsCode + '</td>' +
                '<td>' + orderList[i].goodsName + '</td>' +
                '<td>' + orderList[i].goodsType + '</td>' +
                '<td>' + orderList[i].standardName + '</td>' +
                '<td>' + orderList[i].goodsPrice + '</td>' +
                '<td>' + orderList[i].buyNum + '</td>' +
                '<td>' + orderList[i].buyNum * orderList[i].goodsPrice + '</td>' +
                '</tr>';
        }
        $("#table").append(item);
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
    refundPassBut:function ()
    {
        var titletext = '提示';
        var conttext = '是否同意该退货申请';
        var leftbuttext = '是';
        var fnleft = 'qm_salesReturn.refundPass()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright);
    },

    refundPass: function ()
    {
        //确认退货申请
        var url = path + '/s/updateRefundPass.action';
        var params = {};
        params['orderId'] = urlParams.split('&')[1].split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '确认订单')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#orderstate').text('退款待收货');
                $('#refundPass').remove();
                $('#refundReceive').css('display','block');
                indenxlogin.removepop();
            }
        })
    },
    refundReceiveBut:function ()
    {
        var titletext = '提示';
        var conttext = '是否已确认接受退还的货物';
        var leftbuttext = '是';
        var fnleft = 'qm_salesReturn.refundReceive()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright);
    },

    refundReceive: function ()
    {
        //确认退货申请
        var url = path + '/s/updateRefundReceive.action';
        var params = {};
        params['orderId'] = urlParams.split('&')[1].split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '确认订单')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#orderstate').text('待退款');
                $('#refundReceive').remove();
                indenxlogin.removepop();
            }
        })
    },

}