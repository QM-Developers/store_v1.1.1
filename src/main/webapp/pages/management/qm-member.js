var qm_member = {
    memberInfo: {},
    finished: false,
    cardFront: null,
    cardBack: null,
    cardFrontResult: "",
    cardBackResult: "",

    init: function ()
    {
        if (!myjs.isNull(userId))
            qm_member.findMemberInfo();

        qm_member.findDepartmentList();
        qm_member.initPermission();
        qm_member.initWebUpload();
    },

    findDepartmentList: function ()
    {
        var url = path + "/s/findDepartmentList.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["departmentId"] + '">' + data[i]["departmentName"] + '</option>';
            $("#department-list").append(item);
            if (!myjs.isNull(userId))
            {
                if (qm_member.finished)
                    qm_member.findPositionList(qm_member.memberInfo["departmentId"]);
                else
                    qm_member.finished = true;
            }
            else
                qm_member.findPositionList(data[0]["departmentId"]);
        });
    },

    findMemberInfo: function ()
    {
        var url = path + "/s/findMemberInfo.action";
        var params = {};

        params["memberId"] = userId;

        myjs.ajax_post(url, params, function (data)
        {
            qm_member.memberInfo = data.result;
            if (qm_member.finished)
                qm_member.findPositionList(qm_member.memberInfo["departmentId"]);
            else
                qm_member.finished = true;
        });
    },

    iniMemberInfo: function ()
    {
        var params = qm_member.memberInfo;
        console.log(params);
        $("#user-name").val(params["userName"]);
        $("#user-phone").val(params["userPhone"]);
        $("#user-identity").val(params["userIdentity"]);
        $("#department-list").val(params["departmentId"]);
        $("#position-list").val(params["positionId"]);

        var sex = $("#user-sex>a");
        for (var i = 0; i < sex.length; i++)
            if ($(sex[i]).text() == params["userSex"])
                $(sex[i]).addClass("poptwo-c-lia1");
            else
                $(sex[i]).removeClass("poptwo-c-lia1");

        if (!myjs.isNull(params["userCardFront"]))
        {
            var imgFront = $("#img-card-front");
            imgFront.attr("result", params["userCardFront"]);
            imgFront.attr("src", path + "/s/getCardImage.action?path=" + params["userCardFront"]);
            clickon(imgFront[0]);
        }
        if (!myjs.isNull(params["userCardBack"]))
        {
            var imgBack = $("#img-card-back");
            imgBack.attr("result", params["userCardBack"]);
            imgBack.attr("src", path + "/s/getCardImage.action?path=" + params["userCardBack"]);
            clickon(imgBack[0]);
        }

        var permissionList = params["permissionList"];
        var permission = "";
        for (var i = 0; i < permissionList.length; i++)
            permission += permissionList[i]["permissionId"] + ",";
        $("#permission").val(permission);

        console.log(permission);
    },

    findPositionList: function (did)
    {
        var url = path + "/s/findPositionList.action";
        var params = {};

        params["departmentId"] = did;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["positionId"] + '">' + data[i]["positionName"] + '</option>';
            $("#position-list").empty();
            $("#position-list").append(item);
            if (qm_member.finished)
            {
                qm_member.iniMemberInfo();
                qm_member.finished = false;
            }
        });
    },

    initPermission: function ()
    {
        var url = path + "/s/findQMPermissionTree.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
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

    permissionWindow: function (item)
    {
        var ids = $("#permission").val().split(",");
        var checkbox = $("#personal-permission").find("input[type='checkbox']");
        for (var i = 0; i < checkbox.length; i++)
            $(checkbox[i])[0].checked = false;
        for (var i = 0; i < ids.length - 1; i++)
            for (var j = 0; j < checkbox.length; j++)
                if ($(checkbox[j]).val() == ids[i])
                    $(checkbox[j]).prop('checked', 'true');
        dutyshow();
    },


    saveOrUpdateMember: function ()
    {
        var url = path;
        if(myjs.isNull(userId))
            url += "/s/addMember.action";
        else
            url += "/s/updateMember.action";

        var params = {};

        params["memberId"] = userId;
        params["userName"] = $("#user-name").val();
        params["userSex"] = $("#user-sex>a.poptwo-c-lia1").text();
        params["userPhone"] = $("#user-phone").val();
        params["userIdentity"] = $("#user-identity").val();
        params["departmentId"] = $("#department-list").val();
        params["positionId"] = $("#position-list").val();
        params["userCardFront"] = $("#img-card-front").attr("result");
        params["userCardBack"] = $("#img-card-back").attr("result");
        params["permission"] = $("#permission").val();

        console.log(params);

        // myjs.ajax_post(url, params, function (data)
        // {
        //     console.log(data);
        // });
    },

    permissionClick: function ()
    {
        var permission = "";
        var permissionItem = $("#personal-permission").find("input[type='checkbox']:checked");
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
            server: path + '/s/insertCardFront.action',
            threads: 1,  // 上传并发数
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#btn-card-front',
            fileVal: 'cardFront',
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'jpg,jpeg,png',
                mimeTypes: 'image/*'
            }
        };
        qm_member.cardFront = WebUploader.create(setting);

        setting.pick = "#btn-card-back";
        setting.fileVal = "cardBack";
        setting.server = path + "/s/insertCardBack.action";
        qm_member.cardBack = WebUploader.create(setting);

        function onPick(uploadItem, imgItem)
        {
            uploadItem.on('fileQueued', function (file)
            {
                imgItem.val(file.id);
                uploadItem.makeThumb(file, function (error, src)
                {
                    if (error)
                    {
                        imgItem.replaceWith('<span>不能预览</span>');
                        return;
                    }
                    imgItem.attr('src', src);
                }, 1, 1);
                clickon(imgItem[0]);
            });
        }

        function uploadProgress(uploadItem, imgItem)
        {
            var percent = imgItem.prev("div").children("div");

            uploadItem.on('uploadProgress', function (file, percentage)
            {
                percent.css('width', percentage * 100 + '%');
            });
        }

        function onSuccess(uploadItem, imgItem)
        {
            uploadItem.on('uploadSuccess', function (file, data)
            {
                $(imgItem).attr("result", data.result);
                var percent = imgItem.prev("div");
                percent.hide();
            });
        }

        function uploadComplete(uploadItem, imgItem)
        {
            uploadItem.on('uploadComplete', function (file)
            {

            });
        }

        function uploadError(uploadItem, imgItem)
        {
            uploadItem.on('uploadError', function (file)
            {

            });
        }

        onPick(qm_member.cardFront, $("#img-card-front"));
        onPick(qm_member.cardBack, $("#img-card-back"));
        onSuccess(qm_member.cardFront, $("#img-card-front"));
        onSuccess(qm_member.cardBack, $("#img-card-back"));
        uploadProgress(qm_member.cardFront, $("#img-card-front"));
        uploadProgress(qm_member.cardBack, $("#img-card-back"));
        uploadComplete(qm_member.cardFront, $("#img-card-front"));
        uploadComplete(qm_member.cardBack, $("#img-card-back"));
        uploadError(qm_member.cardFront, $("#img-card-front"));
        uploadError(qm_member.cardBack, $("#img-card-back"));
    },

    removeImage: function (item, flag)
    {
        var id = $(item).next("img").val();
        clickoff(item);

        if (myjs.isNull(id))
            return;
        if (flag == "front")
            qm_member.cardFront.removeFile(id, true);
        else
            qm_member.cardBack.removeFile(id, true);
    },

    upload: function ()
    {
        qm_member.cardFront.upload();
        qm_member.cardBack.upload();
    },

    deleteMember:function ()
    {
        if (myjs.isNull(userId))
            return;

        var url = path + "/s/deleteMember"+Constant.URL_SUFFIX;
        var params = {};

        params["memberId"] = userId;

        myjs.ajax_post(url,params,function (data)
        {
            console.log(data);
        });
    },
};