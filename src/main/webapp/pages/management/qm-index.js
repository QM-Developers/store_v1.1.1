var qm_index = {
    init: function ()
    {
        var url = path + "/s/findTeamAndMemberCount.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = myjs.replaceNull(data.result);
            console.log(data);
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<li class="menu-li">' +
                    '<a target="iframepage1" href="' + path + '/pages/management/qm-enterpriselistt.jsp?' + data[i]["id"] + '" class="am-cf menu-li-a">' +
                    '<span class="am-icon-angle-double-right am-fr am-margin-right"></span>' +
                    data[i]["menuName"] + '<span>(' + data[i]["number"] + ')</span></a></li>';
            $("#department-list").empty();
            $("#department-list").append(item);
        });
    },

    exitSystem:function ()
    {
        var url = path +'/logoutOnBrowser.action';
        var params ={};
        myjs.ajax_post(url,params,function (data)
        {
            var state = data.state;
            if(state =='1'){
                top.location.href =path +"/pages/management/qm-sys-iogin.jsp";
            }
        })
    },

};