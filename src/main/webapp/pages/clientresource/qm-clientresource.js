var qm_clientresource = {
    sign_url :'',
    init: function ()
    {
        var urlType = urlParams.split('=')[0];
        console.log(urlParams)
        switch (urlType)
        {
            case 'resource':
                //资源
                qm_clientresource.sign_url ='resource';
                $.cookie('resourcedata', urlParams);
                $.cookie('sign_url', qm_clientresource.sign_url);
                qm_clientresource.getCustomerData();
                break;
            case 'rDataGO':
                if ($.cookie('resourcedata') != null)
                {
                    if($.cookie('sign_url') != null){
                        qm_clientresource.sign_url =$.cookie('sign_url');
                        if (qm_clientresource.sign_url =='viewDetails'){
                            $('#record').remove();
                            $('#freeze').remove();
                        }
                    }
                    urlParams = $.cookie('resourcedata');
                    qm_clientresource.getCustomerData();
                }
                break;
            case 'viewDetails':
                //资源
                $('#record').remove();
                $('#freeze').remove();
                qm_clientresource.sign_url ='viewDetails';
                $.cookie('sign_url', qm_clientresource.sign_url);
                $.cookie('resourcedata', urlParams);
                qm_clientresource.getCustomerData();
                break;
            default:
                break;
        }
        console.log(qm_clientresource.sign_url)
    },
    //
    // setData: function ()
    // {
    //
    //     qm_clientresource.getCustomerData();
    // },
    getCustomerData: function ()
    {
        console.log(urlParams)

        var url = path + '/s/getVisitCustomer.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var data = data.result;
            var usetype = data.customerType;
            var usegrade = data.creditRating;

            console.log(usegrade)
            if (state == '1')
            {
                $('#record').attr('href', '../customer/qm-customerrecord.jsp?Rrecord=' + urlParams.split('=')[1] +'&name='+escape(data.userName));
                $('.disable-sign').attr("disabled", "true");
                $('#userName').val(data.userName);
                $('#userSex').val(data.userSex);
                $('#userPhone').val(data.userPhone);
                $('#userBirthday').val(data.userBirthday);
                $('#userAddress').val(data.userAddress);

                switch (usegrade)
                {
                    //客户评级
                    case 0:
                        $("#creditRating").val("无级别");
                        break;
                    case 1:
                        console.log('222222')

                        $("#creditRating").val("初级型");
                        break;
                    case 2:
                        $("#creditRating").val("技术型");
                        break;
                    case 3:
                        $("#creditRating").val("诚信型");
                        break;
                    case 4:
                        $("#creditRating").val("赖账型");
                        break;
                    default:
                        console.log('111111')
                        break;
                }

                switch (usetype)
                {
                    //客户分类
                    case 'personal':

                        $("#customerType").val("个体户");
                        var $div = '<div class="customerdata_select personal">' +
                            '<a href="../customer/qm-sitedatalistone.jsp?resource=' + urlParams.split('=')[1] + '">养殖信息</a>' +
                            '</div>';
                        var $personal = $('.personal').length;
                        if ($personal > 0)
                        {
                            return;
                        }
                        $('#sitelist').append($div);
                        $('.personal').css('display', 'block')
                        break;
                    case 'dealer':
                        $("#customerType").val("经销商");
                        var $div = '<div class="customerdata_select dealer">' +
                            '<a href="../customer/qm-manageunitlist.jsp?resource=' + urlParams.split('=')[1] + '">经营单位</a>' +
                            '</div>';
                        var $dealer = $('.dealer').length;
                        if ($dealer > 0)
                        {
                            return;
                        }
                        $('#sitelist').append($div);
                        $('.dealer').css('display', 'block')
                        break;
                    case 'cooperation':
                        $("#customerType").val("合作农户");
                        var $div = '<div class="customerdata_select cooperation">' +
                            '<a href="../customer/qm-cooperativelist.jsp?resource=' + urlParams.split('=')[1] + '"> 场地资源</a>' +
                            '</div>' +
                            '<div class="customerdata_select cooperation">' +
                            '<a href="../customer/qm-experiencelist.jsp?resource=' + urlParams.split('=')[1] + '"> 养殖经验</a>' +
                            '</div>';
                        var $cooperation = $('.cooperation').length;
                        if ($cooperation > 0)
                        {
                            return;
                        }
                        $('#sitelist').append($div);
                        $('.cooperation').css('display', 'block')
                        break;
                    case 'cooperative':
                        $("#customerType").val("合作社");
                        var $div = '<div class="customerdata_select cooperative">' +
                            '<a href="../customer/qm-cooperationlist.jsp?resource=' + urlParams.split('=')[1] + '">合作社资源</a>' +
                            '</div>';
                        var $cooperative = $('.cooperative').length;
                        if ($cooperative > 0)
                        {
                            return;
                        }
                        $('#sitelist').append($div);
                        $('.cooperative').css('display', 'block')
                        break;
                    default:
                        break;
                }
                var prefix = path + '/s/getVisitIDCard.action\?path=';
                if (!myjs.isNull(data.userCardFront))
                {

                    $('#front').prepend('<a  class="img-a "><img  src=' + prefix + data.userCardFront + '></a>');

                }
                if (!myjs.isNull(data.userCardBack))
                {

                    $('#reverse').prepend('<a  class="img-a " ><img  src=' + prefix + data.userCardBack + '></a>');
                }

                if (!myjs.isNull(data.userCardHand))
                {
                    $('#idcard').prepend('<a  class="img-a "><img  src=' + prefix + data.userCardHand + '></a>');
                }

                $('#userCreateDate').text(new Date(data.userCreateDate).format("yyyy-MM-dd"));

                if (data.hadAccount == '0')
                {
                    $('#hadAccount').text('未建账').css('color', 'red');

                } else if (data.hadAccount == '1')
                {
                    $('#hadAccount').text('成功建账');
                    $('#freeze').css('display','block').attr('onclick','qm_clientresource.freezeIdBut()');
                }else {
                    $('#hadAccount').text('已冻结').css('color', 'red');
                    $('#freeze').text('激活账号').css('display','block').attr('onclick','qm_clientresource.unfreezeId()');
                }
                $('#updateCount').text(data.updateCount);
                // $('#userUpdateTime').text(data.userUpdateTime);
            }
        })

    },
    freezeIdBut:function ()
    {

        var conttext = '冻结的账号将无法使用,是否冻结';
        var fnleft = 'qm_clientresource.freezeId()';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo('提示', conttext, '是', fnleft, '否', fnright)
    },
    freezeId:function ()
    {
        //冻结
        var url = path +'/s/updateCustomerFreeze.action';
        var params ={};
        params['customerId']=urlParams.split('=')[1];
        console.log(params,'身躯已然冰封')
        myjs.ajax_post(url,params,function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if(state =='1'){
                indenxlogin.removepop();
                $('#hadAccount').empty().text('已冻结').css('color', 'red');
                $('#freeze').text('激活账号').attr('onclick','qm_clientresource.unfreezeId()');
            }
        })
    },

    unfreezeId:function ()
    {
        //解除
        var url = path +'/s/updateCustomerUnfreeze.action';
        var params ={};
        params['customerId']=urlParams.split('=')[1];
        console.log(params,'灵魂仍旧火热')
        myjs.ajax_post(url,params,function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;

            if(state =='1'){
                indenxlogin.removepop();
                $('#hadAccount').text('成功建账').css('color','#000');
                $('#freeze').text('冻结账号').css('display','block').attr('onclick','qm_clientresource.freezeIdBut()');
            }
        })
    },
    goback: function ()
    {
        switch (qm_clientresource.sign_url)
        {
            case 'resource':
                location.href = "../customer/qm-customerlist.jsp?rListGo=1";
                break;
            case 'viewDetails':
                location.href = "../customer/qm-applyid.jsp?viewDetailsback=1";
                break;
            default:
                break;
        }
    },

}