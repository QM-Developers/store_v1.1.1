var qm_orderdetails = {
    inint: function ()
    {

        signCheck = parent.document.getElementById('positionName').getAttribute('name');
        switch (signCheck)
        {
            case 'follower':
                //跟单员

                break;
            case 'salesman':
                //业务员

                $('#container').css('display', 'block');
                break;
            case 'salesman_manager':
                //业务主管
                $('#container').css('display', 'block');
                break;
            case 'finance':
                //财务人员
                $('#container').css('display', 'block');//凭证显示
                break;
            case 'finance_manager':
                //财务主管
                $('#container').css('display', 'block');
                break;
            default:
                break;
        }
        qm_orderdetails.getOrderDetails();
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
                var shoppingAddress = JSON.parse(data.shoppingAddress);
                $('#contact').text(shoppingAddress.contact);
                $('#phone').text(shoppingAddress.phone);
                $('#address').text(shoppingAddress.address);

                $('#orderNumber').text(data.orderNumber);
                $('#userName').text(data.userName);
                $('#paymentType').text(qm_orderdetails.paymentType(data.paymentType));
                if (data.paymentStatus == '112')
                {
                    $('#paymentStatus').text(qm_orderdetails.fristType(data.paymentStatus)).css('color', 'red');
                } else
                {
                    $('#paymentStatus').text(qm_orderdetails.fristType(data.paymentStatus));
                }
                $('#freight').text(data.freight);
                $('#buyerMessage').text(data.buyerMessage)
                qm_orderdetails.listData(orderList);
                $('#orderCount').text(data.orderCount + '元');
                if (data.orderStatus != '92')
                {
                    $('#sellerMessage').val(data.sellerMessage);
                }
                ;
                if (signCheck != 'follower')
                {
                    //获取图片
                    console.log('获取凭证图片')
                    qm_orderdetails.getOrderImage();
                };
               if (signCheck == 'finance' || signCheck == 'finance_manager'){
                   //财务显示处理方案
                   $('#dispose').css('display','block');
                    $('#orderstate').text(qm_orderdetails.threedType(data.orderStatus));
               }

                if (data.orderStatus == '92')
                {
                    //待跟单审批
                    $('#sellerMessage').removeAttr('disabled');
                    if (data.paymentType == '10' && data.paymentStatus == '111' && signCheck == 'follower' || data.paymentType == '20' && data.paymentStatus == '112' && signCheck == 'follower' || data.paymentType == '30' && data.paymentStatus == '112' && signCheck == 'follower')
                    {
                        console.log('2222')
                        $('#approve').css('display', 'block').find('button').attr('onclick', 'qm_orderdetails.approveOrder()');
                    }
                }
                if (data.orderStatus == '101' && signCheck == 'follower')
                {
                    //待发货
                    $('#shipments').css('display', 'block').find('button').attr('onclick', 'qm_orderdetails.shipments()');
                    $('#approve').remove();
                    $('#repulse').remove();
                    $('#ratify').remove();
                }
                if (signCheck == 'salesman' && data.paymentStatus == '112')
                {
                    //业务上传凭证
                    var id = urlParams.split('&')[1].split('=')[1];
                    qm_orderdetails.initWebUpload(id);
                }
                if (data.orderStatus == '120' || data.orderStatus == '122' || data.orderStatus == '123' || data.orderStatus == '107')
                {
                    //退款按钮
                    console.log('退款状态的按钮')
                    var $item = '<div class="header-text sales-return" ><a href="qm-salesReturn.jsp?member=' + data.userId + '&order=' + data.orderId + '">退货详情</a></div>';
                    $('#headerBox').append($item);
                }
                if(data.orderStatus == '90' && signCheck == 'finance_manager'){
                    //财务审批
                    $('#repulse').css('display','block').find('button').attr('onclick','qm_orderdetails.repulseApproveBut()');
                    $('#ratify').css('display','block').find('button').attr('onclick','qm_orderdetails.financeApproveBut()');
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
    paymentType: function (num)
    {
        //付款方式
        var text2 = '';
        switch (num)
        {
            case 10:
                text2 = '转账';
                break;
            case 20:
                text2 = '月结';
                break;
            case 30:
                text2 = '到付';
                break;
            default:
                break;
        }
        return text2;
    },
    goodsLack: function ()
    {

        var titletext = '提示';
        var conttext = '商品库存不足';
        var buttext = '稍后处理';
        var fnclick = 'indenxlogin.removepop()';
        indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
    },
    approveOrder: function ()
    {
        //确认订单
        var url = path + '/s/updateSalesmanPass.action';
        var params = {};
        params['orderId'] = urlParams.split('&')[1].split('=')[1];
        params['sellerMessage'] = $('#sellerMessage').val();
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '确认订单')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#sellerMessage').attr('disabled', 'disabled');
                $('#shipments').css('display', 'block');
                $('#approve').remove();
                indenxlogin.removepop()
            } else if (state == '3')
            {
                qm_orderdetails.goodsLack();
            }
        })
    },
    shipments: function ()
    {
        //发货
        var url = path + '/s/updateDelivered.action';
        var params = {};
        params['orderId'] = urlParams.split('&')[1].split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#shipments').remove();
            }
        })
    },
    financeApproveBut:function ()
    {
        var titletext = '提示';
        var conttext = '是否通过这个订单';
        var leftbuttext = '是';
        var fnleft = 'qm_orderdetails.financeApprove()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright);
    },

    financeApprove:function ()
    {
      //财务批准
        var url = path + '/s/updateFinancePass.action';
        var params = {};
        params['orderId'] = urlParams.split('&')[1].split('=')[1];
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '确认订单')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#repulse').remove();
                $('#ratify').remove();
                $('#paymentStatus').text('已付款').css('color','#000');
                indenxlogin.removepop()
            }
        })
    },
    repulseApproveBut:function ()
    {
        var titletext = '提示';
        var conttext = '是否要否决这个订单';
        var leftbuttext = '是';
        var fnleft = 'qm_orderdetails.repulseApprove()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright);
    },
    repulseApprove:function ()
    {
        //财务拒绝
        var url = path + '/s/updateFinanceFail.action';
        var params = {};
        params['orderId'] = urlParams.split('&')[1].split('=')[1];
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '确认订单')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#repulse').remove();
                $('#ratify').remove();
                indenxlogin.removepop()
            }
        })
    },
    getOrderImage: function ()
    {
        //获取图片
        var url = path + '/user_listOrderProof.action';
        var params = {};
        params['orderId'] = urlParams.split('&')[1].split('=')[1];
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                if (signCheck != 'salesman')
                {
                    for (var i = 0; i < data.length; i++)
                    {
                        var $img = '<a class=img-a>' +
                            '<img id=' + data[i].proofId + '  src=' + path + '/user_getProofImage.action?proofUrl=' + data[i].proofUrl + '>' +
                            '</a>';
                        $("#certificate" + parseInt(i + 1)).append($img)
                    }
                } else
                {
                    for (var i = 0; i < data.length; i++)
                    {
                        var $img = '<a class=img-a>' +
                            '<i class=removeimage onclick=qm_salesReturn.removeImage(this)>X</i>' +
                            '<img id=' + data[i].proofId + '  src=' + path + '/user_getProofImage.action?proofUrl=' + data[i].proofUrl + '>' +
                            '</a>';
                        $("#certificate" + parseInt(i + 1)).find('.webuploader-pick').append($img)
                    }
                }
            }
        })
    },


    initWebUpload: function (urlid)
    {
        console.log(urlid)
        var site = {
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: path + '/script/script/webuploader-0.1.5/Uploader.swf',
            // 文件接收服务端。
            server: path + '/user_saveOrderProof.action',
            threads: 1, // 上传并发数
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#certificate1',
            fileVal: 'img',
            formData: {'orderId': urlid},
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        };
        qm_orderdetails.certificate1 = WebUploader.create(site);
        site.pick = '#certificate2';
        qm_orderdetails.certificate2 = WebUploader.create(site);
        site.pick = '#certificate3';
        qm_orderdetails.certificate3 = WebUploader.create(site);
        site.pick = '#certificate4';
        qm_orderdetails.certificate4 = WebUploader.create(site);
        site.pick = '#certificate5';
        qm_orderdetails.certificate5 = WebUploader.create(site);
        site.pick = '#certificate6';
        qm_orderdetails.certificate6 = WebUploader.create(site);

        function operation(element, id)
        {
            element.on('fileQueued', function (file)
            {
                var $li = $('<a class="img-a"><i class="removeimage" onclick="qm_salesReturn.removeImage(this)">X</i><img  src=""/></a>'),
                    $img = $li.find('img');
                // $list为容器jQuery实例
                $(id).find('.webuploader-pick').append($li);

                element.makeThumb(file, function (error, src)
                {
                    if (error)
                    {
                        $img.replaceWith('<span>不能预览</span>');
                        return;
                    }
                    $img.attr('src', src);
                });
            });
            // 文件上传过程中创建进度条实时显示。
            element.on('uploadProgress', function (file, percentage)
            {
                var $li = $('#' + file.id),
                    $percent = $li.find('.upload-progress');
                // 避免重复创建
                if (!$percent.length)
                {
                    $percent = $('<div class="upload-progress am-progress am-progress-striped am-progress-sm am-active ">' +
                        '<div class="am-progress-bar am-progress-bar-secondary"  style="width: 0%"></div>' +
                        '</div>').appendTo($li).find('.upload-progress');
                }

                $percent.css('width', percentage * 100 + '%');
            });

            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            element.on('uploadSuccess', function (file, data)
            {
                var $li = $('#' + file.id),
                    $percent = $li.find('.upload-progress');

                if ($percent.length)
                    $percent.remove();

                $li.append();
                $(id).find('img').attr('id', data.result.proofId);
                console.log(data)

            });

            // 文件上传失败，显示上传出错。
            element.on('uploadError', function (file)
            {
                var $li = $('#' + file.id),
                    $percent = $li.find('.upload-progress');

                if ($percent.length)
                    $percent.remove();

                $percent = $('<div class="upload-progress" style="color: red;width: 65px">上传失败</div>').appendTo($li);
            });
            // 完成上传完了，成功或者失败，先删除进度条。
            element.on('uploadComplete', function (file)
            {

            });
        }

        operation(qm_orderdetails.certificate1, $('#certificate1'));
        operation(qm_orderdetails.certificate2, $('#certificate2'));
        operation(qm_orderdetails.certificate3, $('#certificate3'));

        operation(qm_orderdetails.certificate4, $('#certificate4'));
        operation(qm_orderdetails.certificate5, $('#certificate5'));
        operation(qm_orderdetails.certificate6, $('#certificate6'));

    },
    removeshow: function (item)
    {
        $(item).find('.removeimage').css('display', 'block')
    },
    removehidden: function (item)
    {
        $(item).find('.removeimage').css('display', 'none')
    },

    removeImage: function (item)
    {
        //删除图片
        var imgId = $(item).parent('a').find('img').attr('id');
        var url = path + '/user_removeOrderProof.action';
        var params = {};
        params['proofId'] = imgId;
        console.log()
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            if (state == '1')
            {
                $(item).parent('a').remove();
            }
        })
    },
}