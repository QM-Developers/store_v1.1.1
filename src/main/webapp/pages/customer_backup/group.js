var groupJS = {
    cooperId: "",
    customer_flag: "",

    customerWindow: function ()
    {
        groupJS.customer_flag = "";
        s = ["su_province", "su_city", "su_county"];
        opt0 = ["省份", "地级市", "市、县级市"];
        $("#userBirthday").val("");
        $("input:radio[name='userSex']:eq(0)").prop("checked", "checked");

        _init_area();
        $("#customerGroupId").parents("div:eq(1)").show();
        $('#customer-window').modal();
    },

    cooperationWindow: function ()
    {
        s = ["sc_province", "sc_city", "sc_county"];
        _init_area();

        $("#cooperation-window").modal();
    },

    saveOrUpdateCustomer: function ()
    {
        var customer = {};
        var flag = myjs.isNull($("#customerGroupId option:selected").attr("data-type"));

        customer['userName'] = $("#userName").val();
        customer['userPhone'] = $("#userPhone").val();
        customer['userAddress'] = $("#userAddress").val();
        customer['customerGroupId'] = $("#customerGroupId").val();
        customer['userSex'] = $("input:radio[name='userSex']:checked").val();
        customer['userBirthday'] = "1992-12-12"//$("#userBirthday").val();
        customer['userArea'] = $("#su_province").val() + " " + $("#su_city").val() + " " + $("#su_county").val();

        if (myjs.isNull(groupJS.customer_flag) && flag)
            groupJS.addUserByStore(customer);
        else if (myjs.isNull(groupJS.customer_flag) && !flag)
            groupJS.addCustomerToCooper(customer);
        else if (!myjs.isNull(groupJS.customer_flag) && flag)
            groupJS.updateCustomer(customer);
        else if (!myjs.isNull(groupJS.customer_flag) && !flag)
            groupJS.updateCooperCustomer(customer);
    },

    addUserByStore: function (customer)
    {
        var url = path + "/s/addUserByStore.action";

        myjs.ajax_post(url, customer, function (data)
        {
            console.log(data);
        });
    },

    addCustomerToCooper: function (customer)
    {
        var url = path + "/s/addCustomerToCooper.action";
        customer['myTeamId'] = customer['customerGroupId'];
        customer['customerGroupId'] = "";

        myjs.ajax_post(url, customer, function (data)
        {
            console.log(data);
        });
    },

    updateCustomer: function (customer)
    {
        var url = path + "/s/updateCustomer.action";
        customer['myTeamId'] = "";

        myjs.ajax_post(url, customer, function (data)
        {
            console.log(data);
        });
    },

    updateCooperCustomer: function (customer)
    {
        var url = path + "/s/updateCustomer.action";
        customer['myTeamId'] = customer['customerGroupId'];
        customer['customerGroupId'] = "";

        myjs.ajax_post(url, customer, function (data)
        {
            console.log(data);
        });
    },

    saveOrUpdateCooperation: function ()
    {
        var url = path + "/s/addCooperation.action";
        var params = {};

        params["myTeamName"] = $("#myTeamName").val();
        params["myTeamPrincipalName"] = $("#myTeamPrincipalName").val();
        params["myTeamPrincipalPhone"] = $("#myTeamPrincipalPhone").val();
        params["myTeamArea"] = $("#sc_province").val() + " " + $("#sc_city").val() + " " + $("#sc_county").val();
        params["myTeamAddress"] = $("#myTeamAddress").val();

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data);
        });
    },

    saveOrUpdateGroup: function ()
    {
        var url = path + "/s/addCustomerGroup.action";
        var group = {};

        // myjs.ajax_post(url, group, function (data)
        // {
        //     console.log(data);
        // });
    },

    findGroups: function ()
    {
        var url = path + "/s/findCustomerGroup.action";

        myjs.ajax_post(url, {}, function (data)
        {
            var item = "";
            var select = "";
            data = data.result;

            for (var i = 0; i < data.length; i++)
            {
                item += '<button type="button" onclick="groupJS.findCustomerByGroup(\'' + data[i]["customerGroupId"] + '\');" class="am-btn am-btn-default btn-white">' + data[i]["customerGroupName"] + '</button>';
                select += '<option value="' + data[i]["customerGroupId"] + '">' + data[i]["customerGroupName"] + '</option>';
            }

            $("#cooperation-dropdown").before(item);
            $("#customerGroupId").append(select);
            groupJS.findCooperation();
        });
    },

    findCustomerByGroup: function (gid)
    {
        var url = path + "/s/findCustomerByGroup.action";
        groupJS.cooperId = "";

        myjs.ajax_post(url, {'customerGroupId': gid}, function (data)
        {
            groupJS.appendCustomer(data);
        });
    },

    appendCustomer: function (data)
    {
        $("#customer-list").empty();
        var item = "";

        if (myjs.isNull(data.result))
            return;

        data = data.result;

        for (var i = 0; i < data.length; i++)
            item += '<tr>' +
                '<td><input type="checkbox"></td>' +
                '<td><img class="am-radius" src="' + (data[i]["userImg"] == null ? path + "/none.jpg" : path + "/" + data[i]["userImg"] ) + '" width="30" height="30"/></td>' +
                '<td>' + data[i]["userName"] + '</td>' +
                '<td>' + data[i]["userPhone"] + '</td>' +
                '<td>' + data[i]["userArea"] + '</td>' +
                '<td>' +
                '<div class="am-btn-toolbar">' +
                '<div class="am-btn-group am-btn-group-xs">' +
                '<button onclick="groupJS.findCustomerInfo(\'' + data[i]["customerId"] + '\')" class="am-btn am-btn-default am-btn-xs am-text-secondary">' +
                '<span class="am-icon-pencil-square-o"></span> 编辑 / 查看' +
                '</button>' +
                '<div class="am-dropdown">' +
                '<button onclick="groupJS.findPlacesTitle(this,\'' + data[i]["customerId"] + '\')" class="am-btn am-btn-default am-btn-xs am-text-secondary">' +
                '<span class="am-icon-pencil-square-o"></span> 场地' +
                '</button>' +
                '</div>' +
                '<button onclick="groupJS.deleteCustomer(x.userPhone)" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">' +
                '<span class="am-icon-trash-o"></span> 删除' +
                '</button>' +
                '</div></div></td></tr>';

        $("#customer-list").append(item);
    },

    findPlacesTitle: function (item, customerId)
    {
        var url = path + "/s/findPlacesTitle.action";

        if (($(item).next("ul").length ) > 0)
        {
            $(item).parent(".am-dropdown:eq(0)").dropdown('open');
            return;
        }


        myjs.ajax_post(url, {'customerId': customerId}, function (data)
        {
            var placeList = "";
            data = data.result;

            placeList += '<ul class="am-dropdown-content">';
            if (data.length < 1)
                placeList += '<li class="am-dropdown-header">没有场地</li>';

            for (var i = 0; i < data.length; i++)
                placeList += '<li><a href="information.jsp?info?' + data[i]["userPlaceId"] + '">' + data[i]["userPlaceName"] + '</a></li>';

            placeList += '<li class="am-active"><a href="information.jsp?add?'+customerId+'">新增场地</a></li></ul>';

            $(item).after(placeList);
            $(item).parent(".am-dropdown:eq(0)").dropdown('open');
        });
    },

    findCustomerInfo: function (customerId)
    {
        var url = path + "/s/findCustomerInfo.action";
        var params = {'customerId': customerId};

        myjs.ajax_post(url, params, function (data)
        {
            groupJS.customer_flag = customerId;
            data = data.result;
            $("#userName").val(data["userName"]);
            $("#userAddress").val(data["userAddress"]);
            $("#userPhone").val(data["userPhone"]);
            $("#customerGroupId").val(myjs.isNull(data["customerGroupId"]) ? data["myTeamId"] : data["customerGroupId"]);
            data['userBirthday'] = new Date(data['userBirthday']).format("yyyy-MM-dd");
            $("#userBirthday").val(data['userBirthday']);
            opt0 = data['userArea'].split(" ");
            s = ["su_province", "su_city", "su_county"];
            _init_area();
            if (data["userSex"] == "sex_1")
                $("input:radio[name='userSex']:eq(0)").prop("checked", true);
            else
                $("input:radio[name='userSex']:eq(1)").prop("checked", true);

            $("#customerGroupId").parents("div:eq(1)").hide();
            $('#customer-window').modal();
        });
    },

    findCooperation: function ()
    {
        var url = path + "/s/findCooperation.action";

        myjs.ajax_post(url, {}, function (data)
        {
            var item = "";
            var select = "";
            data = data.result;

            for (var i = 0; i < data.length; i++)
            {
                item += '<li><a href="###" onmouseenter="groupJS.popoverInfo(this,\'' + data[i]["myTeamArea"] + '\',\'' + data[i]["myTeamAddress"] + '\')" onclick="groupJS.findPartner(\'' + data[i]["myTeamId"] + '\')">' + data[i]["myTeamName"] + '</a></li>';
                select += '<option data-type="cooperation" value="' + data[i]["myTeamId"] + '">合作社：' + data[i]["myTeamName"] + '</option>'
            }

            $("#cooperation-list").html(item);
            $("#customerGroupId").append(select);
        });
    },

    popoverInfo: function (item, area, address)
    {
        $(item).popover({content: '<p>所在区域：' + area + '</p><p>详细地址：' + address + '</p>', trigger: 'hover focus'});
        $(item).popover('open');
    },

    findPartner: function (cooperId)
    {
        var url = path + "/s/findPartner.action";

        myjs.ajax_post(url, {"cooperId": cooperId}, function (data)
        {
            groupJS.cooperId = cooperId;
            groupJS.appendCustomer(data);
        });
    },
};