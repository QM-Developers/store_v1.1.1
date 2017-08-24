/**
 * Created by Administrator on 2017/8/16.
 */
$(function ()
{
    var pageNum = $.trim($('#branchpageleft').text());
    var pageSize = $.trim($('#branchshownum').find('.paging-checked').text());
    getFreightList(pageNum, pageSize);
});
function getFreightList(pageNum, pageSize)
{
    var url = "/store/s/listFreightTemp.action";
    var params = {};
    params["pageNum"] = pageNum;
    params["pageSize"] = pageSize;
    myjs.ajax_post(url, params, function (data)
    {
        console.log(data)
        var state = data.state;
        var pageCount = data.pageCount;
        console.log(pageCount)
        var data = data.result;
        if (state == '1')
        {
            $('#freight tr').eq(0).nextAll().empty();
            $('#branchpageright').text(pageCount)
            for (var i = 0; i < data.length; i++)
            {
                var $Tr = '<tr id="' + data[i].freightId + '">' +
                    '<td><input disabled class="getinput" value="' + data[i].freightName + '" /></td>' +
                    '<td><input disabled class="getinput" value="' + data[i].weightAllowance + '" /></td>' +
                    '<td><input disabled class="getinput" value="' + data[i].startRange + '" /></td>' +
                    '<td><input disabled class="getinput" value="' + data[i].startPrice + '" /></td>' +
                    '<td><input disabled class="getinput" value="' + data[i].increaseRange + '" /></td>' +
                    '<td><input disabled class="getinput" value="' + data[i].increasePrice + '" /></td>' +
                    '<td >' +
                    '<a   onclick="editdata(this)">编辑</a>' +
                    '<a   onclick="removetemplate(this)">删除</a>' +
                    '</td>' +
                    '</tr>';
                $('#freight').append($Tr)
            }
        }
    })
};

function removetemplate(item)
{
     tritem = item;
    var titletext = '提示';
    var conttext = '是否要删除这个运输方式'
    var leftbuttext = '是';
    var fnleft = 'Deltr()';
    var rightbuttext = '否';
    var fnright = 'indenxlogin.ErrorpopRemove(this)';

        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)


};
Deltr = function ()
{
    var url = "/store/s/removeFreightTemp.action";
    var params = {};
    var thistrid = $.trim($(tritem).parents('tr').attr('id'));
    params["freightId"] = thistrid;
    myjs.ajax_post(url, params, function (data)
    {
        $(tritem).parents("tr").remove()
        $('.password-box').remove();
    })


};

//控制模板编写
editdata = function (item)
{
    var self = item;
    var $ThisInput = $(item).parents("tr").find("input");
    if ($ThisInput.attr("disabled"))
    {
        $ThisInput.removeAttr("disabled").css('border', '1px solid red')
        $(item).text("保存")

    } else
    {
        var thisval = 0;
        $ThisInput.each(function ()
        {
            if (myjs.isNull($(this).val()))
            {
                thisval += 1;
            }
        })
        if (thisval == 0)
        {
            savesubmit(self);
            $ThisInput.attr("disabled", 'disabled').css('border-color', '#ffffff')
            $(item).text("编辑")
        }
    }
};
AddTr = function ()
{
    var $Tr = '<tr>' +
        '<td><input class="addinput" /></td>' +
        '<td><input class="addinput" /></td>' +
        '<td><input class="addinput" /></td>' +
        '<td><input class="addinput" /></td>' +
        '<td><input class="addinput" /></td>' +
        '<td><input class="addinput" /></td>' +
        '<td >' +
        '<a   onclick="editdata(this)">保存</a>' +
        '<a   onclick="Deltr(this)">删除</a>' +
        '</td>' +
        '</tr>';
    var inputval = 0;
    $('#freight tr:eq(1) input').each(function ()
    {
        if (myjs.isNull($(this).val()))
        {
            inputval += 1
        }
    });
    console.log(inputval)
    if (inputval == 0)
    {
        $('#freight tr').eq(0).after($Tr)
    }
};
function savesubmit(item)
{
    var url = '';
    var params = {};
    var inputval = $(item).parents('tr').find('input');
    var thistrid = $.trim($(item).parents('tr').attr('id'));
    if (myjs.isNull(thistrid))
    {
        console.log('提交')
        url = "/store/s/saveFreightTemp.action";
    } else
    {
        console.log('修改')
        url = "/store/s/updateFreightTemp.action";
        params["freightId"] = thistrid;
    }
    params["freightName"] = inputval.eq(0).val();
    params["weightAllowance"] = inputval.eq(1).val();
    params["startRange"] = inputval.eq(2).val();
    params["startPrice"] = inputval.eq(3).val();
    params["increaseRange"] = inputval.eq(4).val();
    params["increasePrice"] = inputval.eq(5).val();
    myjs.ajax_post(url, params, function (data)
    {
        var data = data.result;
        var trlength = $('#freight tr').eq(0).nextAll();
        if (myjs.isNull(thistrid))
        {
            $(item).parents('tr').attr('id', data)
        }
        if (trlength.length > 10)
        {

        }

    })
};
function freightShowNum(item)
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
    getFreightList(pageresult, pageSize)
};

function freightNextPage(item)
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

        getFreightList(pageNum, pageSize)
    } else
    {
        if (pageSizetext <= 1)
            return;
        var pageNum = Math.ceil((pageSizetext - 0) - 1);
        $('#branchpageleft').html(pageNum);
        getFreightList(pageNum, pageSize)
    }
};