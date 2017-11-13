/**
 * Created by Administrator on 2017/9/15.
 */
var qm_manageunit = {

    inint: function ()
    {

        $('.checkboxbut').attr('onclick', 'qm_manageunit.addchecked(this)');
        console.log(urlParams.split('=')[0], '养殖列表的');
        switch (urlParams.split('=')[0])
        {
            case 'addunit':
                $('#compilebox').remove();
                qm_manageunit.initMap();
                $('.site-li').find('input').css('border-color','#CCCCCC');
                console.log('添加')
                break;
            case 'cUnit':
                qm_manageunit.initMap();
                $('.checkboxbut').removeAttr('onclick', 'qm_manageunit.addchecked(this)');
                qm_manageunit.getManageUnit();
                $('.disable-sign').css('border-color', '#ffffff').attr('disabled', true);
                $('#manageAddress').unbind('click');
                $('.checkboxbut').unbind('click');
                $('#butbox').remove();

                break;
            case 'rUnit':
                $('.checkboxbut').removeAttr('onclick', 'qm_manageunit.addchecked(this)');
                qm_manageunit.getManageUnit();
                $('.disable-sign').css('border-color', '#ffffff').attr('disabled', true);
                $('#manageAddress').unbind('click');
                $('.checkboxbut').unbind('click');
                $('#butbox').remove();
                $('#removedata').remove();
                $('#changeCompile').remove();
                break;
        }
    },
    initMap: function ()
    {
        var success = function (rep)
        {
            var location = rep.regeocode.pois[0].location;
            $("#branch-lat-lng").val(location.lat + "," + location.lng);
            $("#manageAddress").val(rep.regeocode.pois[0].name);
        };
        var fail = function (rep)
        {
            // console.log(rep);
        };
        dragMap.init("map", "tip", success, fail);
    },
    submitMessage: function ()
    {
        //提交按钮
        var inputval = 0;
        $('.disable-sign').each(function ()
        {
            if (myjs.isNull($(this).val()))
            {
                $(this).focus().css('border-color', 'red');
                inputval += 1;
            }
        })
        if (inputval == 0)
        {
            var titletext = '提示';
            var conttext = '是否要添加新的经营单位';
            var leftbuttext = '是';
            var fnleft = 'qm_manageunit.submitData()';
            var rightbuttext = '否';
            var fnright = 'indenxlogin.removepop()';
            indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
        }
    },
    submitData: function ()
    {
        //提交
        var url = path + '/s/saveManageUnit.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        params['manageName'] = $.trim($('#manageName').val());
        params['manageAddress'] = $.trim($('#manageAddress').val());
        params['manageType'] = qm_manageunit.getTypeData();
        params['manageAcreage'] = $.trim($('#manageAcreage').val());
        console.log(params);
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            if (state == '1')
            {
                location.href = 'qm-manageunitlist.jsp?cUnitGo=1';
            }
        })
    },
    getTypeData: function ()
    {
        //获取类型
        var typedata = '';
        $('.checkboxdata').each(function ()
        {
            if ($(this).hasClass('checked'))
            {
                typedata += $(this).next().text() + ',';
            }
        });
        if ($('#textareabut').hasClass('checked') && !myjs.isNull($('#textarea').val()))
        {
            typedata += $('#textarea').val() + ',';
        }
        return typedata;
    },
    butshow: function ()
    {
        $('#butbox').css('display', 'none');
        $('#changeCompile').css('display', 'block');
        $('.disable-sign').attr('disabled', 'disabled').css("border-color", "#fff").unbind("click");
        $('.shade-sel').css('display', 'block').parent('div').css("border-color", "#fff");
    },

    changeCompile: function ()
    {
        //修改按钮
        if ($('.disable-sign').attr("disabled"))
        {
            $('.shade-sel').css('display', 'none').parent('div').css("border-color", "#ccc");
            $('#changeCompile').text("保存");
            $('#cancelCompile').css("display", "block");//改变文字
            $('.disable-sign').removeAttr("disabled").css("border-color", "#ccc");//取消禁用
            $('.checkboxbut').attr('onclick', 'qm_manageunit.addchecked(this)');
            if ($('#textareabut').hasClass('checked'))
            {
                $('#textarea').removeAttr('disabled');
            }
        } else
        {
            var inputval = 0;
            $('.disable-sign').each(function ()
            {
                if (myjs.isNull($(this).val()))
                {
                    $(this).focus().css('border-color', 'red');
                    inputval += 1;
                }
            })
            if (inputval == 0)
            {
                $('.checkboxbut').removeAttr('onclick', 'qm_manageunit.addchecked(this)');
                var titletext = '提示';
                var conttext = '是否要修改该经营单位';
                var leftbuttext = '是';
                var fnleft = 'qm_manageunit.compileData()';
                var rightbuttext = '否';
                var fnright = 'indenxlogin.removepop()';
                indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
            }
        }
    },

    compileData: function ()
    {
        //修改信息
        var url = path + '/s/updateManageUnit.action';
        var params = {};
        params['manageId'] = urlParams.split('&')[0].split('=')[1];
        params['manageName'] = $.trim($('#manageName').val());
        params['manageAddress'] = $.trim($('#manageAddress').val());
        params['manageType'] = qm_manageunit.getTypeData();
        params['manageAcreage'] = $.trim($('#manageAcreage').val());
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '修改')
            var state = data.state;
            if (state == '1')
            {
                indenxlogin.removepop();
                $('#textarea').attr('disabled', true);
                $('.shade-sel').css('display', 'block').parent('div').css("border-color", "#fff");
                $('#changeCompile').text("编辑");
                $('.disable-sign').attr("disabled", "true").css("border-color", "#fff");
            }
        })
    },
    // cancelCompile: function ()
    // {
    //     $('.shade-sel').css('display', 'none').parent('div').css("border-color", "#ccc");
    //     $('#cancelCompile').css('display', 'none');
    //     $('#changeCompile').text("编辑").css("display", "block");//改变文字
    //     $('.disable-sign').attr("disabled", "true").css("border-color", "#fff");//取消禁用
    //     qm_manageunit.getUserPlace();
    // },

    getManageUnit: function ()
    {
        //获取单位详情
        var url = path + '/s/getManageUnit.action';
        var params = {};
        var manageId = $.trim(urlParams.split('&')[0].split('=')[1]);//拆分传过来的id取到场地id
        params['manageId'] = manageId;
        myjs.ajax_post(url, params, function (data)
        {
            var typearr = ['猪', '鱼', '虾'];
            console.log(data);
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                //
                var typedata = data.manageType.split(',');
                $('#manageName').val(data.manageName);
                $('#manageAcreage').val(data.manageAcreage);
                $('#manageAddress').val(data.manageAddress);
                $('#userEmployeeNum').val(data.userEmployeeNum);
                if (!myjs.isNull(typedata))
                {
                    for (var i = 0; i < (typedata.length - 1); i++)
                    {
                        console.log(typedata.length - 2)
                        var typefx = typedata[i];
                        qm_manageunit.isInArray(typefx, typearr)
                    }
                }
            }
        })
    },
    isInArray: function (typefx, typearr)
    {
        //判断哪些被选中
        if ($.inArray(typefx, typearr) != '-1')
        {
            $('.checkboxtext').each(function ()
            {
                if ($(this).text() == typefx)
                {
                    $(this).prev().addClass('checked');
                }
            })
        } else
        {
            $('#textareabut').addClass('checked');
            $('#textarea').val(typefx)
        }
    },
    removeBut: function ()
    {
        var titletext = '提示';
        var conttext = '是否要删除该经营单位';
        var leftbuttext = '是';
        var fnleft = 'qm_manageunit.removeData()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    removeData: function ()
    {
        var url = path + '/s/removeManageUnit.action';
        var params = {};
        params['manageId'] = urlParams.split('&')[0].split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            if (state == '1')
            {
                location.href = "qm-manageunitlist.jsp?cUnitGo=1";
            }
        })
    },

    inputmap: function (item)
    {
        if ($(item).focus())
        {
            console.log('222')
            $('#map').css('display', 'block')
        }
    },
    mapHidden: function ()
    {
        $('#map').css('display', 'none')
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
        // $('#customerlist tr:first-child').nextAll().remove();
        qm_manageunit.getUserBreed(pageNum, pageSize);

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

            qm_manageunit.getUserBreed(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_manageunit.getUserBreed(pageNum, pageSize);
        }
    },
    gobock: function ()
    {
        var url = urlParams.split('=')[0];
        console.log(url, '地址')
        switch (url)
        {
            case 'addunit':
                location.href = "qm-manageunitlist.jsp?cUnitGo=1";
                break;
            case 'cUnit':
                location.href = "qm-manageunitlist.jsp?cUnitGo=1";
                break;
            case 'rUnit':
                location.href = "qm-manageunitlist.jsp?rUnitGo=1";
                break;
            default:
                break;
        }
    },
    addchecked: function (item)
    {
        //添加选中状态
        if ($(item).hasClass('checked'))
        {
            $(item).removeClass('checked');

        } else
        {
            $(item).addClass('checked')
        }
        qm_manageunit.textarea()


    },
    textarea: function ()
    {

        if ($('#textareabut').hasClass('checked'))
        {
            $('#textarea').removeAttr('disabled', 'disabled');
            console.log('111')
        } else
        {
            console.log('2')
            $('#textarea').prop('disabled', true);
        }
    },

}