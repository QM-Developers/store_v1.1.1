var tpSelJS = {
    typeId:"",

    init:function ()
    {
        tpSelJS.findTypeList(0);
    },

    findTypeList:function (pid)
    {
        var url = path + "/s/findGoodsTypeByPid.action";
        var params = {};

        params["goodsTypePid"] = pid;

        $("#releaseBtn").attr("disabled","disabled");
        myjs.ajax_post(url,params,function (data)
        {
            data = data.result;
            if(!myjs.isNull(data))
                tpSelJS.appendList(data);
            else
                $("#releaseBtn").removeAttr("disabled");
        });
    },

    appendList:function (data)
    {
        var wid = "wid_"+$("#type-list ul").length;
        var item = '<ul id="'+wid+'" onclick="tpSelJS.removeUl(this)">';
        for (var i = 0; i < data.length; i++)
            item += '<li onClick="tpSelJS.onSelect(this);" id="'+data[i]["goodsTypeId"]+'"><a href="###">' + data[i]["goodsTypeName"] + '</a></li>';
        item += '</ul>';

        $("#type-list").append(item);
    },

    onSelect:function (item)
    {
        $(item).addClass("active").siblings("li").removeClass("active");
        var arr = [];
        var text = "";

        for(var i = 0;i<$("#type-list ul").length;i++)
        {
            arr = $("#wid_"+i+" li");
            for(var j = 0;j<arr.length;j++)
                if($(arr[j]).hasClass("active"))
                    text += $(arr[j]).find("a").text()+" > ";
        }

        text = text.substring(0,text.length - 3);
        $("#selectedSort").html(text);

        tpSelJS.typeId = $(item).attr("id");
        tpSelJS.findTypeList(tpSelJS.typeId);
    },

    removeUl:function (wid)
    {
        $(wid).nextAll("ul").remove();
    },

    toReleaseGoods:function ()
    {
        self.location.href = path + "/pages/mall/goods/goodsRelease.jsp?"+tpSelJS.typeId;
    },

};