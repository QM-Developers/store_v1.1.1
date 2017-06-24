

/*初始化一级目录*/
function intProvince()
{
    var wid = "wid_"+$(".wareSort ul").length;
    console.log(wid);
    var item = '<ul id="'+wid+'">';
    for (var i = 0; i < province.length; i++)
        item += '<li onClick="select(this);"><a href="javascript:void(0)">' + province[i] + '</a></li>';
    item += '</ul>';

    $("#type-list").append(item);
}
intProvince();

/*选择一级目录*/
function select(item)
{
    // areaCont = "";
    // for (var j = 0; j < city[p].length; j++)
    //     areaCont += '<li onClick="selectC(' + p + ',' + j + ');"><a href="javascript:void(0)">' + city[p][j] + '</a></li>';

    $(item).addClass("active").siblings("li").removeClass("active");
    // expressP = province[p];
    // $("#selectedSort").html(expressP);
    // $("#releaseBtn").removeAttr("disabled");
}


/*点击下一步*/
$("#releaseBtn").click(function ()
{
    var releaseS = $(this).prop("disabled");
    if (releaseS == false)
    {//未被禁用
        //location.href = "商品发布-详细信息.html";//跳转到下一页
    }
});
