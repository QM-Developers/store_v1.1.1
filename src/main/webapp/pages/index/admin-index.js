var indexJS = {
    initMenu: function ()
    {
        var url = path + "/user_findMenus.action";
        myjs.ajax_post(url, {}, function (data)
        {
            data = data.result;
            var item = "";

            for (var i = 0; i < data.length; i++)
            {
                if (myjs.isNull(data[i]['childMenus']))
                    item += '<li><a target="iFrame0" href="'+path + data[i]["url"] + '"><span class="am-icon-th"></span> ' + data[i]["name"] + '</a></li>';
                else
                {
                    var child = data[i]['childMenus'];
                    item += '<li class="admin-parent">' +
                        '<a class="am-cf" data-am-collapse="{target: \'#collapse-nav'+i+'\'}">' +
                        '<span class="am-icon-file"></span> ' +data[i]["name"]+
                        '<span class="am-icon-angle-right am-fr am-margin-right"></span>' +
                        '</a>'+
                        '<ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav' + i + '">';

                    for(var j = 0;j<child.length;j++)
                        item += '<li><a target="iFrame0" href="'+path+child[j]["url"]+'" class="am-cf"><span class="am-icon-check"></span> '+child[j]["name"]+'</a></li>';

                    item += '</ul></li>';
                }
            }

            $("#menu-list").append(item);
        });
    },

    hideList:function ()
    {
        $("#dropdown-list").dropdown('close');
    },

};
