var qm_group = {
    isUpdate:false,

    init: function ()
    {
        qm_group.findCustomerInfo();
        qm_group.findUpdateCount();
    },

    findUpdateCount:function ()
    {
        var url = path + "/s/findCustomerUpdateCount.action";
        var params = {};
        params["customerId"] = customerId;

        myjs.ajax_post(url,params,function (data)
        {
            $("#user-update-count").text(data.result);
        });
    },

    findCustomerInfo: function ()
    {
        var url = path + "/s/findCustomerInfo.action";
        var params = {};

        params["customerId"] = customerId;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            $("#customer-name").val(data["userName"]);
            $("#customer-sex").text(data["userSex"]);
            $("#customer-phone").val(data["userPhone"]);
            $("#customer-birthday").val(data["userBirthday"]);
            $("#customer-identity").val(data["userIdentity"]);
            $("#credit-rating>a[val='"+data["creditRating"]+"']").addClass("groupdata-checkbox-bg").show();
            $("#customer-area").val(data["userArea"]);
            $("#customer-address").val(data["userAddress"]);
            $("#customer-group").val(data["customerGroupId"]);
            $("#lng-and-lat").val(data["lngAndLat"]);
            $("#user-update-time").text(new Date(data["userUpdateTime"]).format("yyyy/MM/dd"));
        });
    },

    updateCustomer:function (item)
    {
        if(!Compile(item))
        {
            qm_group.isUpdate = true;
            $("#container").show();
            return;
        }
        var url = path + "/s/updateCustomer.action";
        var params = {};

        params["customerId"] = customerId;
        params["userName"] = $("#customer-name").val();
        params["userSex"] = $("#customer-sex").text();
        params["userPhone"] = $("#customer-phone").val();
        params["userBirthday"] = $("#customer-birthday").val();
        params["userIdentity"] = $("#customer-identity").val();
        params["creditRating"] = $("#credit-rating>a.groupdata-checkbox-bg").attr("val");
        params["userArea"] = $("#customer-area").val();
        params["userAddress"] = $("#customer-address").val();
        params["customerGroupId"] = $("#customer-group").val();
        params["lngAndLat"] = $("#lng-and-lat").val();

        console.log(params);

        $("#container").hide();
        qm_group.isUpdate = false;
        myjs.ajax_post(url,params,function (data)
        {
            console.log(data);
        });
    },

    cancelUpdate:function (item)
    {
        $("#customer-sex").next().find("a").removeClass("poptwo-c-lia1");
        $("#credit-rating a").removeClass("groupdata-checkbox-bg");
        Compile($(item).prev());
        $("#container").hide();
        qm_group.findCustomerInfo();
    },

    dragMapSuccess:function (rep)
    {
        if(qm_group.isUpdate)
        {
            $("#customer-area").val(rep["address"]);
            $("#lng-and-lat").val(rep["position"]["lng"] + "," + rep["position"]["lat"]);
        }
    },

    dragMapFail:function (rep)
    {

    },

    toAreaPage:function (aid)
    {
        window.location.href = "qm-sitedata.jsp?"+customerId+"?"+aid;
    },
};


$(function ()
{
    //遮罩显示
//	$("#Prompt-box").css("display", "block");
    //遮罩关闭
    $(".potential-right").click(function ()
    {
        $("#Prompt-box").css("display", "none");
    });


    $(".qm-team input").attr("disabled", "true");
//	    $(".databut").css("display","none");
});


Groupdata_select = function (item)
{
    $(item).css("border", "1px solid #ccc");
    $(item).find(".groupdata_select-ul").css("display", "block");
};

PopInput = function (item)
{
    $(item).addClass("poptwo-c-lia1");
    $(item).siblings().removeClass("poptwo-c-lia1");
};


 

