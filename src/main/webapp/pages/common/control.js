//城市联动
var $area = [];

function addTab(pid, name)
{

    var item = '';

    if (!myjs.isNull(name))
        $($areatab).find("li:last a").text(name);

    var count = 0;
    for (var i = 0; i < $area.length; i++)
    {
        if ($area[i]['pid'] == pid)
        {
            item += '<a onclick="addTab(' + $area[i]['id'] + ',\'' + $area[i]['name'] + '\')"> ' +
                $area[i]['name'] + ' </a>';
            count++;
            if (count % 5 == 0)
                item += '<br/>';
        }

    }

    var nav = '<li onclick="removeRightTab(this)"><a class=qm-site-a href="javascript: void(0)">请选择</a></li>';

    var content = '<div class="am-tab-panel">' + item + '</div>';

    if (!myjs.isNull(item))
    {
        $areanav.append(nav);
        $areabd.append(content);
        $areatab.tabs('refresh');
        $areatab.tabs("options");
        $areatab.tabs('open', $('.am-tabs-bd div').length - 1);

    } else
    {
        $(".areashow").val(getSelectedTab())
        $(".qm-site-ul").find("li").remove();
        $areabd.find("div").remove();
        $areatab.removeClass("doc-tab-demo-1")
        $areatab.prev().removeClass("areashow")
        //		$tab.css("display","none");
    }

}
//


//----
// $.getJSON("qwer.json", function(data) {
// 	$area = data['result']; //数据入口
// })

//----
Site = function (item)
{

//	$(".Prompt-box").css("display","block");

    $(item).addClass("areashow");
    $(item).next().addClass("doc-tab-demo-1");
// 	$areatab = $('.doc-tab-demo-1');
//
    $areanav = $areatab.find('.am-tabs-nav');
    $areabd = $areatab.find('.am-tabs-bd');

    if ($('.doc-tab-demo-1 ul li').length > 0)
    {
        return;
    }
    addTab('0');
    stopPropagation(item);
}

function getSelectedTab()
{
    var lis = $($areatab).find("li");
    var str = "";
    for (var i = 0; i < lis.length; i++)
        str += $(lis[i]).text() + " ";
    return str;
}

function removeRightTab($item)
{
    var index = $areanav.children('li').index($item);

    $($item).nextAll('li').remove();
    $($areabd).find('.am-tab-panel').eq(index).nextAll("div").remove();

    $areatab.tabs('open', index);
    $areatab.tabs('refresh');
}

//  function findArea()
//  {
//      var url = path + "/user_findAllArea.action";
//      myjs.ajax_post(url, {}, function (data)
//      {
//          $area = data['result'];
//          addTab('0');
//      });
//  }
//
//  findArea();

//获取时间
QmTime = function (item)
{
    $(item).datepicker().on('changeDate.datepicker.amui', function (event)
    {
        $(item).prev().val($(item).data('date'));

        $(this).datepicker('close');
    });
}
//性别选择
PopInput = function (item)
{

    $(item).addClass("poptwo-c-lia1")
    $(item).siblings().removeClass("poptwo-c-lia1")

}
//防止冒泡
function stopPropagation(e)
{
    if (e.stopPropagation)
        e.stopPropagation(); //停止冒泡  非ie
    else
        e.cancelBubble = true; //停止冒泡 ie
}
//控制编辑状态
Compile = function (item)
{

    var $Compile = $(item).parents(".qm-team").find("input");
    var $CompileBut = $(item).parents(".qm-team").find(".databut");

    if ($Compile.attr("disabled"))
    {
        $(item).text("保存");
        $(item).next().css("display", "block")
        $Compile.removeAttr("disabled").css("border", "1px solid #CCCCCC");
        $(item).parents(".groupdata-cont").find('select').removeAttr("disabled")
        $CompileBut.css("display", "block").prev().css("border", "0px").parent().css("border", "1px solid #CCCCCC");

        $(item).parents(".qm-team").find(".sex-show").css("display", "none")
        $(item).parents(".qm-team").find(".sex").css("display", "block")
        $(".sex a").each(function ()
        {
            if ($(this).text().trim() == $(".sex-show").text().trim())
                $(this).addClass("poptwo-c-lia1")
        })

        $(".groupdata-credit-rate a").css("display", "inline-block")
        $(item).parents(".qm-team").find(".groupdata-li").find("select").css("border", "1px solid #CCCCCC")
        return false;
    } else
    {
        $(item).text("编辑")
        $(item).next().css("display", "none")
        $Compile.attr("disabled", "true").css("border", "0");
        $(item).parents(".groupdata-cont").find('select').attr("disabled", "true")
        $CompileBut.css("display", "none").prev().css("border", "0px").parent().css("border", "0");

        $(item).parents(".qm-team").find(".sex-show").css("display", "block")
        $(item).parents(".qm-team").find(".sex").css("display", "none")
        $(".sex a").each(function ()
        {
            if ($(this).hasClass("poptwo-c-lia1"))

                $(".sex-show").text($(this).text().trim())
        });

        $(item).parents(".qm-team").find(".groupdata-li").find("select").css("border", "0")
        $(".groupdata-credit-rate a").each(function (i)
        {
            if (!$(this).hasClass("groupdata-checkbox-bg"))
                $(this).css("display", "none")
        });
        return true;
    }
};
//加载头部
$(function ()
{
    $(".groupheader").load("groupheader.html")
    $(".qm-header").load("header.html")

    $("#seobut").click(function ()
    {

        $(".companylist").css("display", "block")
    })

//	$(".qm-team input").attr("disabled","true");//禁用input


})

Removetr = function (item)
{//删除tr

    $(item).parents("tr").remove()
}
Credit = function (item)
{

    $(item).addClass("groupdata-checkbox-bg")
    $(item).siblings().removeClass("groupdata-checkbox-bg")

}