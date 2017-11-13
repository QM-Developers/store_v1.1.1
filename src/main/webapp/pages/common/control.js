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
    $(item).addClass("sex-checked").siblings().removeClass("sex-checked")
}
//防止冒泡
function stopPropagation(e)
{
    if (e.stopPropagation)
        e.stopPropagation(); //停止冒泡  非ie
    else
        e.cancelBubble = true; //停止冒泡 ie
}

//加载头部
$(function ()
{
    $(".customerheader").load("customerheader.html");
    $(".qm-header").load("header.jsp");

    $("#seobut").click(function ()
    {

        $(".companylist").css("display", "block")
    });

});

Removetr = function (item)
{//删除tr

    $(item).parents("tr").remove()
};
