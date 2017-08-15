var gdReleaseJS = {
    uploader: null,
    flag: false,

    init: function () {
        urlParams = urlUtil.paramsToObj(urlParams);
        //      gdReleaseJS.findFreightTemps();
        // gdReleaseJS.findTypeAttr();
        if (urlParams.option == Constant.urlOptAdd)
            gdReleaseJS.findTypeAndParents();
        else
            gdReleaseJS.findGoodsInfo();
        gdReleaseJS.onInitModel();
        gdReleaseJS.pichandle();
        gdReleaseJS.findImages();
        gdReleaseJS.initBind();
    },

    initBind: function () {
        $(".lileft").mouseenter(gdReleaseJS.showDeleteBtn);
        $(".lileft").mouseleave(gdReleaseJS.hideDeleteBtn);
        $(".add-off").click(gdReleaseJS.removeImage);
    },

    removeImage: function () {
        $(this).next().removeAttr("real-path");
        $(this).next().removeAttr("src");
        $(this).parents('.add-two').css('display', 'none').removeClass("imgbox-sign");
    },

    findTypeAndParents: function () {
        var url = path + "/s/findTypeAndParents.action";
        var params = {};

        params["goodsTypeId"] = urlParams.typeId;

        myjs.ajax_post(url, params, function (data) {
            data = data.result;
            var text = "";

            function getType(data)
            {
                if (!myjs.isNull(data["parent"]))
                    getType(data["parent"]);
                text += (data["goodsTypeName"] + " > ");
            }

            getType(data);
            text = text.substring(0, text.length - 3);
            $("#type-text").text(text);
        });
    },

    findGoodsInfo: function () {
        var url = path + "/s/findGoodsInfo.action";
        var params = {};

        params["goodsId"] = urlParams.goodsId;

        myjs.ajax_post(url, params, function (data) {
            data = data.result;

            if (myjs.isNull(urlParams.typeId))
                urlParams.typeId = data["goodsTypeId"];
            gdReleaseJS.findTypeAndParents();
            $("#goods-name").val(data["goodsName"]);
            $("#goods-attr").val(data["goodsAttr"].split("?")[1]);

            var standards = data["standardList"];
            $("#standard-list").empty();
            for (var i = 0; i < standards.length; i++)
                gdReleaseJS.addStandard(standards[i]);
            var imgList = data["imgList"];

            for (var i = 0; i < imgList.length; i++)
                gdReleaseJS.insertBannerImage(imgList[i]["imagePath"], imgList[i]["imageId"]);

            myjs.ajax_post(path + "/s/findGoodsDescribe.action", {goodsDescribe: data["goodsDescribe"]}, function (data) {
                var describeList = data.result;
                for (var i = 0; i < describeList.length; i++)
                    gdReleaseJS.insertDescribeImage(describeList[i]["imagePath"], describeList[i]["imageId"]);
            });
        });
    },

    addStandard: function (data) {
        if (myjs.isNull(data))
            data = {standardId: "", standardName: "", standardWeight: "", standardPrice: "", standardCount: ""};
        var tr = '<tr>' +
            '<td><hidden value="' + data["standardId"] + '"/><input value="' + data["standardName"] + '"/></td>' +
            '<td><input value="' + data["standardWeight"] + '"/></td>' +
            '<td><input value="' + data["standardPrice"] + '"/></td>' +
            '<td><input value="' + data["standardCount"] + '"/></td>' +
            '<td class="tab4"><a href="javascript:void(0);" class="tab4-a " onclick="Delall(this)">删除</a></td>' +
            '</tr>';
        var body = $("#standard-list");
        body.append(tr);
    },

    findFreightTemps: function () {
        var url = path + "/s/findFreightTemps.action";

        myjs.ajax_post(url, {}, function (data) {
            data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["templateFreightId"] + '">' + data[i]["templateFreightName"] + '</option>';
            $("#freight-temps").append(item);
        });
    },

    findTypeAttr: function () {
        var url = path + "/s/findTypeAttr.action";
        var params = {};

        params["goodsTypeId"] = urlParams.typeId;

        myjs.ajax_post(url, params, function (data) {
            var item1 = '';
            var item2 = '';
            var result = data.result;
            var flag = result.length % 2 == 0;
            var length = flag ? result.length / 2 : result.length / 2 + 1;
            length = parseInt(length);
            var i = 0;

            for (; i < length; i++)
            {
                if (result[i]['goodsTypeAttrInputType'] == gdReleaseJS.items.input)
                    item1 += gdReleaseJS.items.getInputAttr(result[i]['goodsTypeAttrName']);
                if (result[i]['goodsTypeAttrInputType'] == gdReleaseJS.items.sel)
                    item1 += gdReleaseJS.items.getSelAttr(result[i]['goodsTypeAttrName'], result[i]['goodsTypeAttrValue']);
                if (result[i]['goodsTypeAttrInputType'] == gdReleaseJS.items.inputSel)
                    item1 += gdReleaseJS.items.getInputSelAttr(result[i]['goodsTypeAttrName'], result[i]['goodsTypeAttrValue']);
            }

            length = (flag ? length : length - 1) + length;

            for (; i < length; i++)
            {
                if (result[i]['goodsTypeAttrInputType'] == gdReleaseJS.items.input)
                    item2 += gdReleaseJS.items.getInputAttr(result[i]['goodsTypeAttrName']);
                if (result[i]['goodsTypeAttrInputType'] == gdReleaseJS.items.sel)
                    item2 += gdReleaseJS.items.getSelAttr(result[i]['goodsTypeAttrName'], result[i]['goodsTypeAttrValue']);
                if (result[i]['goodsTypeAttrInputType'] == gdReleaseJS.items.inputSel)
                    item2 += gdReleaseJS.items.getInputSelAttr(result[i]['goodsTypeAttrName'], result[i]['goodsTypeAttrValue']);
            }

            var attrList1 = document.getElementById("attr-list1");
            attrList1.innerHTML = item1;
            var attrList2 = document.getElementById("attr-list2");
            attrList2.innerHTML = item2;
        });
    },

    items: {
        sel: 'in_t_1',
        input: 'in_t_0',
        inputSel: 'in_t_2',

        getSelAttr: function (name, text) {
            var opt = '';
            var arr = text.split("=");

            for (var i = 0; i < arr.length; i++)
                opt += '<option>' + arr[i] + '</option>';

            var item = '<tr class="attr-list-tr-0" data-type="' + gdReleaseJS.items.sel + '"><td class="attr-list-td-0">' + name + '</td><td><select class="attr-list-td-sel">' + opt + '</select></td></tr>';
            return item;
        },

        getInputAttr: function (name) {
            var item = '<tr class="attr-list-tr-0" data-type="' + gdReleaseJS.items.input + '"><td class="attr-list-td-0">' + name + '</td><td><input type="text"></td></tr>';
            return item;
        },

        getInputSelAttr: function (name, text) {
            var opt = '';
            var arr = text.split("=");
            var item = "";

            opt += '<div class="cpm_frith_cont_ul">';
            for (var i = 0; i < arr.length; i++)
                opt += '<div onclick="inputSelJS.selClick(this)">' + arr[i] + '</div>';
            opt += '</div>';

            item += '<tr class="attr-list-tr-0" data-type="' + gdReleaseJS.items.inputSel + '">' +
                '<td class="attr-list-td-0">' + name + '</td>' +
                '<td><div style="position: relative;width:202px">' +
                '<input type="text" onfocus="inputSelJS.init(this);">' + opt +
                '</div></td></tr>';

            return item;
        },
    },

    onInitModel: function () {
        $("#my-popup").on("open.modal.amui", function () {
            gdReleaseJS.initWebUpload();
        });

        $("#my-popup").on("closed.modal.amui", function () {
            gdReleaseJS.uploader.destroy();
        });
    },

    initWebUpload: function () {
        gdReleaseJS.uploader = WebUploader.create({
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: path + '/script/script/webuploader-0.1.5/Uploader.swf',
            // 文件接收服务端。
            server: path + '/s/uploadToImgSpace.action',
            threads: 1, // 上传并发数
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#filePicker',
            fileVal: 'img',
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });

        gdReleaseJS.uploader.on('fileQueued', function (file) {
            var $list = $("#upload-list");

            var $li = $('<div onclick="gdReleaseJS.onSelectImg(this);" class="imgbox am-img-thumbnail">' +
                '<a id="' + file.id + '"><img style="width: 100%;height: 100%" src=""/></a>' +
                '</div>'),
                $img = $li.find('img');

            // $list为容器jQuery实例
            $list.append($li);

            gdReleaseJS.uploader.makeThumb(file, function (error, src) {
                if (error)
                {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }
                $img.attr('src', src);
            }, 1, 1);
        });

        // 文件上传过程中创建进度条实时显示。
        gdReleaseJS.uploader.on('uploadProgress', function (file, percentage) {
            var $li = $('#' + file.id),
                $percent = $li.find('.upload-progress');

            // 避免重复创建
            if (!$percent.length)
            {
                $percent = $('<div class="upload-progress am-progress am-progress-striped am-progress-sm am-active ">' +
                    '<div class="am-progress-bar am-progress-bar-secondary"  style="width: 0%"></div>' +
                    '</div>').appendTo($li).find('.upload-progress');
            }

            $percent.css('width', percentage * 100 + '%');
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        gdReleaseJS.uploader.on('uploadSuccess', function (file, data) {
            var $li = $('#' + file.id),
                $percent = $li.find('.upload-progress');

            $li.find("img").attr("real-path", data.result);

            if ($percent.length)
                $percent.remove();

            $li.append('<div class="b-shade"><span>700x700</span></div>');
        });

        // 文件上传失败，显示上传出错。
        gdReleaseJS.uploader.on('uploadError', function (file) {
            var $li = $('#' + file.id),
                $percent = $li.find('.upload-progress');

            if ($percent.length)
                $percent.remove();

            $percent = $('<div class="upload-progress" style="color: red;width: 65px">上传失败</div>').appendTo($li);
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        gdReleaseJS.uploader.on('uploadComplete', function (file) {

        });
    },

    showDeleteBtn: function () {
        $(this).find("span:eq(0)").show();
    },

    hideDeleteBtn: function () {
        $(this).find("span:eq(0)").hide();
    },

    test: function () {
//		$('#my-popup').modal({open,"dimmer":false});
        $('#my-popup').modal("open");

//		gdReleaseJS.DragMove();
        gdReleaseJS.flag = true;
    },

    AppendImg: function () {
        $('#my-popup').modal("open");
        gdReleaseJS.flag = false;
    },

    insertImg: function () {
        var items = $(".imgbox-sign");
        var attrs = [];
        var path = [];

        for (var i = 0; i < items.length; i++)
        {
            attrs.push($(items[i]).find("img").attr("src")); //获取元素src
            path.push($(items[i]).find("img").attr("real-path"));
        }

        $(".imgbox").removeClass("imgbox-sign");

        switch (gdReleaseJS.flag)
        {
            case true:
                for (var i = 0; i <= attrs.length; i++)
                    if (!myjs.isNull(attrs[i]))
                        gdReleaseJS.insertBannerImage(attrs[i], path[i]);
                break;
            case false:
                for (var i = 0; i < attrs.length; i++)
                    gdReleaseJS.insertDescribeImage(attrs[i], path[i]);
                break;
        }
    },

    insertDescribeImage: function (src, path) {
        var li = '' +
            '<li class="li-mid lileft" onmouseenter="gdReleaseJS.leftandrigthmove(this)">' +
            '<div class="mid-box">' +
            '<i class="mid-li" onclick="gdReleaseJS.moveToLeft(this);" class="top">上移</i>' +
            '<i class="mid-li" onclick="gdReleaseJS.moveToRight(this);" class="down">下移</i>' +
            '<i class="mid-li">删除</i></div>' +
            ' <a href="###"><img src="' + path + src + '" real-path="' + path + '"/></a>' +
            '</li>';
        $("#middleimg").append(li);
    },

    insertBannerImage: function (src, path) {
        var imgBox = $(".add-two");
        for (var i = 0; i < imgBox.length; i++)
            if (myjs.isNull($(imgBox[i]).find("img").attr("src")))
            {
                $(imgBox[i]).find("img").attr({"src": path + src, "real-path": path});
                $(imgBox[i]).css("display", "block");
                break;
            }
    },

    leftandrigthmove: function (item) {
        var $DisThis = $(item).find(".mid-box");
        $DisThis.css("display", "block");
    },

    Moveout: function (item) {
        var $Disout = $(item).find(".mid-box");
        $Disout.css("display", "none");
    },

    Midboxremove: function (item) {
        $(item).parents('li').remove();
    },

    onSelectImg: function (item) {
        var $count = $(".imgbox-sign").length;
        var Boximg = $(".add-two");
        var imgBox = $(".add-two").find("img");
        if (gdReleaseJS.flag == true)
        {
            for (var i = 0; i < imgBox.length; i++)
                $count += myjs.isNull($(imgBox[i]).attr("src")) ? 0 : 1;

            if (!$(item).hasClass("imgbox-sign") && $count <= 4)
                $(item).addClass("imgbox-sign");
            else
                $(item).removeClass("imgbox-sign");

            //----加提示语
            var $reccount = $(".imgbox-sign").length;
            if ($reccount < 5)
                $("#marked").html("")
            else
                $("#marked").html("可以选5张")

        } else if (gdReleaseJS.flag == false)
        { //---------从这添加

            for (var i = 0; i < imgBox.length; i++)
                $count += myjs.isNull($(imgBox[i]).attr("src")) ? 0 : 1;

            if (!$(item).hasClass("imgbox-sign"))
                $(item).addClass("imgbox-sign");
            else
                $(item).removeClass("imgbox-sign");

        }
        //--------到这
    },

    moveToRight: function (item) {
        var $current = $(item).parents("li:eq(0)");
        var $next = $($current).next("li");

        if ($next.length > 0)
            gdReleaseJS.moveImage($current, $next);
    },

    moveToLeft: function (item) {
        var $current = $(item).parents("li:eq(0)");
        var $prev = $($current).prev("li");

        if ($prev.length > 0)
            gdReleaseJS.moveImage($current, $prev);
    },

    moveImage: function ($origin, $target) {
        $origin = $($origin).find("img");
        $target = $($target).find("img");

        var $originAttr = $($origin).attr("src");
        var $originRealPath = $($origin).attr("real-path");
        var $targetAttr = $($target).attr("src");
        var $targetRealPath = $($target).attr("real-path");

        $($origin).attr("src", $targetAttr);
        $($origin).attr("real-path", $targetRealPath);
        $($target).attr("src", $originAttr);
        $($target).attr("real-path", $originRealPath);

        if (myjs.isNull($targetAttr))
        {
            $($origin).parent("div").css("display", "none");
            $($target).parent("div").css("display", "block");
        }

    },

    //---------------------
    pichandle: function () {//初始化
        $(".add-picture li").each(function () {
            var $Thisliimg = $(this).find("img").attr("src");
            if (myjs.isNull($Thisliimg))
            {
                $(this).find(".add-two").css("display", "none");
            }
        });
    },

    getStandard: function () {
        var standards = [];
        var tr = $("#standard-list tr");

        for (var i = 0; i < tr.length; i++)
            standards.push(getValue(tr[i]));

        function getValue(item)
        {
            var tds = $(item).find("td");
            var standard = {};
            standard["standardId"] = $(item).find("hidden").attr("value");
            standard["standardName"] = $(tds[0]).find("input").val();
            standard["standardWeight"] = $(tds[1]).find("input").val();
            standard["standardPrice"] = $(tds[2]).find("input").val();
            standard["standardCount"] = $(tds[3]).find("input").val();
            return standard;
        }

        return standards;
    },

    saveOrUpdateGoods: function () {
        var url = path;
        var params = {};

        params["goodsId"] = urlParams.goodsId;
        params["goodsTypeId"] = urlParams.typeId;
        params["goodsName"] = $("#goods-name").val();
        params["goodsAttr"] = gdReleaseJS.getGoodsAttr();
        params["standards"] = JSON.stringify(gdReleaseJS.getStandard());
        params["goodsImages"] = gdReleaseJS.getImages();
        params["goodsDescribe"] = gdReleaseJS.getDescribe();

        if (myjs.isNull(urlParams.goodsId))
            url += "/s/goodsRelease";
        else
            url += "/s/updateGoods";
        url += Constant.URL_SUFFIX;

        myjs.ajax_post(url, params, function (data) {
            console.log(data);
        });
    },

    getGoodsAttr: function () {
        var attr = "品牌" + "?" + $("#goods-attr").val() + "|";

        return attr.substring(0, attr.length - 1);
    },

    getImages: function () {
        var items = $("#img-list").find("img");
        var images = "";

        for (var i = 0; i < items.length; i++)
            if (!myjs.isNull($(items[i]).attr("real-path")))
                images += $(items[i]).attr("real-path") + "|";

        return images;
    },

    getDescribe: function () {
        var items = $("#middleimg").find("img");
        var images = "";

        for (var i = 0; i < items.length; i++)
            images += $(items[i]).attr("real-path") + "|";

        return images;
    },

    findImages: function () {
        var url = path + "/s/findImages.action";

        myjs.ajax_post(url, {}, function (data) {
            var item = "";
            data = data.result;
            for (var i = 0; i < data.length; i++)
                item += '<div onclick="gdReleaseJS.onSelectImg(this);" class="imgbox"><a href="javascript:;"><img real-path="' + data[i]["imageId"] + '" src="' + path + data[i]["imagePath"] + '"/></a></div>';
            $("#images-space").append(item);
        });
    },

    toTypeSelect: function () {
        self.location.href = path + "/pages/mall/goods/qm-typeSelect.jsp?" + urlUtil.objToParams(urlParams);
    },

    deleteGoods: function () {
        var url = path + "/s/deleteGoods" + Constant.URL_SUFFIX;
        var params = {};

        params["goodsId"] = urlParams.goodsId;

        myjs.ajax_post(url, params, function (data) {
            console.log(data);
        });
    },
};

