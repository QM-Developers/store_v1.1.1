/**
 * Created by Administrator on 2017/9/11.
 */
var qm_cooperationlist = {

    inint: function ()
    {
        // qm_cooperationsite.initMap();
        var urltype = urlParams.split('=')[0];
        switch (urltype)
        {
            case 'khid':
                $('.sel-box select').css('display','none');
                $.cookie('cFarmerlist', urlParams);
                qm_cooperationlist.setData(urltype);
                break;
            case 'addxqgo':
                if ($.cookie('cFarmerlist') != null)
                {
                    urlParams = $.cookie('cFarmerlist');
                    qm_cooperationlist.setData(urltype);
                }
                break;
            case 'resource':
                $.cookie('rFarmerlist', urlParams);
                $('#siteheader').remove();
                $('#Rcompile').remove();
                qm_cooperationlist.setData(urltype);
                break;
            case 'rSiteGo':
                if ($.cookie('rFarmerlist') != null)
                {
                    urlParams = $.cookie('rFarmerlist');
                    $('#siteheader').remove();
                    $('#Rcompile').remove();
                    qm_cooperationlist.setData(urltype);
                }
                break;
        }
        console.log(urltype, '合作社')
    },
    setData: function (urltype)
    {
        if (urltype != 'resource')
        {
            $('#siteheader>a').attr('href', 'qm-cooperationfarmer.jsp?hzsid=' + urlParams.split('=')[1]);
        }
        $('#userdefined').val($('#userPlaceType').find("option:selected").text());
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        qm_cooperationlist.getUserPlace();
        qm_cooperationlist.getFarmer(pageNum, pageSize);
    },
    getUserPlace: function ()
    {
        console.log(urlParams)
        var url = path + '/s/getCustomer.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        myjs.ajax_post(url, params, function (data)
        {
            // console.log(data);
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#userPlaceArea').css('border-color', '#ffffff').val(data.businessAddress);
                $('#userdefined').css('display', 'block').attr('disabled', true).val(data.station).parent('div').css('border-color', '#ffffff');
                $('.shade-sel').css('display', 'block');
            }
        })
    },
    // initMap: function ()
    // {
    //
    //     var success = function (rep)
    //     {
    //         var location = rep.regeocode.pois[0].location;
    //         $("#branch-lat-lng").val(location.lat + "," + location.lng);
    //         $("#userPlaceArea").val(rep.regeocode.pois[0].name);
    //     };
    //     var fail = function (rep)
    //     {
    //         // console.log(rep);
    //     };
    //     dragMap.init("map", "tip", success, fail);
    // },

    compile: function (item)
    {
        var $Compile = $('.disable-sign');
        if ($Compile.attr("disabled"))
        {
            $('.shade-sel').css('display', 'none').parent('div').css("border-color", "#ccc");
            $(item).text("保存").prev().css("display", "block");//改变文字
            $Compile.removeAttr("disabled").css("border-color", "#ccc");//取消禁用
            console.log('编辑')
        } else
        {
            if (!myjs.isNull($('#userPlaceArea').val()))
            {
                $('.shade-sel').css('display', 'block').parent('div').css("border-color", "#fff");
                $(item).text("编辑").prev().css("display", "none");
                $Compile.attr("disabled", "true").css("border-color", "#fff");
                qm_cooperationlist.submitData();
                console.log('保存')
            }else {
                $('.shade-sel').css('display', 'block').parent('div').css("border-color", "#fff");
                $(item).text("编辑").prev().css("display", "none");
                $Compile.attr("disabled", "true").css("border-color", "#fff");
            }
        }
    },
    cancelCompile: function (item)
    {
        qm_cooperationlist.setData();
        $(item).css('display', 'none');
        $('#compilebox').text('编辑')
    },
    submitData: function ()
    {
        var url = path + '/s/updateCustomer.action';
        var params = {};
        var thisval = $('#userPlaceType').find("option:selected").text(); //获取选中下拉列表的值
        params['customerId'] = urlParams.split('=')[1];
        params['businessAddress'] = $.trim($('#userPlaceArea').val());
        params['station'] = myjs.isNull($.trim($('#userdefined').val())) ? thisval : $.trim($('#userdefined').val());
        // console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            if (state == '1')
            {

            }
        })
    },

    getFarmer: function (pageNum, pageSize)
    {
        console.log('21112')
        var url = path + '/s/listFarmer.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        console.log(params,'合作社ID')
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var pageCount = data.pageCount;
            console.log(data)
            var data = data.result;

            if (state == '1')
            {
                var sign = urlParams.split('=')[0] != 'resource' ? 'nhid' : 'rSite';
                console.log(sign, '状态')
                $('#pageright').text(pageCount)
                $('#table tr:first-child').nextAll().remove();
                for (var i = 0; i < data.length; i++)
                {
                    var $tr = '<tr>' +
                        '<td>' + data[i].farmerName + '</td>' +
                        '<td>' + data[i].farmerPhone + '</td>' +
                        '<td> 还没有 </td>' +
                        '<td>' +
                        '<a class="personnel-details"  href=qm-cooperationfarmer.jsp?' + sign + '=' + data[i].farmerId + '&hzsid=' + urlParams.split('=')[1] + '&name=' + escape(data[i].farmerName) + '&phone=' + data[i].farmerPhone + '>详细信息</a>' +
                        '</td>' +
                        '</tr>';
                    $('#table').append($tr);
                }
            }
        })
    },
    //
    // inputmap: function (item)
    // {
    //     console.log('111')
    //     if ($(item).focus())
    //     {
    //         console.log('222')
    //         $('#map').css('display', 'block')
    //     }
    // },
    // mapHidden: function ()
    // {
    //     $('#map').css('display', 'none')
    // },
    pageShowNum: function (item)
    {
        //选择显示数量
        $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($(item).text());
        var pageCount = $.trim($('#pageright').text());
        var pageresult = (pageNum == pageCount) ? 1 : pageNum;
        $('#branchpageleft').html(pageresult);

        qm_cooperationlist.getFarmer(pageNum, pageSize);

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

            qm_cooperationlist.getFarmer(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_cooperationlist.getFarmer(pageNum, pageSize);
        }
    },
    SearchChange: function ()
    {
        var thisval = $('#userPlaceType').find("option:selected").text(); //获取选中下拉列表的值

        $("#userdefined").val(thisval); //将选中的值赋值给input
        if (thisval == '自定义')
        {
            $("#userdefined").css('display', 'block')
            $("#userdefined").val('').focus()

        } else
        {
            $("#userdefined").css('display', 'none')
        }
    },
    gobock: function ()
    {

        var url = urlParams.split('=')[0];
        console.log(url, '地址')
        switch (url)
        {
            case 'khid':
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