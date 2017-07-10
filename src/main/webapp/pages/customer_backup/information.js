var informationJS = {
    backLast: function ()
    {
        self.location.href = "customer.jsp?" + groupId;
    },

    findPlace: function ()
    {
        if (optFlag == "add")
        {
            customerId = placeId;
            placeId = "";
            return;
        }

        var url = path + "/s/findPlace.action";

        myjs.ajax_post(url, {'userPlaceId': placeId}, function (data)
        {
            data = data.result;
            placeId = data['userPlaceId'];

            $("#userPlaceName").val(data['userPlaceName']);
            $("#userPlaceAddress").val(data['userPlaceAddress']);
            $("#userPlaceType").val(data['userPlaceType']);
            $("#userEmployeeNum").val(data['userEmployeeNum']);
            $("#userPlaceAcreage").val(data['userPlaceAcreage']);

            opt0 = data['userPlaceArea'].split(" ");
            _init_area();

            informationJS.findBreedTypes();
        });
    },

    findBreedTypes: function ()
    {
        var url = path + "/s/findBreedTypes.action";

        myjs.ajax_post(url, {'userPlaceId': placeId}, function (data)
        {
            data = data.result;
            var item = "";

            for (var i = 0; i < data.length; i++)
            {
                item += '<div class="am-panel am-panel-default"><div class="am-panel-hd">' +
                    '<h4 class="am-panel-title" data-am-collapse="{parent: \'#accordion\', target: \'#accordion' + i + '\'}">' + data[i]["userBreedType"] +
                    '<span onclick="informationJS.breedWindow(\'' + data[i]["userBreedTypeId"] + '\')" class="am-text-sm am-round am-badge am-badge-primary">' +
                    '<i class="am-icon-pencil"></i>修改' +
                    '</span>' +
                    '</h4></div><div id="accordion' + i + '" class="am-panel-collapse am-collapse"><div class="am-panel-bd">' +
                    '<ul class="am-list">' +
                    '<li><b>对应品种</b>&nbsp;&nbsp;&nbsp;' + data[i]["userBreedVariety"] + '</li>' +
                    '<li><b>养殖方式</b>&nbsp;&nbsp;&nbsp;' + data[i]["userBreedStyle"] + '</li>' +
                    '<li><b>用料类型</b>&nbsp;&nbsp;&nbsp;' + data[i]["userFodderType"] + '</li>' +
                    '<li><b>配料方式</b>&nbsp;&nbsp;&nbsp;' + data[i]["userFodderStyle"] + '</li>' +
                    '<li><b>用料总量</b>&nbsp;&nbsp;&nbsp;' + data[i]["userFodderNum"] + '</li>' +
                    '<li><b>养殖数量</b>&nbsp;&nbsp;&nbsp;' + data[i]["userBreedNum"] + '</li>' +
                    '<li><b>月出栏数</b>&nbsp;&nbsp;&nbsp;' + data[i]["userSellNum"] + '</li>' +
                    '</ul>' +
                    '</div></div></div>';
            }
            $("#accordion").append(item);

            informationJS.findPlaceHardware();
        });
    },

    findPlaceHardware: function ()
    {
        var url = path + "/s/findPlaceHardware.action";

        myjs.ajax_post(url, {'userPlaceId': placeId}, function (data)
        {
            data = data.result;
            var item = "";

            for (var i = 0; i < data.length; i++)
            {
                item += '<li>' +
                    '<b>' + data[i]["userHardwareName"] + '</b>&nbsp;&nbsp;&nbsp;' + data[i]["userHardwareNum"] +
                    '<span onclick="informationJS.hardwareWindow(\'' + data[i]["userHardwareId"] + '\')" class="am-text-sm am-round am-badge am-badge-primary">' +
                    '<i class="am-icon-pencil"></i>修改' +
                    '</span>' +
                    '</li>';
            }

            $("#hardware-list").append(item);
        });
    },

    saveOrUpdatePlace: function ()
    {
        var url = "";
        var params = {
            'userPlaceName': $("#userPlaceName").val(),
            'userPlaceAddress': $("#userPlaceAddress").val(),
            'userPlaceType': $("#userPlaceType").val(),
            'userEmployeeNum': $("#userEmployeeNum").val(),
            'userPlaceAcreage': $("#userPlaceAcreage").val(),
            'userPlaceArea': $("#s_province").val() + " " + $("#s_city").val() + " " + $("#s_county").val()
        };

        if (optFlag == "add")
        {// 添加
            url = path + "/s/addUserPlace.action";
            params['customerId'] = customerId;

            myjs.ajax_post(url, params, function (data)
            {
                placeId = data.result;
            });
        } else
        {// 修改
            url = path + "/s/updateUserPlace.action";
            params['userPlaceId'] = placeId;
            myjs.ajax_post(url, params, function (data)
            {
            });
        }
    },

    saveOrUpdateHardware: function ()
    {
        var url = "";
        var params = {
            'userHardwareName': $("#userHardwareName").val(),
            'userHardwareNum': $("#userHardwareNum").val(),
            'userPlaceId': placeId
        };

        if (myjs.isNull(hardwareId))
        {// 添加
            url = path + "/s/addPlaceHardware.action";

            myjs.ajax_post(url, params, function (data)
            {
            });
        } else
        {// 修改
            url = path + "/s/updateHardwareById.action";
            params['userHardwareId'] = hardwareId;

            myjs.ajax_post(url,params,function (data)
            {
                console.log(data);
            });
        }
    },

    saveOrUpdateBreed: function ()
    {
        var url = "";
        var params = {
            'userBreedType': $("#userBreedType").val(),
            'userBreedVariety': $("#userBreedVariety").val(),
            'userBreedNum': $("#userBreedNum").val(),
            'userSellNum': $("#userSellNum").val(),
            'userBreedStyle': $("#userBreedStyle").val(),
            'userFodderType': $("#userFodderType").val(),
            'userFodderStyle': $("#userFodderStyle").val(),
            'userFodderNum': $("#userFodderNum").val(),
            'userPlaceId': placeId
        };

        if (myjs.isNull(breedId))
        {// 添加
            url = path + "/s/addBreedType.action";

            myjs.ajax_post(url, params, function (data)
            {
                console.log(data);
            });
        } else
        {// 修改
            params['userBreedTypeId'] = breedId;

            url = path + "/s/updateBreedTypeById.action";
            myjs.ajax_post(url, params, function (data)
            {
                console.log(data);
            });
        }

    },

    breedWindow: function (bId)
    {
        if(!myjs.isNull(bId))
        {
            var url = path + "/s/findBreedTypeById.action";

            myjs.ajax_post(url,{'userBreedTypeId':bId},function (data)
            {
                breedId = bId;
                data = data.result;
                $("#userBreedType").val(data['userBreedType']);
                $("#userBreedVariety").val(data['userBreedVariety']);
                $("#userBreedNum").val(data['userBreedNum']);
                $("#userSellNum").val(data['userSellNum']);
                $("#userBreedStyle").val(data['userBreedStyle']);
                $("#userFodderType").val(data['userFodderType']);
                $("#userFodderStyle").val(data['userFodderStyle']);
                $("#userFodderNum").val(data['userFodderNum']);
            });
        }

        if (!myjs.isNull(placeId))
            $('#breed-window').modal();
        else
            alert("请先保存场地信息");
    },

    hardwareWindow: function (hId)
    {
        if(!myjs.isNull(hId))
        {
            var url = path + "/s/findHardwareById.action";
            myjs.ajax_post(url,{'userHardwareId':hId},function (data)
            {
                hardwareId = hId;
                data = data.result;
                $("#userHardwareName").val(data['userHardwareName']);
                $("#userHardwareNum").val(data['userHardwareNum']);
            });
        }

        if (!myjs.isNull(placeId))
            $('#hardware-window').modal();
        else
            alert("请先保存场地信息");
    },

    init: function ()
    {
        informationJS.findPlace();
    },
};
