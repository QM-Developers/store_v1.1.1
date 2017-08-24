/**
 * Created by Administrator on 2017/8/14.
 */
$(function ()
{
    var goodsdetailsid = $.trim(location.search.replace("?", ""));
   console.log(goodsdetailsid)
    $('#branchgoodsdetails').parent('div').attr('id',goodsdetailsid)
    getGoodsdetails (goodsdetailsid);

});

function getGoodsdetails (id)
{
    var url ="/store/s/findGoodsInfo.action";
    var params = {};

    params["goodsId"] = id;

    myjs.ajax_post(url, params, function (data)
    {
        console.log(data)
        var goodstypeid = data.result.goodsTypeId;
        var  data = data.result;
        getGoodsType(goodstypeid)
        $("#goods-name").val(data["goodsName"]);
        $("#goods-attr").val(data["goodsAttr"].split("?")[1]);

        var goodsstandards = data["standardList"];
        $("#standard-list").empty();
        for (var i = 0; i < goodsstandards.length; i++){
            addGoodsStandard(goodsstandards[i]);
        }
        var imgList = data["imgList"];

        for (var i = 0; i < imgList.length; i++){
            getImage('/store/' + imgList[i]["imagePath"], imgList[i]["imageId"]);
        }

        myjs.ajax_post("/store/s/findGoodsDescribe.action", {goodsDescribe: data["goodsDescribe"]}, function (data)
        {
            var describeList = data.result;
            for (var i = 0; i < describeList.length; i++)
                getGoodsImage("/store/" + describeList[i]["imagePath"], describeList[i]["imageId"]);
        });


    })
}
 function getGoodsType(id)
{
    var url ="/store/s/findTypeAndParents.action";
    var params = {};
    params["goodsTypeId"] = id;
    myjs.ajax_post(url, params, function (data)
    {
        var  data = data.result;
        console.log(data)
        var text = "";
        function addGoodsType(data)
        {
            if (!myjs.isNull(data["parent"]))
                addGoodsType(data["parent"]);
            console.log(data["parent"])
            text += (data["goodsTypeName"] + " > ");
        }
        addGoodsType(data);
        text = text.substring(0, text.length - 3);
        $("#type-text").text(text);
    });
};
 function addGoodsStandard (data)
{
    if (myjs.isNull(data))
        data = {standardId: "", standardName: "", standardWeight: "", standardPrice: "", standardCount: ""};
    var tr = '<tr>' +
        '<td><hidden value="' + data["standardId"] + '"/><input disabled value="' + data["standardName"] + '"/></td>' +
        '<td><input disabled value="' + data["standardWeight"] + '"/></td>' +
        '<td><input disabled value="' + data["standardPrice"] + '"/></td>' +
        '<td><input disabled value="' + data["standardCount"] + '"/></td>' +
        '</tr>';
    var body = $("#standard-list");
    body.append(tr);
};
 function getImage (src, realPath)
{
    var imgBox = $(".add-two");
    for (var i = 0; i < imgBox.length; i++)
        if (myjs.isNull($(imgBox[i]).find("img").attr("src")))
        {
            $(imgBox[i]).find("img").attr({"src": src, "real-path": realPath});
            $(imgBox[i]).css("display", "block");
            break;
        }
};
 function getGoodsImage (src, realPath)
{
    var li = '' +
        '<li class="li-mid lileft" >' +
        ' <a href="###"><img src="' + src + '" real-path="' + realPath + '"/></a>' +
        '</li>';
    $("#middleimg").append(li);
};