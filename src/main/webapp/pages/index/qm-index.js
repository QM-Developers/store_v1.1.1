var qm_indexJS = {
    logout:function ()
    {

    },
};

var status = 1;

function getStyleAttr(obj, attr)
{
    //最终样式
    var styleObj = obj.currentStyle || getComputedStyle(obj, null);
    return styleObj[attr];
}

function switchSysBar(item)
{
    var switchPoint = document.getElementById("switchPoint");//获取小按钮
    var frmTitle = document.getElementById("frmTitle");//获取iframe
    var Picclik = document.getElementById("picclik");

    if (1 == window.status)
    {
        window.status = 0;
//		Mainright.style.marginLeft = "0px";
        Picclik.style.backgroundImage = 'url(../images/left.gif)';
        frmTitle.style.display = "none"
    } else
    {
        window.status = 1;
//		Mainright.style.marginLeft = "190px";
        Picclik.style.backgroundImage = 'url(../images/right.gif)';
        frmTitle.style.display = ""
    }
}

function iFrameHeight()
{
    var ifm = document.getElementById("iframepage");
    var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;
    if (ifm != null && subWeb != null)
        ifm.height = subWeb.body.scrollHeight;
}

Menuli = function ()
{
    // var role = {
    //     "person": 1003,
    //     "corporation": 1004,
    //     "company": 1005,
    //     "department": 1006
    // };
    // var url = path + "/s/findDepartmentList.action";
    // $(item).addClass("add-parent");
    //
    // if (roleId == role.company)
    //     url = path + "/s/findCCDepartmentList.action";
    //
    // myjs.ajax_post(url, {}, function (data)
    // {
    //     data = data.result;
    //
    //     var addli = '<div class=menu-div>';
    //     for (var i = 0; i < data.length; i++)
    //         addli += '<div class=menu-lichild onclick="toDepartment(\'' + data[i]["teamDepartmentId"] + '\');" onmouseenter="lichild(this);">' + data[i]["teamDepartmentName"] + '</div>';
    //     addli += '</div>';
    //
    //     $(item).append(addli);
    //     $(item).siblings().removeClass("add-parent").find(".menu-div").remove();
    // });
    $(".menu-div").css("display","block")
};
MenuUl = function (item)
{
    $(item).find(".menu-li").removeClass("add-parent").find(".menu-div").remove();
};

lichild = function (item)
{
    $(item).addClass("menu-childli");
    $(item).siblings().removeClass("menu-childli");
};

toDepartment = function (did)
{
    $("#iframepage").attr("src", path + "/pages/customer/qm-customer.jsp?" + did);
};

