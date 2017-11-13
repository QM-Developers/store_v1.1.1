/**
 * Created by Administrator on 2017/10/10.
 */
var qm_warehouse = {
    sign_Seo: '',
    inint: function ()
    {
        signCheck = parent.document.getElementById('positionName').getAttribute('name');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        var urlType = urlParams.split('=')[0];
        switch (urlType)
        {
            case 'all':
                qm_warehouse.getData(pageNum, pageSize)
                $('#gobockbut').remove();

                sign_Seo = '';
                break;
            case 'single':
                if (signCheck == 'salesman_manager')
                {
                    $('#checkMonad').css('visibility', 'hidden');
                    $('#buildMonad').html('<i class="site-header-i"></i>新建调货单')

                } else
                {
                    $('#checkMonad').css('visibility', 'hidden');
                    $('#buildMonad').css('visibility', 'hidden');
                }
                $('#gobockbut').remove();
                qm_warehouse.getBranchData(pageNum, pageSize);
                sign_Seo = 'signCheck';
                break;
            case 'looksingle':
                $('#checkMonad').css('visibility', 'hidden');
                $('#buildMonad').css('visibility', 'hidden');
                qm_warehouse.lookWarehouse(pageNum, pageSize);
                $('#gobockbut').css('display','block');

                sign_Seo = 'looksingle';
                break;
            default:
                break;
        }

        qm_warehouse.findTypeList(0);

    },
    getBranchData: function (pageNum, pageSize)
    {
        //查看当前销售点库存
        var url = path + '/s/getRepertory.action';
        var params = {};
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            // var sign = signCheck == 'salesman_manager'?'buil':''
            console.log(data, '当前库存')
            $('#buildMonad').attr('href', 'qm-addwarehouse.jsp?buil=' + data.branchId + '&branchName=' + escape(data.branchName));
            $('#header-box').find('div').attr('id',data.branchId);
            var pageCount = data.pageCount;
            $('#pageright').text(pageCount)
            var state = data.state;
            var data = data.result;
            $('#ul-table li:first-child').nextAll().remove();
            if (state == '1')
            {

                qm_warehouse.forData(data)
            }
        })
    },
    lookWarehouse: function (pageNum, pageSize)
    {
        //查看销售点库存
        var url = path + '/s/listBranchGoods.action';
        var params = {};
        params['branchId'] = urlParams.split('=')[1];
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '销售点库存')
            // $('#buildMonad').attr('href', 'qm-addwarehouse.jsp?buil=' + data.branchId + '&branchName=' + escape(data.branchName));
            var pageCount = data.pageCount;
            $('#pageright').text(pageCount)
            var state = data.state;
            var data = data.result;
            $('#ul-table li:first-child').nextAll().remove();
            if (state == '1')
            {
                qm_warehouse.forData(data)

            }
        })
    },
    findTypeList: function (pid)
    {
        var url = path + "/s/findGoodsTypeByPid.action";
        var params = {};

        params["goodsTypePid"] = pid;
        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            if (!myjs.isNull(data))
            {
                qm_warehouse.appendList(data);
            } else
            {
                var pageNum = $.trim($('#pageleft').text());
                var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
                qm_warehouse.getData(pageNum, pageSize, pid)
                $('#selseo-ul-1').parent('div').attr('id', pid)
                sign_Seo = 'TypeSeo';
            }
        });
    },

    appendList: function (data)
    {
        var num = 0;
        $(".selseo span").each(function ()
        {
            if (!myjs.isNull($(this).text()))
                num += 1;
        })
        var wid = "wid_" + $(".selseo ul").length;
        var item = '<ul class="selseo-ul" id="' + wid + '" onmouseleave="qm_warehouse.SelectHidden()">';

        for (var i = 0; i < data.length; i++)
            item += '<li class="selseo-li"  onClick="qm_warehouse.onSelect(this,event);" id="' + data[i]["goodsTypeId"] + '"><a class="selseo-a">' + data[i]["goodsTypeName"] + '</a></li>';
        item += '</ul>';
        if ($(".selseo").eq(num).find('ul').leng > 0)
            $(".selseo").eq(num).find('ul').remove().append(item);
        else
            $(".selseo").eq(num).append(item);


    },

    onSelect: function (item, event)
    {
        $(item).parents('.selseo').find('span').text($(item).find('a').text())
        $(item).parents('.selseo').nextAll().find('ul').remove();
        $(item).parents('.selseo').nextAll().find('span').text('')
        $(item).parents('.selseo').find('.selseo-ul').css('display', 'none')
        var onid = $(item).attr('id').trim();
        qm_warehouse.findTypeList(onid)
        event.stopPropagation()

    },
    SelectShow: function (item)
    {
        $(item).find('ul').css('display', 'block')
    },
    SelectHidden: function ()
    {
        $('.selseo-ul').css('display', 'none');
    },
    goodsSeo: function ()
    {
        //商品搜索
        if (myjs.isNull($("#keyword").val()) && urlParams.split('=')[0]=='all')
        {
            var pageNum = $.trim($('#pageleft').text());
            var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
            qm_warehouse.getData(pageNum, pageSize);
            console.log('进入1')
            return false;
        }
        if (myjs.isNull($("#keyword").val()) && urlParams.split('=')[0]=='single')
        {
            var pageNum = $.trim($('#pageleft').text());
            var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
            qm_warehouse.getBranchData(pageNum, pageSize);
            console.log('进入2')
            return false;
        }
        console.log('进入3')
        var url = path + "/s/listRepertoryByKeyword.action";
        var params = {};
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        var branchId = $('#header-box').find('div').attr('id');
        params["branchId"] = branchId;
        params["keyword"] = $("#keyword").val().trim();
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;
        console.log(params, 's')
        myjs.ajax_post(url, params, function (data)
        {
            $('#ul-table li:first-child').nextAll().remove();
            var pageCount = data.pageCount;
            $('#pageright').text(pageCount);
            data = data.result;
            qm_warehouse.forData(data)
            sign_Seo = 'branchSeo';
        });
    },
    getData: function (pageNum, pageSize, goodsTypeId)
    {
        //总部仓库
        var url = path + '/s/getFirstRepertory.action';
        var params = {};
        params['goodsTypeId'] = goodsTypeId;
        params['pageNum'] = pageNum;
        params['pageSize'] = pageSize;

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data,'总部')
            $('#header-box').find('div').attr('id', data.branchId);
            $('#buildMonad').attr('href', 'qm-addwarehouse.jsp?buil=' + data.branchId);
            $('#checkMonad').attr('href', 'qm-checkwarehouse.jsp?buil=' + data.branchId);

            var pageCount = data.pageCount;
            $('#pageright').text(pageCount)
            var state = data.state;
            var data = data.result;

            $('#ul-table li:first-child').nextAll().remove();
            if (state == '1')
            {
                qm_warehouse.forData(data)
            }
        })
    },
    forData: function (data)
    {
        var item = "";
        for (var i = 0; i < data.length; i++)
        {
            item += '<li class="list-li">' +
                '<div class="item1">' + data[i]["goodsCode"] + ' </div>' +
                '<div class="item2">' + data[i]["goodsName"] + '</div>' +
                '<div class="item3">' + data[i]["goodsType"] + '</div>' +
                '<div class="item4">';
            var standardsList = data[i]["standards"];
            for (var j = 0; j < standardsList.length; j++)
            {
                item += '<div class="item4-box" id=' + standardsList[j]["standardId"] + '>' +
                    '<div class="item4-1">' + standardsList[j]["standardName"] + '</div>' +

                    '<div class="item4-3">' + standardsList[j]["standardCount"] + '</div>' +
                    '</div>';
            }
            item += '</li>';
        }
        $("#ul-table").append(item);
        // $('.item4').each(function ()
        // {
        //     var item4Num = $(this).find('.item4-box').length;
        //
        //     if (item4Num < 2)
        //     {
        //         $(this).find('.item4-box').css('height', $(this).height()).find('div').css({
        //             'height': $(this).height(),
        //             'line-height': $(this).height() + 'px'
        //         })
        //
        //     }
        // })
    },
    resetBut: function ()
    {
       $('#pageleft').text('1')

        $("#keyword").val('');
        qm_warehouse.inint();
    },
    pageShowNum: function (item)
    {
        //选择显示数量

        $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
        var pageNum = '1';
        var pageSize = $.trim($(item).text());
        var pageCount = $.trim($('#pageright').text());
        var pageresult = (pageNum == pageCount) ? 1 : pageNum;
        $('#branchpageleft').html(pageresult);
        switch (sign_Seo)
        {
            case 'TypeSeo':
                var Typeid = $('#selseo-ul-1').parent('div').attr('id').trim()
                qm_warehouse.getData(pageNum, pageSize, Typeid)
                break;
            case 'branchSeo':
                qm_warehouse.goodsSeo();
                break;
            case 'signCheck':
                qm_warehouse.getBranchData(pageNum, pageSize);
                break;
            case 'looksingle':
                qm_warehouse.lookWarehouse(pageNum, pageSize);
                break;
            default:
                qm_warehouse.getData(pageNum, pageSize);
                break;
        }

        $('#pageleft').text('1')
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
            switch (sign_Seo)
            {
                case 'TypeSeo':
                    var Typeid = $('#selseo-ul-1').parent('div').attr('id').trim()
                    qm_warehouse.getData(pageNum, pageSize, Typeid)
                    break;
                case 'branchSeo':
                    qm_warehouse.goodsSeo();
                    break;
                case 'signCheck':
                    qm_warehouse.getBranchData(pageNum, pageSize);
                    break;
                case 'looksingle':
                    qm_warehouse.lookWarehouse(pageNum, pageSize);
                    break;
                default:
                    qm_warehouse.getData(pageNum, pageSize);
                    break;
            }
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            switch (sign_Seo)
            {
                case 'TypeSeo':
                    var Typeid = $('#selseo-ul-1').parent('div').attr('id').trim()
                    qm_warehouse.getData(pageNum, pageSize, Typeid)
                    break;
                case 'branchSeo':
                    qm_warehouse.goodsSeo();
                    break;
                case 'signCheck':
                    qm_warehouse.getBranchData(pageNum, pageSize);
                    break;
                case 'looksingle':
                    qm_warehouse.lookWarehouse(pageNum, pageSize);
                    break;
                default:
                    qm_warehouse.getData(pageNum, pageSize);
                    break;
            }
        }
    },

}