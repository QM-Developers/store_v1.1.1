/**
 * Created by Administrator on 2017/8/12.
 */
$(function ()
{

    var getbranchid = $.trim(location.search.replace("?", ""));
    console.log(getbranchid.length)
    branchData(getbranchid);
});
function branchData(getbranchid)
{
    //比对id
    var idnum = getbranchid;
    var pageNum = $.trim($('#branchpageleft').text());
    var pageSize = $.trim($('#branchshownum').find('.paging-checked').text());
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
            $('#branchname').html(matdata.branchName).parent('div').attr('id', getbranchid);
            getBranchGoods(pageNum, pageSize)
        }
    })
};
function getBranchGoods(pageNum, pageSize)
{
    //获取列表
    console.log('进来了')
    var branchid = $.trim($('#branchname').parent('div').attr('id'));
    var url = "/store/s/listBranchGoods.action";
    console.log(branchid.length)
    var params = {};
    params["branchId"] = branchid;
    params["pageNum"] = pageNum;//当前页数
    params["pageSize"] = pageSize;//显示数量
    myjs.ajax_post(url, params, function (data)
    {
        var pageCount = data.pageCount;
        var state = data.state;
        var getdata = data.result;
        console.log(getdata)

        console.log(state)
        if (state == '1')
        {
            $('#branchgoodslist li').eq(0).nextAll().remove();
            $('#branchpageright').html(pageCount);

            for (var i = 0; i < getdata.length; i++)
            {

                var addli = '<li class="branchgoodslist-list-tr">' +
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
                        '</div>';
                }
                addli += '</div>' +
                    '<div class="item4">' + new Date(getdata[i].goodsCreateDate).format("yyyy-MM-dd") + '</div>' +
                    '<div class="item4">' +
                    '<a href=qm-branchgoodsdetails.html?'+getdata[i].goodsId+'>详情信息</a>' +
                    '</div>' +
                    '</li>';
                $('#branchgoodslist').append(addli);
            }
            ;
        }
    })
};
function pageShowNum(item)
{
    //选择显示数量
    $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
    var pageNum = $.trim($('#branchpageleft').text());
    var pageSize = $.trim($(item).text());
    var pageCount = $.trim($('#branchpageright').text());
    var pageresult = (pageNum == pageCount) ? 1 : pageNum;
    $('#branchpageleft').html(pageresult);
    console.log(pageNum)
    console.log(pageSize)
    // console.log(pageid)
    getBranchGoods(pageresult, pageSize)
};

function branchNextPage(item)
{
    //翻页
    var pagetext = $.trim($(item).text());
    console.log(pagetext)
    var pageSizetext = $.trim($('#branchpageleft').text());
    var pageCount = $.trim($('#branchpageright').text());
    var pageSize = $.trim($('#branchshownum').find('.paging-checked').text());
    console.log(pageSize)
    if (pagetext == '下一页')
    {
        if (pageSizetext >= pageCount)
            return;
        var pageNum = Math.ceil((pageSizetext - 0) + 1);
        $('#branchpageleft').html(pageNum);

        getBranchGoods(pageNum, pageSize)
    } else
    {
        if (pageSizetext <= 1)
            return;
        var pageNum = Math.ceil((pageSizetext - 0) - 1);
        $('#branchpageleft').html(pageNum);
        getBranchGoods(pageNum, pageSize)
    }
};