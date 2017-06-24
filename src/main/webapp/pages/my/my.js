var my = {
    aid: "",

    init: function ()
    {
        var url = path + "/user_findMyInfo.action";

        myjs.ajax_post(url, {}, function (data)
        {
            data = data.result;

            $("#userImg").attr("src", path + data["userImg"]);
            my.findMyAddress();
        });

        my.initUpload();
    },

    findMyAddress: function ()
    {
        var url = path + "/user_findMyAddress.action";

        $("#addressList tr:eq(0)").nextAll().remove();

        myjs.ajax_post(url, {}, function (data)
        {
            var item = "";
            data = data.result;

            for (var i = 0; i < data.length; i++)
            {
                item += '<tr>' +
                    '<td>' + data[i]["userName"] + '</td>' +
                    '<td>' + data[i]["userArea"] + '</td>' +
                    '<td>' + data[i]["userAddress"] + '</td>' +
                    '<td>' + data[i]["userPhone"] + '</td>' +
                    '<td>' +
                    '<div class="am-btn-toolbar">' +
                    '<div class="am-btn-group am-btn-group-xs">' +
                    '<button onclick="my.fillAddress(this,\'' + data[i]["userAddressId"] + '\')" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>' +
                    '<button onclick="my.deleteAddress(\'' + data[i]["userAddressId"] + '\')" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</button>' +
                    '</div>' +
                    '</div>' +
                    '</td>' +
                    '</tr>';
            }

            $("#addressList").append(item);
        });
    },

    deleteAddress: function (aid)
    {
        var url = path + "/user_deleteMyAddress.action";

        myjs.ajax_post(url, {"userAddressId": aid}, function (data)
        {
            my.findMyAddress();
        });
    },

    fillAddress: function (item, aid)
    {
        var tr = $(item).parents("tr:eq(0)");

        var tds = $(tr).find("td");

        my.aid = aid;
        $("#userName").val($(tds[0]).text());
        opt0 = $(tds[1]).text().split(" ");
        _init_area();
        $("#userAddress").val($(tds[2]).text());
        $("#userPhone").val($(tds[3]).text());
    },

    resetAddress: function ()
    {
        my.aid = "";
        $("#userName").val("");
        $("#userPhone").val("");
        $("#userAddress").val("");
        opt0 = ["省份", "地级市", "市、县级市"];
        _init_area();
    },

    saveOrUpdateAddress: function ()
    {
        var url = "";
        var params = {};
        var userName = $("#userName").val();
        var userPhone = $("#userPhone").val();
        var userAddress = $("#userAddress").val();

        if (myjs.isNull(userPhone) || myjs.isNull(userName) || myjs.isNull(userAddress))
        {
            alert("请将信息填写完整");
            return;
        }

        params["userName"] = $("#userName").val();
        params["userPhone"] = $("#userPhone").val();
        params["userAddress"] = $("#userAddress").val();
        params["userArea"] = $("#s_province").val() + " " + $("#s_city").val() + " " + $("#s_county").val();

        if (myjs.isNull(my.aid))
        {
            url = path + "/user_addMyAddress.action";
            myjs.ajax_post(url, params, function (data)
            {
                my.findMyAddress();
                my.resetAddress();
            });
        } else
        {
            params["userAddressId"] = my.aid;
            url = path + "/user_updateMyAddress.action";
            myjs.ajax_post(url, params, function (data)
            {
                my.findMyAddress();
                my.resetAddress();
            });
        }
    },

    initUpload: function ()
    {
        // 初始化Web Uploader
        var uploader = WebUploader.create({
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: '/Uploader.swf',
            // 文件接收服务端。
            server: path + '/user_uploadHeadPortrait.action',
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#user-img-box',
            fileVal: 'img',
            duplicate: true,
            fileNumLimit: 1,
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });


        uploader.on('fileQueued', function (file)
        {

        });

        // 文件上传过程中创建进度条实时显示。
        uploader.on('uploadProgress', function (file, percentage)
        {

        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on('uploadSuccess', function (file)
        {

        });

        // 文件上传失败，显示上传出错。
        uploader.on('uploadError', function (file)
        {

        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on('uploadComplete', function (file)
        {

        });
    },
};