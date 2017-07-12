var gdReleaseJS = {
    uploader: null,
    flag: false,


    init: function ()
    {
        gdReleaseJS.findFreightTemps();
        gdReleaseJS.findTypeAndParents();
        gdReleaseJS.onInitModel();
        gdReleaseJS.pichandle();
        gdReleaseJS.findImages();
    },

    findTypeAndParents: function ()
    {
        var url = path + "/s/findTypeAndParents.action";
        var params = {};

        params["goodsTypeId"] = typeId;

        myjs.ajax_post(url, params, function (data)
        {
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
            gdReleaseJS.findTypeAttr();
        });
    },

    findFreightTemps: function ()
    {
        var url = path + "/s/findFreightTemps.action";

        myjs.ajax_post(url, {}, function (data)
        {
            data = data.result;
            var item = "";

            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["templateFreightId"] + '">' + data[i]["templateFreightName"] + '</option>';

            $("#freight-temps").append(item);
            gdReleaseJS.findFreight();
        });
    },

    findFreight: function ()
    {
        var url = path + "/s/findFreight.action";

        myjs.ajax_post(url, {'templateFreightId': $("#freight-temps").val()}, function (data)
        {
            data = data.result;
            if (myjs.isNull(data))
                return;

            var text = "";
            if (data["templateFreightIsfree"] == "1")
                text = "包邮";
            else
                text = data["templateDefaultNum"] +
                    " 件内 " + data["templateDefaultPrice"] +
                    " 元，每增加 " + data["templateAddNum"] + " 件，增加运费 " + data["templateAddPrice"] + " 元";
            $("#freight-temps").nextAll("span").text(text);
        });
    },

    findTypeAttr: function ()
    {
        var url = path + "/s/findTypeAttr.action";
        var params = {};

        params["goodsTypeId"] = typeId;

        myjs.ajax_post(url, params, function (data)
        {
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
                else if (result[i]['goodsTypeAttrInputType'] == gdReleaseJS.items.sel)
                    item1 += gdReleaseJS.items.getSelAttr(result[i]['goodsTypeAttrName'], result[i]['goodsTypeAttrValue']);
                else if (result[i]['goodsTypeAttrInputType'] == gdReleaseJS.items.inputSel)
                    item1 += gdReleaseJS.items.getInputSelAttr(result[i]['goodsTypeAttrName'], result[i]['goodsTypeAttrValue']);
            }

            length = (flag ? length : length - 1) + length;

            for (; i < length; i++)
            {
                switch (result[i]['goodsTypeAttrInputType'])
                {
                    case gdReleaseJS.items.input:
                        item2 += gdReleaseJS.items.getInputAttr(result[i]['goodsTypeAttrName']);
                        break;
                    case gdReleaseJS.items.sel:
                        item2 += gdReleaseJS.items.getSelAttr(result[i]['goodsTypeAttrName'], result[i]['goodsTypeAttrValue']);
                        break;
                    case gdReleaseJS.items.inputSel:
                        item2 += gdReleaseJS.items.getInputSelAttr(result[i]['goodsTypeAttrName'], result[i]['goodsTypeAttrValue']);
                        break;
                }
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

        getSelAttr: function (name, text)
        {
            var opt = '';
            var arr = text.split("=");

            for (var i = 0; i < arr.length; i++)
                opt += '<option value="' + arr[i] + '">' + arr[i] + '</option>';

            var item = '<tr class="attr-list-tr-0" data-type="' + gdReleaseJS.items.sel + '"><td class="attr-list-td-0">' + name + '</td><td><select class="attr-list-td-sel">' + opt + '</select></td></tr>';
            return item;
        },

        getInputAttr: function (name)
        {
            var item = '<tr class="attr-list-tr-0" data-type="' + gdReleaseJS.items.input + '"><td class="attr-list-td-0">' + name + '</td><td><input style="width: 206px" type="text"></td></tr>';
            return item;
        },

        getInputSelAttr: function (name, text)
        {
            var opt = '';
            var arr = text.split("=");
            var item = "";

            opt += '<div class="cpm_frith_cont_ul">';
            for (var i = 0; i < arr.length; i++)
                opt += '<div onclick="inputSelJS.selClick(this)">' + arr[i] + '</div>';
            opt += '</div>';

            item += '<tr class="attr-list-tr-0" data-type="' + gdReleaseJS.items.inputSel + '">' +
                '<td class="attr-list-td-0">' + name + '</td>' +
                '<td><div style="position: relative;width:206px">' +
                '<input style="width: 206px" type="text" onfocus="inputSelJS.init(this);">' + opt +
                '</div></td></tr>';

            return item;
        },

        getValue: function (item)
        {
            var dataType = $(item).attr("data-type");
            switch (dataType)
            {
                case gdReleaseJS.items.sel:
                    return $(item).find("select").val();
                case gdReleaseJS.items.input:
                    return $(item).find("input").val();
                case gdReleaseJS.items.inputSel:
                    return $(item).find("input").val();
            }
        }
    },

    onInitModel: function ()
    {
        $("#my-popup").on("open.modal.amui", function ()
        {
            gdReleaseJS.initWebUpload();
        });

        $("#my-popup").on("closed.modal.amui", function ()
        {
            gdReleaseJS.uploader.destroy();
        });
    },

    initWebUpload: function ()
    {
        gdReleaseJS.uploader = WebUploader.create({
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: path + '/script/script/webuploader-0.1.5/Uploader.swf',
            // 文件接收服务端。
            server: path + '/s/uploadToImgSpace.action',
            threads: 1,  // 上传并发数
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

        gdReleaseJS.uploader.on('fileQueued', function (file)
        {
            console.log(file);
            var $list = $("#upload-list");

            var $li = $('<div onclick="gdReleaseJS.onSelectImg(this);" class="imgbox am-img-thumbnail">' +
                    '<a id="' + file.id + '"><img style="width: 100%;height: 100%" src=""/></a>' +
                    '</div>'),
                $img = $li.find('img');

            // $list为容器jQuery实例
            $list.append($li);

            gdReleaseJS.uploader.makeThumb(file, function (error, src)
            {
                if (error)
                {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }
                $img.attr('src', src);
            },500,500);
        });

        // 文件上传过程中创建进度条实时显示。
        gdReleaseJS.uploader.on('uploadProgress', function (file, percentage)
        {
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
        gdReleaseJS.uploader.on('uploadSuccess', function (file, data)
        {
            var $li = $('#' + file.id), $percent = $li.find('.upload-progress');

            $li.find("img").attr("real-path", data.result);

            if ($percent.length)
                $percent.remove();

            $li.append('<div class="b-shade"><span>700x700</span></div>');
            //     <div class="b-shade">
            //     <span>700x700</span>
            // </div>
        });

        // 文件上传失败，显示上传出错。
        gdReleaseJS.uploader.on('uploadError', function (file)
        {
            var $li = $('#' + file.id), $percent = $li.find('.upload-progress');

            if ($percent.length)
                $percent.remove();

            $percent = $('<div class="upload-progress" style="color: red;width: 65px">上传失败</div>').appendTo($li);
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        gdReleaseJS.uploader.on('uploadComplete', function (file)
        {

        });
    },

    insertImg: function ()
    {
        var items = $(".imgbox-sign");
        var attrs = [];
        var path = [];
        var imgBox = $(".add-two");
        var $middleimg = $("#middleimg");

        for (var i = 0; i < items.length; i++)
        {
            attrs.push($(items[i]).find("img").attr("src")); //获取元素src
            path.push($(items[i]).find("img").attr("real-path"));
        }

        $(".imgbox").each(function ()
        {
            $(this).removeClass("imgbox-sign");
        });
        if (gdReleaseJS.flag == true)
        {

            var j = 0;
            for (var i = 0; i <= imgBox.length; i++)
            {
                if (!myjs.isNull(attrs[j]) && myjs.isNull($(imgBox[i]).find("img").attr("src")))
                {
                    $(imgBox[i]).find("img").attr({"src": attrs[j], "real-path": path[j]});
                    $(imgBox[i]).css("display", "block");
                    j++;
                }
            }
        } else if (gdReleaseJS.flag == false)
        {

            for (var j = 0; j < attrs.length; j++)
            {
                var $Addli = '' +
                    '<li class="li-mid lileft" onmouseenter="gdReleaseJS.leftandrigthmove(this)">' +
                    '<div class="mid-box">' +
                    '<i class="mid-li" onclick="gdReleaseJS.moveToLeft(this);" class="top">上移</i>' +
                    '<i class="mid-li" onclick="gdReleaseJS.moveToRight(this);" class="down">下移</i>' +
                    '<i class="mid-li">删除</i></div>' +
                    ' <a href="###"><img src="' + attrs[j] + '" real-path="' + path[j] + '"/></a>' +
                    '</li>';

                $middleimg.append($Addli);
            }
        }
    },

    onSelectImg: function (item)
    {
        var $count = $(".imgbox-sign").length;
        var Boximg = $(".add-two");
        var imgBox = $(".add-two").find("img");
        if (gdReleaseJS.flag == true)
        {
            for (var i = 0; i < imgBox.length; i++)
                $count += myjs.isNull($(imgBox[i]).attr("src")) ? 0 : 1;

            if (!$(item).hasClass("imgbox-sign") && $count <= 4)
            {
                $(item).addClass("imgbox-sign");
            } else
            {
                $(item).removeClass("imgbox-sign");
            }
            //----加提示语
            var $reccount = $(".imgbox-sign").length;
            if ($reccount < 5)
            {
                $("#marked").html("")
            } else
            {
                $("#marked").html("可以选5张")
            }
        } else if (gdReleaseJS.flag == false)
        { //---------从这添加

            for (var i = 0; i < imgBox.length; i++)
                $count += myjs.isNull($(imgBox[i]).attr("src")) ? 0 : 1;

            if (!$(item).hasClass("imgbox-sign"))
            {
                $(item).addClass("imgbox-sign");
            } else
            {
                $(item).removeClass("imgbox-sign");
            }
        }
        //--------到这
    },

    moveToRight: function (item)
    {
        var $current = $(item).parents("li:eq(0)");
        var $next = $($current).next("li");

        if ($next.length > 0)
            gdReleaseJS.moveImage($current, $next);
    },

    moveToLeft: function (item)
    {
        var $current = $(item).parents("li:eq(0)");
        var $prev = $($current).prev("li");

        if ($prev.length > 0)
            gdReleaseJS.moveImage($current, $prev);
    },

    moveImage: function ($origin, $target)
    {
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
    //
    // leftandrigthmove: function (item)
    // {
    //     var $DisThis = $(item).find(".mid-box");
    //     $DisThis.css("display", "block");
    // },

    //----------------------
    pichandle: function ()
    {//初始化
        $(".add-picture li").each(function ()
        {
            var $Thisliimg = $(this).find("img").attr("src");
            if (myjs.isNull($Thisliimg))
            {
                $(this).find(".add-two").css("display", "none");
            }
        });
    },

    test: function ()
    {
        $('#my-popup').modal("open");
        gdReleaseJS.flag = true;
    },

    AppendImg: function ()
    {
        $('#my-popup').modal("open");
        gdReleaseJS.flag = false;
    },

    releaseGoods: function ()
    {
        var url = path + "/s/goodsRelease.action";
        var params = {};

        params["goodsTypeId"] = typeId;
        params["templateFreightId"] = $("#freight-temps").val();
        params["goodsName"] = $("#goodsName").val();
        params["goodsPrice"] = $("#goodsPrice").val();
        params["goodsCount"] = $("#goodsCount").val();
        params["goodsAttr"] = gdReleaseJS.getGoodsAttr();
        params["standards"] = JSON.stringify(gdReleaseJS.getStandard());
        params["goodsImages"] = gdReleaseJS.getImages();
        params["goodsDescribe"] = gdReleaseJS.getDescribe();

        // myjs.ajax_post(url, params, function (data)
        // {
        //     console.log(data);
        // });
    },

    getGoodsAttr: function ()
    {
        var list1 = $("#attr-list1 tr");
        var list2 = $("#attr-list2 tr");

        var attr = "";
        var temp = "";

        for (var i = 0; i < list1.length; i++)
        {
            temp = gdReleaseJS.items.getValue(list1[i]);
            attr += myjs.isNull(temp) ? "" : $(list1[i]).find("td:eq(0)").text() + "?" + temp + "|";
            if (!myjs.isNull(list2[i]))
            {
                temp = gdReleaseJS.items.getValue(list2[i]);
                attr += myjs.isNull(temp) ? "" : $(list2[i]).find("td:eq(0)").text() + "?" + temp + "|";
            }
        }

        return attr.substring(0, attr.length - 1);
    },

    getImages: function ()
    {
        var items = $("#img-list").find("img");
        var images = "";

        for (var i = 0; i < items.length; i++)
            if (!myjs.isNull($(items[i]).attr("real-path")))
                images += $(items[i]).attr("real-path") + "|";

        return images;
    },

    getDescribe: function ()
    {
        var items = $("#middleimg").find("img");
        var images = "";

        for (var i = 0; i < items.length; i++)
            images += $(items[i]).attr("real-path") + "|";

        return images;
    },

    getStandard: function ()
    {
        var standards = [];
        var tr = $("#standard-list tr");

        for (var i = 0; i < tr.length - 1; i++)
            standards.push(getValue(tr[i]));

        function getValue(item)
        {
            var tds = $(item).find("td");
            var standard = {};
            standard["standardName"] = $(tds[0]).find("input").val();
            standard["standardPrice"] = $(tds[1]).find("input").val();
            standard["standardCount"] = $(tds[2]).find("input").val();
            return standard;
        }

        return standards;
    },

    findImages: function ()
    {
        var url = path + "/s/findImages.action";

        myjs.ajax_post(url, {}, function (data)
        {
            var item = "";
            data = data.result;

            for (var i = 0; i < data.length; i++)
                item += '<div onclick="gdReleaseJS.onSelectImg(this);" class="imgbox"><a href="javascript:;"><img real-path="' + data[i]["imageId"] + '" src="' + path + data[i]["imagePath"] + '"/></a></div>';

            $("#images-space").append(item);
        });
    },

    appendRow: function ($this)
    {
        function isNull()
        {
            var inputs = $($this).parents("tr:eq(0)").find("input");
            for (var i = 0; i < inputs.length; i++)
                if (myjs.isNull($(inputs[i]).val()))
                    return true;
            return false;
        }

        if ($($this).parents("tr:eq(0)").next("tr").length > 0)
            return;
        if (isNull())
            return;

        var item = '<tr><td><input oninput="gdReleaseJS.appendRow(this);"></td>' +
            '<td><input type="number" oninput="gdReleaseJS.appendRow(this);"></td>' +
            '<td><input type="number" oninput="gdReleaseJS.appendRow(this);"></td>' +
            '<td><button onclick="gdReleaseJS.deleteRow(this);" class="am-btn am-btn-default am-text-danger am-btn-xs">删除</button></td></tr>';
        $("#standard-list").append(item);
    },

    deleteRow: function ($this)
    {
        var trs = $($this).parents("tbody").find("tr");
        if (trs.length <= 1)
        {
            $(trs[0]).find("input").val("");
            return;
        }
        $($this).parents("tr:eq(0)").remove();
    }
};
