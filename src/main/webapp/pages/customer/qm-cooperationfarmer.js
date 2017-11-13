/**
 * Created by Administrator on 2017/9/12.
 */
var qm_cooperationfarmer = {
    detailsurlParams: '',
    inint: function ()
    {
        console.log(urlParams, '农户场地列表');
        //农户id +合作社id +名字+手机号
        var urltype = urlParams.split('=')[0];

        switch (urltype)
        {
            case 'hzsid':
                //农户列表进来的添加
                addurlParams = urlParams.split('=')[1]
                $('#siteheader').css('display', 'none');
                break;
            case'nhid' :
                //农户列表进来的详情
                $.cookie('nonghu', urlParams);
                qm_cooperationfarmer.setData();
                break;
            case 'addsiteback':
                //添加进去的返回
                if ($.cookie('nonghu') != null)
                {
                    urlParams = $.cookie('nonghu');
                    qm_cooperationfarmer.setData();
                }
                break;
            case 'cdidgo':
                //详情进去的返回
                if ($.cookie('nonghu') != null)
                {
                    urlParams = $.cookie('nonghu');
                    qm_cooperationfarmer.setData();
                }
                break;
            case'rSite' :
                //农户列表进来的详情
                $.cookie('rSitedata', urlParams);
                $('#compilebutbox').remove();
                $('#siteheader').remove();
                $('#removedata').remove();
                qm_cooperationfarmer.setData();
                break;
            case 'rBreedGO':
                if ($.cookie('rSitedata') != null)
                {
                    urlParams = $.cookie('rSitedata');
                    $('#compilebutbox').remove();
                    $('#siteheader').remove();
                    $('#removedata').remove();
                    qm_cooperationfarmer.setData();
                }
                break;
            default:
                break;
        }
        console.log(urltype)
    },
    setData: function ()
    {
        console.log('进来了')
        detailsurlParams = urlParams.split('&')[0].split('=')[1];
        var farmerName = urlParams.split('&')[2].split('=')[1];//取名字
        var farmerPhone = urlParams.split('&')[3].split('=')[1];//取手机号
        $('#farmerName').val(unescape(farmerName));
        $('#farmerPhone').val(farmerPhone);
        qm_cooperationfarmer.detail(detailsurlParams);
    },
    detail: function (data)
    {
        $('.disable-sign').attr('disabled', 'disabled').css('border-color', '#ffffff');
        $('#butbox').css('display', 'none')
        $('#compilebutbox').css('display', 'block')
        $('#sitelistbox').css('display', 'block');
        $('#sitetitle>a').attr('id', data);
        $('#siteheader>a').attr('href', 'qm-sitemessageone.jsp?addsite=' + data);
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_cooperationfarmer.getdata(pageNum, pageSize);
    },
    submitbut: function ()
    {
        var inputval = 0;
        $('.disable-sign').each(function ()
        {
            if (myjs.isNull($(this).val()))
            {
                $(this).css('border-color', 'red');
                inputval += 1;
            }
        });
        if (inputval == 0)
        {
            var titletext = '提示';
            var conttext = '是否要添加新的农户资源';
            var leftbuttext = '是';
            var fnleft = 'qm_cooperationfarmer.submitData()';
            var rightbuttext = '否';
            var fnright = 'indenxlogin.removepop()';
            indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
        }

    },
    submitData: function ()
    {
        //提交数据
        var url = path + '/s/saveFarmer.action';
        var params = {};
        params['customerId'] = addurlParams;
        params['farmerName'] = $.trim($('#farmerName').val());
        params['farmerPhone'] = $.trim($('#farmerPhone').val());
        // console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            // console.log(data)
            var state = data.state;
            var customerId = data.result;
            if (state == '1')
            {
                location.href = 'qm-cooperationlist.jsp?addxqgo=1';
                indenxlogin.removepop();

            }
        })

    },
    alterData: function ()
    {
        //修改数据
        var url = path + '/s/updateFarmer.action';
        var params = {};
        var farmerId = $.trim($('#sitetitle>a').attr('id'));
        params['farmerId'] = farmerId;
        params['farmerName'] = $.trim($('#farmerName').val());
        params['farmerPhone'] = $.trim($('#farmerPhone').val());
        // console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            if (state == '1')
            {

            }
        })
    },
    getdata: function (pageNum, pageSize)
    {
        var url = path + '/s/listUserPlace.action';
        var params = {};
        params['customerId'] = $.trim($('#sitetitle>a').attr('id'));
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        // console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            // console.log(data)
            var pageCount = data.pageCount;
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                var sign = urlParams.split('=')[0] != 'rSite' ? 'cdid' : 'rSitebreed';
                $('#pageright').text(pageCount)
                $('#table tr:first-child').nextAll().remove();
                for (var i = 0; i < data.length; i++)
                {
                    var $tr = '<tr>' +
                        '<td>' + data[i].userPlaceArea + '</td>' +
                        '<td>' + qm_cooperationfarmer.userPlaceType(data[i].userPlaceType) + '</td>' +
                        '<td>' + data[i].userEmployeeNum + '</td>' +
                        '<td>' +
                        '<a class="personnel-details" href=qm-sitemessageone.jsp?'+sign+'=' + data[i].userPlaceId + '&nhid=' + urlParams.split('&')[0].split('=')[1] + '&hzsid=' + urlParams.split('&')[1].split('=')[1] + '> 详细信息 </a> ' +
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
    compile: function (item)
    {
        //编辑
        var $Compile = $('.disable-sign');
        if ($Compile.attr("disabled"))
        {
            $('.shade-sel').css('display', 'none').parent('div').css("border-color", "#ccc");
            $(item).text("保存").prev().css("display", "block");//改变文字
            $Compile.removeAttr("disabled").css("border-color", "#ccc");//取消禁用
        } else
        {
            var inputval = 0;
            $Compile.each(function ()
            {
                if (myjs.isNull($(this).val()))
                {
                    $(this).focus().css('border-color', 'red');
                    inputval += 1;
                }
            })
            if (inputval == 0)
            {

                $('.shade-sel').css('display', 'block').parent('div').css("border-color", "#fff");
                $(item).text("编辑").prev().css("display", "none")
                $Compile.attr("disabled", "true").css("border-color", "#fff");
                qm_cooperationfarmer.alterData();
            }
        }
    },

    removeFarmerBut: function ()
    {
        var titletext = '提示';
        var conttext = '是否删除农户资源';
        var leftbuttext = '是';
        var fnleft = 'qm_cooperationfarmer.removeFarmer()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    removeFarmer: function ()
    {
        //删除客户
        var url = path + '/s/removeFarmer.action';
        var params = {};
        params['farmerId'] = detailsurlParams;
        // console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            // console.log(data)
            var state = data.state;
            if (state == '1')
            {

                location.href = 'qm-cooperationlist.jsp?xqgo=2';
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

        qm_cooperationfarmer.getdata(pageNum, pageSize);

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

            qm_cooperationfarmer.getdata(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_cooperationfarmer.getdata(pageNum, pageSize);
        }
    },
    gobock: function ()
    {
        var url = urlParams.split('=')[0];
        console.log(url, '地址')
        switch (url)
        {
            case 'hzsid':
                location.href = "qm-cooperationlist.jsp?addxqgo=1";
                break;
            case 'nhid':
                location.href = "qm-cooperationlist.jsp?addxqgo=2";
                break;
            case 'rSite':
                location.href = "qm-cooperationlist.jsp?rSiteGo=3";
                break;
            default:
                break;
        }
    },
};