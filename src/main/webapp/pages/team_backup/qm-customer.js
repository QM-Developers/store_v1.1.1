var qm_customerJS = {
    departmentList: null,
    optionType: "",
    userId: "",
    roleId: "",
    teamId: "",
    departmentId: "",
    departmentType: "",

    tabs: {
        company: 'Company',
        department: 'Department',
    },
    types: {
        principal: "principal",
        department: "department"
    },
    role: {
        person: 1003,  // 个人
        corporation: 1004,    // 总裁
        company: 1005,    // 经理
        department: 1006  // 部门主管
    },
    departmentTypes: {
        DEPARTMENT_NORMAL: "normal",    // 普通部门
        DEPARTMENT_MANAGER: "manager",  // 总经办
        DEPARTMENT_FINANCIAL: "financial",  // 财务部
        DEPARTMENT_BUSINESS: "business",   // 业务部
        DEPARTMENT_PERSONNEL: "personnel",   // 人事部
    },

    init: function ()
    {
        if ("depart0" == did)
            qm_customerJS.switchTab(qm_customerJS.tabs.corporation);
        else
            qm_customerJS.findDepartmentInfo(did);

        if (roleId == qm_customerJS.role.company || roleId < qm_customerJS.role.corporation)
            qm_customerJS.findCompanyList();

        $("#creation").click(function (e)
        {
            $("#popone").css("display", "block");
            stopPropagation(e);
        });
    },

    disabledAddBtn: function ()
    {
        var isPrimary = (parseInt(roleId) == qm_customerJS.role.corporation);
        var inTeam = myTeamId == qm_customerJS.teamId;
        var inPersonnel = departmentType == qm_customerJS.departmentTypes.DEPARTMENT_PERSONNEL;
        var inManager = departmentType == qm_customerJS.departmentTypes.DEPARTMENT_MANAGER;

        if (isPrimary)
        {
            $("#add_type_text").text("添加公司/部门");
            $("#addType").removeAttr("disabled");
            $("#creation").show();
        } else if ((inManager || inPersonnel) && inTeam)
        {
            $("#add_type_text").text("添加部门");
            $("#addType").attr("disabled", "disabled");
            $("#creation").show();
        }
    },

    disabledSelect: function ()
    {
        var isManager = qm_customerJS.departmentType == qm_customerJS.departmentTypes.DEPARTMENT_MANAGER;
        var isPrimary = roleId == qm_customerJS.role.corporation;
        var inTeam = myTeamId == qm_customerJS.teamId;
        var inPersonnel = departmentType == qm_customerJS.departmentTypes.DEPARTMENT_PERSONNEL;
        var inManager = departmentType == qm_customerJS.departmentTypes.DEPARTMENT_MANAGER;

        if (inPersonnel && !isManager && inTeam || isPrimary)
            $("#member-list").find("select").removeAttr("disabled");
        if (inManager && inTeam || isPrimary)
            $("#member-list").find("select").removeAttr("disabled");
    },

    search: function ()
    {
        var url = path + "/s/findTeamsByKeyword.action";
        var params = {"keyword": $("#keyword").val().trim()};

        myjs.ajax_post(url, params, function (data)
        {
            var item = "";
            data = data.result;
            for (var i = 0; i < data.length; i++)
                item += '<li onclick="qm_customerJS.findCompanyInfo(\'' + data[i]["id"] + '\')" class="qm-c-li">' + data[i]["name"] + '</li>';
            $("#search-list").empty();
            $("#search-list").append(item);
        });
        $("#search-div").css("display", "block");
    },

    addDepartmentOrCompany: function ()
    {
        if ($("#addType").val() == "department")
            qm_customerJS.addDepartment();
        else
            qm_customerJS.addMyTeam();
    },

    findDepartmentInfo: function (tdId)
    {
        var url = path + "/s/findDepartmentInfo.action";
        var params = {};
        params["teamDepartmentId"] = tdId;
        myjs.ajax_post(url, params, function (data)
        {
            data = myjs.replaceNull(data.result);
            if (myjs.isNull(data))
                return;

            $("#corporationName_text").val(data["corporationName"]);
            $("#departmentPrincipalName_text").val(data["userName"]);
            $("#departmentPrincipalPhone_text").val(data["userPhone"]);
            $("#departmentAddress_text").val(data["departmentArea"] + "/" + data["departmentAddress"]);
            $("#departmentPeopleNumber_text").val(data["memberCount"]);
            $("#departmentName_text").val(data["teamDepartmentName"]);
            $("#departmentCreateDate_text").val(new Date(data["createDate"]).format("yyyy-MM-dd"));

            qm_customerJS.teamId = data["myTeamId"];
            qm_customerJS.departmentId = data["teamDepartmentId"];
            qm_customerJS.departmentType = data["departmentType"];
            qm_customerJS.findDepartmentMember(tdId, data["myTeamId"]);
            qm_customerJS.disabledAddBtn();
        });
        qm_customerJS.switchTab(qm_customerJS.tabs.department);
    },

    findDepartmentMember: function (tdId, teamId)
    {
        myjs.ajax_post(path + "/s/findDepartmentList.action", {"myTeamId": teamId}, function (data)
        {
            qm_customerJS.departmentList = data.result;
            myjs.ajax_post(path + "/s/findDepartmentMember.action", {"teamDepartmentId": tdId}, function (data2)
            {
                var memberList = data2.result;
                $("#member-list").empty();
                var item = "";
                for (var i = 0; i < memberList.length; i++)
                    item += '<tr>' +
                        '<td>' + memberList[i]["userName"] + '</td>' +
                        '<td>' + memberList[i]["userSex"] + '</td>' +
                        '<td>' + memberList[i]["userPhone"] + '</td>' +
                        '<td>' + qm_customerJS.getDepartmentSel(memberList[i]["teamDepartmentId"], memberList[i]['userId']) +
                        '<select user-id="' + memberList[i]['userId'] + '" class="select-but" disabled="disabled" onfocus="beforePromptSel(this);" onchange="PromptSel(\'' + qm_customerJS.types.principal + '\',this);">' +
                        "<option value='" + qm_customerJS.role.department + "'>负责人</option>" +
                        "<option value='" + qm_customerJS.role.person + "' " + (parseInt(memberList[i]['roleId']) > qm_customerJS.role.person ? '' : 'selected') + ">人员</option>" +
                        '</select>' +
                        '<a href="###" onclick="qm_customerJS.findDepartmentMemberInfo(\'' + memberList[i]['userId'] + '\');">详细信息</a></td>' +
                        '</tr>';
                $("#member-list").empty();
                $("#member-list").append(item);
                qm_customerJS.disabledSelect();
            });
        });
    },

    getDepartmentSel: function (did, uid)
    {
        var departmentList = qm_customerJS.departmentList;
        var departmentOption = "";
        departmentOption += '<select user-id="' + uid + '" class="select-but" disabled="disabled" onfocus="beforePromptSel(this);" onchange="PromptSel(\'' + qm_customerJS.types.department + '\',this)">';
        for (var i = 0; i < departmentList.length; i++)
            departmentOption += "<option " + (did == departmentList[i]['teamDepartmentId'] ? 'selected' : '') + " value='" + departmentList[i]['teamDepartmentId'] + "' >" + departmentList[i]['teamDepartmentName'] + "</option>";
        departmentOption += '</select>';
        return departmentOption;
    },

    switchTab: function (num)
    {
        for (var i in qm_customerJS.tabs)
            $("#" + qm_customerJS.tabs[i]).css("display", "none");
        $("#" + num).css("display", "block");
    },

    findCompanyList: function ()
    {
        var url = path + "/s/findCompanyList.action";
        var params = {};

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            $("#belongCompany").empty();
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["myTeamId"] + '">' + data[i]["myTeamName"] + '</option>';
            $("#belongCompany").append(item);
            qm_customerJS.findDepartmentList(data[0]["myTeamId"])
        });
    },

    findDepartmentList: function (tid)
    {
        var url = path + "/s/findDepartmentList.action";
        var params = {};
        params["myTeamId"] = tid;
        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;
            $("#belongDepartment").empty();
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["teamDepartmentId"] + '">' + data[i]["teamDepartmentName"] + '</option>';
            $("#belongDepartment").append(item);
        });
    },

    addMyTeam: function ()
    {
        var url = path + "/s/addMyTeam.action";
        var params = {};
        params["myTeamName"] = $("#departmentName").val();
        params["myTeamCreateDate"] = $("#createDate").val();
        myjs.ajax_post(url, params, function (data)
        {
            if (parseInt(data.state) == 1)
                $("#popup1").modal('close');
        });
    },

    addDepartment: function ()
    {
        var url = path + "/s/addDepartment.action";
        var params = {};
        params["teamDepartmentName"] = $("#departmentName").val();
        params["createDate"] = $("#createDate").val();

        myjs.ajax_post(url, params, function (data)
        {
            if (parseInt(data.state) == 1)
                $("#popup1").modal('close');
        });
    },

    changeBelong: function ()
    {
        if ($("#addType").val() == "department")
            $("#departmentText").text("部门名称:");
        else
            $("#departmentText").text("公司名称:");
    },

    changeOption: function ()
    {
        switch (qm_customerJS.optionType)
        {
            case qm_customerJS.types.principal:
                qm_customerJS.changePrincipal();
                break;
            case qm_customerJS.types.department:
                qm_customerJS.changeDepartment();
                break;
        }
    },

    changePrincipal: function ()
    {
        var url = path + "/s/changePrincipal.action";
        var params = {};
        params["teamDepartmentId"] = qm_customerJS.departmentId;
        params["userId"] = qm_customerJS.userId;
        params["roleId"] = qm_customerJS.roleId;

        myjs.ajax_post(url, params, function (data)
        {
            if (data.state > 0)
            {
                qm_customerJS.findDepartmentInfo(qm_customerJS.departmentId);
                PromptOff();
            }
        });
    },

    changeDepartment: function ()
    {
        var url = path + "/s/changeDepartment.action";
        var params = {};
        params["teamDepartmentId"] = qm_customerJS.departmentId;
        params["userId"] = qm_customerJS.userId;

        myjs.ajax_post(url, params, function (data)
        {
            if (data.state > 0)
            {
                qm_customerJS.findDepartmentInfo(qm_customerJS.departmentId);
                PromptOff();
            }
        });
    },

    findCompanyInfo: function (cid)
    {
        var url = path + "/s/findCompanyInfo.action";
        var params = {"myTeamId": cid};

        myjs.ajax_post(url, params, function (data)
        {
            data = data.result;

            $("#companyName_text").val(data["myTeamName"]);
            $("#companyPrincipalName_text").val(data["userName"]);
            $("#companyPrincipalPhone_text").val(data["userPhone"]);
            $("#companyAddress_text").val(data["myTeamArea"] + data["myTeamAddress"]);
            $("#companyCreateDate_text").val(new Date(data["myTeamCreateDate"]).format("yyyy-mm-dd"));

            qm_customerJS.findCDepartmentList(cid);
        });
        qm_customerJS.switchTab("Company");
    },

    findCDepartmentList: function (cid)
    {
        var url = path + "/s/findCDepartmentList.action";
        var params = {"myTeamId": cid};

        myjs.ajax_post(url, params, function (data)
        {
            var departmentList = myjs.replaceNull(data.result);
            var item = "";
            for (var i = 0; i < departmentList.length; i++)
                item += '<tr>' +
                    '<td>' + departmentList[i]["teamDepartmentName"] + '</td>' +
                    '<td>' + departmentList[i]["userName"] + '</td>' +
                    '<td>' + departmentList[i]["userPhone"] + '</td>' +
                    '<td>' + departmentList[i]["count"] + '</td>' +
                    '<td>' +
                    '<a onclick="qm_customerJS.findDepartmentInfo(\'' + departmentList[i]["teamDepartmentId"] + '\')" href="###">详细信息</a>' +
                    '</td>' +
                    '</tr>';
            $("#department-list").empty();
            $("#department-list").append(item);
        });
    },

    findDepartmentMemberInfo: function (uid)
    {
        var url = path + "/s/findDepartmentMemberInfo.action";
        var params = {};
        params["userId"] = uid;

        myjs.ajax_post(url, params, function (data)
        {
            $("#personalName_text").val(data["userName"]);
            $("#personalBirthday_text").val(new Date(data["userBirthday"]).format("yyyy-mm-dd"));
            $("#personalAge_text").val(data[""]);
            $("#belongCompany_text").val(data["companyName"]);
            $("#belongDepartment_text").val(data["departmentName"]);
            $("#personalPosition_text").val(parseInt(data["roleId"]) > qm_customerJS.role.person ? "负责人" : "人员");
            $("#personalPhone_text").val(data["userPhone"]);
            $("#personalAddress_text").val(data["userArea"] + "/" + data["userAddress"]);
        });
    }
};


