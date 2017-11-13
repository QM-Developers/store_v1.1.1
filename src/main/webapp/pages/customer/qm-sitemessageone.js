/**
 * Created by Administrator on 2017/9/1.
 */
var qm_sitemessageone = {

    inint: function ()
    {
        qm_sitemessageone.initMap();

        var urltype = urlParams.split('=')[0];
        switch (urltype)
        {
            //个体 过来的添加
            case 'graddsite':
                $('#sitemessagebox').css('display', 'block');
                $('.site-li input').css('border-color', '#ccc');
                $('#butbox').css('display','block');
                $('#compilebox').remove();
                break;
            case 'grsite':
                //个体场地过来的
                $('#siteheader').css('display', 'block');
                $('#sitemessagebox').css('display', 'block');
                $('#sitelistbox').css('display', 'block');
                $('#compilebox').css('display','block');
                $('#butbox').remove();
                $.cookie('grsite', urlParams);
                qm_sitemessageone.setDataOne();
                break;
            case 'graddxqbock':
                //个体添加的返回
                if ($.cookie('grsite') != null)
                {
                    urlParams = $.cookie('grsite');
                    qm_sitemessageone.setDataOne();
                }
                break;

            //合作社
            case 'addsite':
                //合作社 添加进来的
                $('#sitemessagebox').css('display', 'block');
                break;

            case 'cdid':
                // 合作社详情进来的
                $.cookie('changdiid', urlParams);
                qm_sitemessageone.setDataTwo();
                break;

            case 'yzbock':
                //合作社 详细过去的养殖返回
                if ($.cookie('changdiid') != null)
                {
                    urlParams = $.cookie('changdiid');
                    qm_sitemessageone.setDataTwo();
                }
                break;
            case 'addbock':
                //  添加过去的养殖返回
                if ($.cookie('changdiid') != null)
                {
                    urlParams = $.cookie('changdiid');
                    qm_sitemessageone.setDataTwo();
                }
                break;

            case 'rSitebreed':
                //客户资源
                $.cookie('rSitebreed', urlParams);
                $('#siteheader').css('display', 'none');
                $('#compilebox').remove();
                $('#removedata').remove();
                qm_sitemessageone.setDataTwo();
                break;
            case 'rMessageGo':
                //客户资源
                if ($.cookie('rSitebreed') != null)
                {
                    urlParams = $.cookie('rSitebreed');
                    $('#siteheader').css('display', 'none');
                    $('#compilebox').remove();
                    $('#removedata').remove();
                    qm_sitemessageone.setDataTwo();
                }
                break;
            case 'rGrSite':
                //客户资源
                $.cookie('rGrSite', urlParams);
                $('#siteheader').css('display', 'none');
                $('#compilebox').remove();
                $('#removedata').remove();
                qm_sitemessageone.setDataOne();
                break;
            case 'rgrBreedGo':
                //客户资源
                if ($.cookie('rGrSite') != null)
                {
                    urlParams = $.cookie('rGrSite');
                    $('#siteheader').remove();
                    $('#compilebox').remove();
                    $('#removedata').remove();
                    qm_sitemessageone.setDataTwo();
                }
                break;
            default:
                break;
        }
        console.log(urlParams, '场地')
    },
    setDataOne: function ()
    {
        $('#siteheader').find('a').attr('href', 'qm-addBreed.jsp?graddyz=' + urlParams.split('&')[0].split('=')[1] + '&user=' + urlParams.split('&')[1].split('=')[1]);
        $('#sitetitle>.sitetitle-a').attr('id', urlParams.split('&')[0].split('=')[1]);
        qm_sitemessageone.getUserPlace();
    },
    setDataTwo: function ()
    {
        $('#siteheader').find('a').attr('href', 'qm-addBreed.jsp?siteid=' + urlParams.split('&')[0].split('=')[1] + '&userid=' + urlParams.split('&')[1].split('=')[1]);
        $('#sitetitle>.sitetitle-a').attr('id', urlParams.split('&')[0].split('=')[1]);
        qm_sitemessageone.getUserPlace();
    },
    initMap: function ()
    {
        var success = function (rep)
        {
            var location = rep.regeocode.pois[0].location;
            $("#branch-lat-lng").val(location.lat + "," + location.lng);
            $("#userPlaceArea").val(rep.regeocode.pois[0].name);
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
            qm_sitemessageone.butshow();
            qm_sitemessageone.submitData();
        }else {

        }
    },
    butshow: function ()
    {
        $('#butbox').remove();
        $('#changeCompile').css('display', 'block');
        $('.disable-sign').attr('disabled', 'disabled').css("border-color", "#fff").unbind("click");
        $('.shade-sel').css('display', 'block').parent('div').css("border-color", "#fff");
    },
    changeCompile: function ()
    {
        if ($('.disable-sign').attr("disabled"))
        {
            $('.shade-sel').css('display', 'none').parent('div').css("border-color", "#ccc");
            $('#changeCompile').text("保存");
            $('#cancelCompile').css("display", "block");//改变文字
            $('.disable-sign').removeAttr("disabled").css("border-color", "#ccc");//取消禁用
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
                $('.shade-sel').css('display', 'block').parent('div').css("border-color", "#fff");
                $('#changeCompile').text("编辑");
                $('#cancelCompile').css("display", "none");
                $('.disable-sign').attr("disabled", "true").css("border-color", "#fff");
                qm_sitemessageone.compileData();
            }
        }
    },
    cancelCompile: function ()
    {
        $('.shade-sel').css('display', 'none').parent('div').css("border-color", "#ccc");
        $('#cancelCompile').css('display', 'none');
        $('#changeCompile').text("编辑");//改变文字
        $('.disable-sign').attr("disabled", "true").css("border-color", "#fff");//取消禁用
        qm_sitemessageone.getUserPlace();
    },
    submitData: function ()
    {
        //提交
        var url = path + '/s/saveUserPlace.action';
        var params = {};

        params['customerId'] = urlParams.split('=')[1];
        params['userPlaceArea'] = $.trim($('#userPlaceArea').val());
        params['userPlaceType'] = $.trim($('#userPlaceType').val());
        params['userEmployeeNum'] = $.trim($('#userEmployeeNum').val());
        // console.log(params);
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '提交')
            var state = data.state;
            if (state == '1')
            {
                // var pageNum = $.trim($('#pageleft').text());
                // var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
                // $('#sitelistbox').css('display', 'block');
                // var id = data.result;
                // var sign = urlParams.split('=')[0] != 'graddsite' ? 'siteid' : 'grsiteid';
                // $('#siteheader').css('display', 'block').find('a').attr('href', 'qm-addBreed.jsp?' + sign + '=' + id);
                // $('#sitetitle>a').attr('id', id)
                // qm_sitemessageone.getUserBreed(pageNum, pageSize)
                if (urlParams.split('=')[0] == 'cdid' )
                    location.href = "qm-cooperationfarmer.jsp?cdid=2";
                if (urlParams.split('=')[0] == 'grsite' )
                    location.href = "qm-sitedatalistone.jsp?graddsiteback=4";
            }
        })
    },
    compileData: function ()
    {
        var url = path + '/s/updateUserPlace.action';
        var params = {};
        params['userPlaceId'] = $.trim(urlParams.split('&')[0].split('=')[1]);
        params['userPlaceArea'] = $.trim($('#userPlaceArea').val());
        params['userPlaceType'] = $.trim($('#userPlaceType').val());
        params['userEmployeeNum'] = $.trim($('#userEmployeeNum').val());
        // console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '修改')
            var state = data.state;
            if (state == '1')
            {

            }
        })
    },
    getUserPlace: function ()
    {
        //获取场地详情
        var urldz = urlParams.split('=')[0];
        var url = path;

        var params = {};
        if (urldz == 'grsite' || urldz == 'cdid')
        {
            console.log('走客户路线')
            url += '/s/getUserPlace.action';
        } else if (urldz == 'rGrSite' || urldz == 'rSitebreed')
        {
            console.log('走资源路线')
            url += '/s/getVisitUserPlace.action';
        }

        var userPlaceId = $.trim(urlParams.split('&')[0].split('=')[1]);
        params['userPlaceId'] = userPlaceId;
        console.log(params, '看这个')
        myjs.ajax_post(url, params, function (data)
        {
            // console.log(data);
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#sitetitle>.sitetitle-a').attr('id', data.userPlaceId)
                $('#userPlaceArea').val(data.userPlaceArea);
                $('#userPlaceType').val(data.userPlaceType);
                $('#userEmployeeNum').val(data.userEmployeeNum);
                qm_sitemessageone.butshow();

                var pageNum = $.trim($('#pageleft').text());
                var pageSize = $.trim($('#pagebox').find('.paging-checked').text());

                qm_sitemessageone.getUserBreed(pageNum, pageSize)

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
    getUserBreed: function (pageNum, pageSize)
    {
        //获取养殖列表
        var url = path + '/s/listUserBreed.action';
        var params = {};
        var userPlaceId = $.trim($('#sitetitle>.sitetitle-a').attr('id'));
        params['userPlaceId'] = userPlaceId;
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        // console.log(urlParams)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '养殖产品列表')
            var state = data.state;
            var pageCount = data.pageCount;
            var data = data.result;
            if (state == '1')
            {
                $('#table').find('tr:first-child').nextAll().remove();
                $('#pageright').text(pageCount);
                var sign = urlParams.split('=')[0];
                for (var i = 0; i < data.length; i++)
                {
                    var $tr = '<tr>' +
                        '<td>' + data[i].breedCategory + '</td>' +
                        '<td>' + data[i].breedVariety + '</td>' +
                        '<td>' + data[i].breedType + '</td>' +
                        '<td>' +
                        '<a class="personnel-details" href=qm-addBreed.jsp?' + qm_sitemessageone.getUrlType(sign) + '=' + userPlaceId + '&userid=' + urlParams.split('&')[1].split('=')[1] + '&breedid=' + data[i].breedId + '>详细信息</a>' +
                        '</td>' +
                        '</tr>';
                    $('#table').append($tr);
                }
            }
        })
    },
    getUrlType: function (urlParams)
    {
        var sign = urlParams.split('=')[0];
        switch (sign)
        {
            case 'grsite':
                return sign = 'grfrom';
                break;
            case 'graddbock':
                return sign = 'grfrom';
                break;
            case 'rSitebreed':
                return sign = 'rBreedMessage';
                break;
            case 'rGrSite':
                return sign = 'rgrbreed';
                break;
            default:
                return sign = 'cdxqfrom';
                break;
        }
    },
    removeBut: function ()
    {
        var titletext = '提示';
        var conttext = '是否删除场地';
        var leftbuttext = '是';
        var fnleft = 'qm_sitemessageone.removeSite()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    removeSite: function ()
    {
        var url = path + '/s/removeUserPlace.action';
        var params = {};
        //addsite 合作社添加标记
        //cdid合作社查看标记
        //graddsite 个体户添加标记
        //grsite 个体户查看标记
        if (urlParams.split('=')[0] == 'addsite' || urlParams.split('=')[0] == 'graddsite')
            params['userPlaceId'] = $.trim($('#sitetitle>a').attr('id'));
        if (urlParams.split('=')[0] == 'cdid' || urlParams.split('=')[0] == 'grsite')
            params['userPlaceId'] = urlParams.split('&')[0].split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                console.log(urlParams.split('=')[0], '删除场地')
                if (urlParams.split('=')[0] == 'addsite' || urlParams.split('=')[0] == 'cdid')
                    location.href = "qm-cooperationfarmer.jsp?cdid=2";
                if (urlParams.split('=')[0] == 'graddsite' || urlParams.split('=')[0] == 'grsite')
                    location.href = "qm-sitedatalistone.jsp?graddsiteback=4";
            }
        })
    },
    inputmap: function (item)
    {
        // console.log('111')
        if ($(item).focus())
        {

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
        qm_sitemessageone.getUserBreed(pageNum, pageSize);

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

            qm_sitemessageone.getUserBreed(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            qm_sitemessageone.getUserBreed(pageNum, pageSize);
        }
    },
    gobock: function ()
    {
        var url = urlParams.split('=')[0];
        console.log(url, '地址')
        switch (url)
        {
            case 'addsite':
                location.href = "qm-cooperationfarmer.jsp?addsiteback=1";
                break;
            case 'cdid':
                location.href = "qm-cooperationfarmer.jsp?cdidgo=2";
                break;
            case 'grsite':
                location.href = "qm-sitedatalistone.jsp?grsiteback=3";
                break;
            case 'graddsite':
                location.href = "qm-sitedatalistone.jsp?graddsiteback=4";
                break;
            case 'rSitebreed':
                location.href = "qm-cooperationfarmer.jsp?rBreedGO=5";
                break;
            case 'rGrSite':
                location.href = "qm-sitedatalistone.jsp?rGrSiteMessage=5";
                break;

            default:

                break;
        }
    },

}