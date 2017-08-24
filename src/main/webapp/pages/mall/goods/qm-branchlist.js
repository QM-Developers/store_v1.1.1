/**
 * Created by Administrator on 2017/8/8.
 */
$(function ()
{

    var getid = $.trim(location.search.replace("?", ""));
    console.log(getid)
    matchData(getid);
});
function matchData(getid)
{
    //比对id
    var idnum = getid;
    var pageNum = $.trim($('#currentpage').text());
    var pageSize = $.trim($('#pageshownum').find('.paging-checked').text());
    var url = "/store/s/getBranch.action";
    var params = {};
    params["branchId"] = idnum;

    myjs.ajax_post(url, params, function (data)
    {
        var state = data.state;
        var matdata = data.result;
        console.log(state)
        if (state == '1')
        {
            $('#saletitletext').html(matdata.branchName+'销售点');
            $('#goodslistId').attr('id', getid);
            getGoodsData(pageNum, pageSize)

        }
    })
};
function getGoodsData(pageNum, pageSize)
{
    //获取列表
    var goodlistid = $.trim($('#saletitletext').parent('div').attr('id'));
    var url = "/store/s/listGoods.action";
    var params = {};
    params["branchId"] = goodlistid;
    params["pageNum"] = pageNum;//当前页数
    params["pageSize"] = pageSize;//显示数量
    myjs.ajax_post(url, params, function (data)
    {
        var pageCount = data.pageCount;
        var state = data.state;
        var getdata = data.result;
        console.log(state)
        if (state == '1')
        {
            $('#goodslist li').eq(0).nextAll().remove();
            $('#amountpage').html(pageCount);

            for (var i = 0; i < getdata.length; i++)
            {

                var addli = '<li class="branchlist-list-tr">' +
                    '<div class="item1">' + parseInt(i + 1) + '</div>' +
                    '<div class="item2" id="' + getdata[i].goodsId + '">' + getdata[i].goodsName + '</div>' +
                    '<div class="item4">' + getdata[i].goodsType + '</div>' +
                    '<div class="item3">';
                for (var j = 0; j < getdata[i].standards.length; j++)
                {
                    addli += '<div class="item3-box" id="' + getdata[i].standards[j].standardId + '">' +
                        '<div class="item3-2">' + getdata[i].standards[j].standardName + '</div>' +
                        '<div class="item3-3">' + getdata[i].standards[j].standardPrice + '</div>' +
                        '<div class="item3-4">' + getdata[i].standards[j].standardCount + '</div>' +
                        '<div class="item3-5">' +
                        '<input class="item4-input" onkeyup=(this.v=function(){this.value=this.value.replace(/[^0-9]+/,"");}).call(this) onblur=this.v()  placeholder="' + getdata[i].standards[j].branchStandardCount + '" />' +
                        '</div>' +
                        '</div>';
                }
                addli += '</div>' +
                    '</li>';
                $('#goodslist').append(addli);
            }
        }
    })
};

function pageShowNum(item)
{
    //选择显示数量
    $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
    var pageNum = $.trim($('#currentpage').text());
    var pageSize = $.trim($(item).text());
    var pageCount = $.trim($('#amountpage').text());
    var pageresult = (pageNum == pageCount) ? 1 : pageNum;
    $('#currentpage').html(pageresult);
    getGoodsData(pageresult, pageSize)
};

function pagePrompt(item)
{
    var nullnum = 0;
    nextPageitem = item;
    var thispage = $.trim($('#currentpage').text());
    var sumpage = $.trim($('#amountpage').text());
    var titletext = '提示';
    var conttext = '存在未分配数量，请先提交分配再翻页否则输入的分配数量将会丢失'
    var leftbuttext = '继续翻页';
    var fnleft = 'nextPage()';
    var rightbuttext = '否';
    var fnright = 'indenxlogin.ErrorpopRemove(this)';

    $('#goodslist input').each(function ()
    {
        if (!myjs.isNull($(this).val()))
        {
            console.log('弹窗')
            console.log($(this).val())
            nullnum += 1;
        }
    });
    if (nullnum == 0)
    {
        nextPage()
    } else
    {
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    }

};

function nextPage()
{
    //翻页

    var pagetext = $.trim($(nextPageitem).text());
    console.log(pagetext)
    var pageSizetext = $.trim($('#currentpage').text());
    var pageCount = $.trim($('#amountpage').text());
    var pageSize = $.trim($('#pageshownum').find('.paging-checked').text());
    if (pagetext == '下一页')
    {
        if (pageSizetext >= pageCount)
            return;
        var pageNum = Math.ceil((pageSizetext - 0) + 1);
        $('#currentpage').html(pageNum);

        getGoodsData(pageNum, pageSize)
    } else
    {
        if (pageSizetext <= 1)
            return;
        var pageNum = Math.ceil((pageSizetext - 0) - 1);
        $('#currentpage').html(pageNum);
        getGoodsData(pageNum, pageSize)
    }
    $('.password-box').remove();
};

function submitInputData()
{
    //提交
    var branchId = $.trim($('#saletitletext').parent('div').attr('id'));
    var pageNum = $.trim($('#currentpage').text());
    var pageSize = $.trim($('#pageshownum').find('.paging-checked').text());
    console.log(branchId)
    var url = "/store/s/updateBranchGoods.action";
    var params = {};
    params["branchId"] = branchId;
    params["goodsId"] = getGoodsId();
    params["standardId"] = getStandardId();
    params["standardCount"] = standardCount();
    console.log(params)
    myjs.ajax_post(url, params, function (data)
    {
        var state = data.state;
        var matdata = data.result;
        console.log(state)
        if (state == '1')
        {
            getGoodsData(pageNum, pageSize)
        }
    })

};

function getGoodsId()
{
    var getgoodsid = '';
    $('#goodslist input').each(function ()
    {
        if (!myjs.isNull($(this).val()))
        {
            getgoodsid += $(this).parents('li').find('.item2').attr('id') + ",";
        }
    });
    // console.log(getgoodsid)
    return getgoodsid.substring(0, getgoodsid.length - 1);
};

function getStandardId()
{
    var getstandardid = '';
    $('#goodslist input').each(function ()
    {
        if (!myjs.isNull($(this).val()))
        {
            getstandardid += $(this).parents('.item3-box').attr('id') + ",";
        }
    });
    console.log(getstandardid)
    return getstandardid.substring(0, getstandardid.length - 1);
};

function standardCount()
{
    var standardCount = '';
    $('#goodslist input').each(function ()
    {
        if (!myjs.isNull($(this).val()))
        {
            standardCount += $.trim($(this).val()) + ",";
        }
    });
    // console.log(standardCount)
    return standardCount.substring(0, standardCount.length - 1);
};

// function noNumbers(e)
// {
//     var keynum;
//     var keychar;
//     var numcheck;
//     if (window.event) // IE
//     {
//         keynum = e.keyCode
//     } else if (e.which) // Netscape/Firefox/Opera
//     {
//         keynum = e.which
//     }
//     keychar = String.fromCharCode(keynum)
//     numcheck = /^[0-9]*$/;
//     return numcheck.test(keychar)
// }