$(function ()
{
    $(".qm-team input").attr("disabled", "true");
    $(".databut").css("display", "none");
    var startDate = new Date();
    var endDate = new Date();
    var $alert = $('#my-alert');
    $('#my-startDate').datepicker().on('changeDate.datepicker.amui', function (event)
    {
        if (event.date.valueOf() > endDate.valueOf())
        {
            $alert.text('开始日期应小于结束日期！').show();
        } else
        {
            $alert.hide();
            startDate = new Date(event.date);
        }
        $(this).datepicker('close');
    });

    $('#my-endDate').datepicker().on('changeDate.datepicker.amui', function (event)
    {
        if (event.date.valueOf() < startDate.valueOf())
        {
            $alert.text('结束日期应大于开始日期！').show();
        } else
        {
            $alert.hide();
            endDate = new Date(event.date);
        }
        $(this).datepicker('close');
    });


    $(document).bind('click', function ()
    {
//		$("#my-alert").css('display', 'none');
        $("#popone").css("display", "none")
    });

    $('#showtime').datepicker().on('changeDate.datepicker.amui', function (event)
    {
        $('#myTeamCreateDate').val($('#showtime').data('date'));

    });
});


num = function (item)
{
    var $IputVal = $(item).val();
    $IputVal.replace(/[^\d|A-Za-z|e]/g, '');
    $(item).keyup(function (e)
    {
        if (e.keyCode == 69 || e.keyCode == 101 || e.keyCode == 189 || e.keyCode == 109)
        {
            $(item).val("");
            return false;
        }
    });
};

var beforeValue;
var selItem;
beforePromptSel = function (item)
{
    selItem = item;
    beforeValue = $(item).val();
};

PromptSel = function (type, item)
{//提示框
    qm_customerJS.optionType = type;
    if (type == qm_customerJS.types.department)
    {
        qm_customerJS.departmentId = $(item).val();
        qm_customerJS.userId = $(item).attr("user-id");
    } else
    {
        qm_customerJS.roleId = $(item).val();
        qm_customerJS.userId = $(item).attr("user-id");
    }
    $("#Prompt-box").css("display", "block");
    $("#Prompt").css("display", "block");
};

PromptCancel = function ()
{
    $(selItem).find("option").removeAttr("selected");
    $(selItem).find("option[value='" + beforeValue + "']").attr("selected", "selected");
    PromptOff();
};

PromptOff = function ()
{
    $("#Prompt-box").css("display", "none");
    $("#Prompt").css("display", "none");
};

