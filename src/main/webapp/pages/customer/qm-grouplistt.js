var qm_goruplist = {
    init: function ()
    {
        qm_goruplist.findCustomer();
    },

    findCustomer: function ()
    {
        var url = path + "/s/findCustomerByGroup.action";
        var params = {};
        params["customerGroupId"] = groupId;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            console.log(data);
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<tr>' +
                    '<td>' + data[i]["userName"] + '</td>' +
                    '<td>' + data[i]["userSex"] + '</td>' +
                    '<td>' + data[i]["userPhone"] + '</td>' +
                    '<td>' + data[i]["customerGroupName"] + '</td>' +
                    '<td>' + data[i]["userStatus"] + '</td>' +
                    '<td>' +
                    '<a class="personnel-details" href="qm-group.jsp?' + data[i]["customerId"] + '">查看详情</a>' +
                    '</td></tr>';
            $("#customer-list").append(item);
        });
    },
};