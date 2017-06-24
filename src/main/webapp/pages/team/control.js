//城市联动
var $area = [];

function addTab(pid, name)
{

    var item = '';

    if (!myjs.isNull(name))
        $($tab).find("li:last a").text(name);

    var count = 0;
    for (var i = 0; i < $area.length; i++)
    {
        if ($area[i]['pid'] == pid)
        {
            item += '<a onclick="addTab(' + $area[i]['id'] + ',\'' + $area[i]['name'] + '\')"> '
                + $area[i]['name'] + ' </a>';
            count++;
            if (count % 5 == 0)
                item += '<br/>';
        }

    }

    var nav = '<li onclick="removeRightTab(this)"><a class=qm-site-a href="javascript: void(0)">请选择</a></li>';

    var content = '<div class="am-tab-panel">' + item + '</div>';

    if (!myjs.isNull(item))
    {
        $nav.append(nav);
        $bd.append(content);
        $tab.tabs('refresh');
        $tab.tabs("options");
        $tab.tabs('open', $('.am-tabs-bd div').length - 1);

    } else
    {
        $("#area").val(getSelectedTab())
        $(".qm-site-ul").find("li").remove();
        $bd.find("div").remove();
//		$tab.css("display","none");
    }

}
var $tab = $('#doc-tab-demo-1');

var $nav = $tab.find('.am-tabs-nav');
var $bd = $tab.find('.am-tabs-bd');
//----
$.getJSON("qwer.json", function (data)
{
    $area = data['result'];//数据入口


})


//----
Site = function (item)
{
//	$(item).next().css("display",'block')
    if ($('#doc-tab-demo-1 ul li').length > 0)
        return;
    addTab('0');

}

function getSelectedTab()
{
    var lis = $($tab).find("li");
    var str = "";
    for (var i = 0; i < lis.length; i++)
        str += $(lis[i]).text() + " ";
    return str;
}

function removeRightTab($item)
{
    var index = $nav.children('li').index($item);

    $($item).nextAll('li').remove();
    $($bd).find('.am-tab-panel').eq(index).nextAll("div").remove();

    $tab.tabs('open', index);
    $tab.tabs('refresh');
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
        $(item).text("保存")
        $Compile.removeAttr("disabled").css("border", "1px solid #CCCCCC");
        $CompileBut.css("display", "block").prev().css("border", "0px").parent().css("border", "1px solid #CCCCCC");
        $(item).parents(".qm-team").find(".sex-show").css("display", "none")
        $(item).parents(".qm-team").find(".sex").css("display", "block")
        $(".sex a").each(function (i)
        {
            if ($(this).text().trim() == $(".sex-show").text().trim())
                $(this).addClass("poptwo-c-lia1")
        })
    } else
    {
        $(item).text("编辑")
        $Compile.attr("disabled", "true").css("border", "0");
        $CompileBut.css("display", "none").prev().css("border", "0px").parent().css("border", "0");
        $(item).parents(".qm-team").find(".sex-show").css("display", "block")
        $(item).parents(".qm-team").find(".sex").css("display", "none")
        $(".sex a").each(function (i)
        {
            if ($(this).hasClass("poptwo-c-lia1"))
                $(".sex-show").text($(this).text().trim())
        })
    }
};
$(function ()
{
    $(".qm-header").load("header.jsp");
})