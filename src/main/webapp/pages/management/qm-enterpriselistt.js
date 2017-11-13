var qm_memberList = {
    memberList:$("#member-list"),

    init: function ()
    {
        //----------
        if (!myjs.isNull(departmentId)){
            $.cookie('departmentId',departmentId)
        }else {
            if ( $.cookie('departmentId') !=null){
                departmentId = $.cookie('id');
                console.log('返回读取ID')
            }
        }
        //----------
        qm_memberList.initUI();
        qm_memberList.findMemberList();
    },

    initUI: function ()
    {
        if (myjs.isNull(departmentId))
            $("#btn-update-department").hide();
    },

    findMemberList: function ()
    {
        var url = path + "/s/findMemberList.action";
        var params = {};

        params["departmentId"] = departmentId;
        params["pageNum"] = 1;
        params["pageSize"] = 10;

        myjs.ajax_post(url, params, function (data)
        {
            console.log(data);
            data = data.result;
            for (var i = 0; i < data.length; i++)
            qm_memberList.insertMemberColumn(
                data[i]["userName"],data[i]["userSex"],
                data[i]["userPhone"],data[i]["departmentName"],
                data[i]["positionName"],data[i]["userId"]
            );
        });
    },

    insertMemberColumn: function (name, sex, phone, department, position, id)
    {
        var item = "";
        item += '<tr>' +
            '<td>' + name + '</td>' +
            '<td>' + sex + '</td>' +
            '<td>' + phone + '</td>' +
            '<td>' + department + '</td>' +
            '<td>' + position + '</td>' +
            '<td><a class="personnel-details" href="' + path + '/pages/management/qm-member.jsp?' + id + '">编辑</a></td>' +
            '</tr>';
        qm_memberList.memberList.append(item);
    },

    searchMember: function ()
    {
        var url = path + "/s/findMemberByNameOrPhone" + Constant.URL_SUFFIX;
        var params = {};

        params["userName"] = $("#search-keyword").val().trim();
        params["teamDepartmentId"] = departmentId;

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            qm_memberList.memberList.empty();
            for(var i = 0;i<data.length;i++)
                qm_memberList.insertMemberColumn(
                    data[i]["userName"],data[i]["userSex"],
                    data[i]["userPhone"],data[i]["departmentName"],
                    data[i]["positionName"],data[i]["memberId"]
                );
        });
    },

    toDepartmentInfo: function ()
    {
        window.location.href = "qm-departments.jsp?" + departmentId;
    },

    pageShowNum: function (item)
    {
        //选择显示数量
        $(item).addClass('paging-checked').siblings().removeClass('paging-checked');
        var pageNum = $.trim($('#pageleft').text());
        var pageSize = $.trim($(item).text());
        var pageCount = $.trim($('#pageright').text());
        var pageresult = (pageNum == pageCount) ? 1 : pageNum;
        $('#branchpageleft').html(pageresult);
        // qm_universalApply.getAccountApply(pageNum, pageSize);

    },
    NextPage: function (item)
    {
        //翻页
        var pagetext = $.trim($(item).text());
        var pageSizetext = $.trim($('#pageleft').text());
        var pageCount = $.trim($('#pageright').text());
        var pageSize = $.trim($('#pagebox').find('.paging-checked').text());
        if (pagetext == '下一页')
        {
            if (pageSizetext >= pageCount)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) + 1);
            $('#pageleft').html(pageNum);
            // qm_universalApply.getAccountApply(pageNum, pageSize);
        } else
        {
            if (pageSizetext <= 1)
                return;
            var pageNum = Math.ceil((pageSizetext - 0) - 1);
            $('#pageleft').html(pageNum);
            // qm_universalApply.getAccountApply(pageNum, pageSize);
        }
    },
};