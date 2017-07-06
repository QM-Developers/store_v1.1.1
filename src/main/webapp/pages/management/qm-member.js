var qm_member = {
    cardFront:null,
    cardBack:null,

    init:function ()
    {
        qm_member.findDepartmentList();
        qm_member.initPermission();
        qm_member.initWebUpload();
    },

    findDepartmentList:function ()
    {
        var url = path + "/s/findDepartmentList.action";
        var params = {};

        myjs.ajax_post(url,params,function (data)
        {
            data = data.result;
            var item = "";
            for(var i = 0;i<data.length;i++)
                item += '<option value="'+data[i]["departmentId"]+'">'+data[i]["departmentName"]+'</option>';
            $("#department-list").append(item);
            qm_member.findPositionList(data[0]["departmentId"]);
        });
    },

    findPositionList:function (did)
    {
        var url = path + "/s/findPositionList.action";
        var params = {};

        params["departmentId"] = did;

        myjs.ajax_post(url,params,function (data)
        {
            data = data.result;
            var item = "";
            for(var i = 0;i<data.length;i++)
                item +='<option value="'+data[i]["positionId"]+'">'+data[i]["positionName"]+'</option>';
            $("#position-list").empty();
            $("#position-list").append(item);
        });
    },

    initPermission:function ()
    {
        var url = path + "/s/findQMPermissionTree.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = qm_member.getPermission(data.result, Constant.WORKER_PERMISSION);
            var item = "";
            for (var i = 0; i < data.length; i++)
            {
                var permission = data[i]["children"];
                item += '<tr><td class="describe-td-1"><div class="describe">' + data[i]["name"] + '</div></td>';
                for (var j = 0; j < permission.length; j++)
                    item += '<td><div><input type="checkbox"  value="' + permission[j]["id"] + '"/><span>' + permission[j]["name"] + '</span></div></td>' +
                        '<td><span class="duty-describe">' + permission[j]["url"] + '</span></td></tr>';
            }
            $("#personal-permission").empty();
            $("#personal-permission").append(item);
        });
    },

    getPermission: function (data, type)
    {
        for (var i = 0; i < data.length; i++)
            if (data[i]["id"] == type)
                return data[i]["children"];
    },

    addMember:function ()
    {
        var url = path + "/s/.action";
        var params = {};

        params["userName"] = $("#user-name").val();
        params["userName"] = $("#user-name").val();
        params["userName"] = $("#user-name").val();
        params["userName"] = $("#user-name").val();
        params["userName"] = $("#user-name").val();
        params["userName"] = $("#user-name").val();
        params["userName"] = $("#user-name").val();
        params["userName"] = $("#user-name").val();
        params["userName"] = $("#user-name").val();
        params["userName"] = $("#user-name").val();
    },

    permissionClick:function ()
    {
        var permission = "";
        var permissionItem = $("#worker-permission").find("input[type='checkbox']:checked");
        for (var i = 0; i < permissionItem.length; i++)
            permission += $(permissionItem[i]).val() + ",";
        $("#permission").val(permission);
        Dutyoff();
    },

    initWebUpload: function ()
    {
        var setting = {
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: path + '/script/script/webuploader-0.1.5/Uploader.swf',
            // 文件接收服务端。
            server: path + '/s/uploadToImgSpace.action',
            threads: 1,  // 上传并发数
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#card-front',
            fileVal: 'img',
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'jpg,jpeg,png',
                mimeTypes: 'image/*'
            }
        };
        qm_member.cardFront = WebUploader.create(setting);
        setting.server = path + "/s/";
        qm_member.cardBack= WebUploader.create(setting);

        qm_member.uploader.on('fileQueued', function (file)
        {
            var $list = $("#upload-list");

            var $li = $('<div onclick="gdReleaseJS.onSelectImg(this);" class="imgbox am-img-thumbnail">' +
                    '<a id="' + file.id + '"><img style="width: 100%;height: 100%" src=""/></a>' +
                    '</div>'),
                $img = $li.find('img');

            // $list为容器jQuery实例
            $list.append($li);

            qm_member.uploader.makeThumb(file, function (error, src)
            {
                if (error)
                {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }
                $img.attr('src', src);
            }, 124, 124);
        });

        // 文件上传过程中创建进度条实时显示。
        qm_member.uploader.on('uploadProgress', function (file, percentage)
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
        qm_member.uploader.on('uploadSuccess', function (file, data)
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
        qm_member.uploader.on('uploadError', function (file)
        {
            var $li = $('#' + file.id), $percent = $li.find('.upload-progress');

            if ($percent.length)
                $percent.remove();

            $percent = $('<div class="upload-progress" style="color: red;width: 65px">上传失败</div>').appendTo($li);
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        qm_member.uploader.on('uploadComplete', function (file)
        {

        });
    },
};