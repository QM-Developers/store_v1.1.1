var qm_groupdata = {
    init: function ()
    {
        // qm_groupdata.findCustomerGroup();
    },

    findCustomerGroup: function ()
    {
        var url = path + "/s/findCustomerGroup.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            var item = "";
            data = data.result;
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["customerGroupId"] + '">' + data[i]["customerGroupName"] + '</option>';
            $("#customer-group").append(item);
        });
    },

    addCustomerRecord: function ()
    {
        var url = path + "/s/addCustomerRecord.action";
        var params = {};
        params["userName"] = $("#customer-name").val();
        params["userPhone"] = $("#customer-phone").val();
        params["userSex"] = $("#customer-sex>a.poptwo-c-lia1").attr("val");
        params["userBirthday"] = $("#customer-birthday").val();
        params["userIdentity"] = $("#customer-identity").val();
        params["creditRating"] = $("#credit-rating>a.groupdata-checkbox-bg").attr("val");
        params["userArea"] = $("#customer-area").val();
        params["userAddress"] = $("#customer-address").val();
        params["customerGroupId"] = $("#customer-group").val();
        params["lngAndLat"] = $("#lng-and-lat").val();

        myjs.ajax_post(url,params,function (data)
        {
            console.log(data);
        });
    },

    dragMapSuccess: function (rep)
    {
        $("#customer-area").val(rep["address"]);
        $("#lng-and-lat").val(rep["position"]["lng"] + "," + rep["position"]["lat"]);
    },

    dragMapFail: function (rep)
    {

    },
};