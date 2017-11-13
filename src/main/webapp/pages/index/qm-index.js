var qm_index = {
    sign_login: '',
    inint: function ()
    {

        console.log(urlParams)
        if ($.cookie('logindata') != null)
        {
            cookiedata = JSON.parse($.cookie('logindata'));
            console.log(cookiedata, '读取');
            $('#loginText').text(cookiedata.myTeamName)
            if ($.cookie('permissiondata') != null)
            {
                var typeData = JSON.parse($.cookie('permissiondata'));
                $('#li-name').append('<span class="user-name" id="userName" name="'+cookiedata.userId+'">' + typeData.userName + '</span><span class="position-name" id="positionName" name=' + typeData.positionName + '>(' + typeData.text + ')</span>');
                qm_index.getData();
                qm_index.sign_login = typeData.positionName;

            } else
            {
                var urltype = urlParams.split('=')[1];
                console.log(urltype)
                switch (urltype)
                {
                    case '1002':
                        qm_index.sign_login = '1002';
                        $('#li-name').append('<span class="user-name" id="userName" name="'+cookiedata.userId+'">' + cookiedata.userName + '</span><span class="position-name" id="positionName" name="1002">(管理员)</span>');
                        $('.untreated-2,.untreated-3,.untreated-4,.untreated-5').remove();
                        $('.work-2,.work-3,.work-5,.work-6,.work-7,.work-8,work-9').remove();
                        $('.work-4-2,.work-4-4').remove();
                        $('.work-8-1,.work-8-2,.work-8-5').remove();
                        break;
                    case '1003':

                        qm_index.getData();
                        break;
                }
            }
        }
        $(".am-panel").click(function ()
        {
            $(".am-panel>.active").removeClass("active")
            $(this).addClass("active");
        });

        $('.panel-a').click(function ()
        {
            var $ul = $(this).next('ul');
            $('.am-panel').find('ul').slideUp();
            $('.am-panel').find('.am-margin-right').removeClass("am-icon-angle-double-down").addClass("am-icon-angle-double-right")
            if ($ul.is(':visible'))
            {
                $(this).find('.am-margin-right').removeClass("am-icon-angle-double-down").addClass("am-icon-angle-double-right")
                $(this).next('ul').slideUp();
            } else
            {
                $(this).find('.am-margin-right').removeClass("am-icon-angle-double-right").addClass("am-icon-angle-double-down")
                $(this).next('ul').slideDown();
            }
        });
        //二级菜单导航切换
        $(".menu_grandson li").click(function ()
        {
            $(".menu_grandson li.active").removeClass("active")
            $(this).addClass("active");
        });

        $('.menu-lia').click(function ()
        {
            var $ul = $(this).next('ul');
            $('.fristul').find('ul').slideUp();
            $('.fristul').find('.am-margin-right').removeClass("am-icon-angle-double-down").addClass("am-icon-angle-double-right")
            if ($ul.is(':visible'))
            {
                $(this).find('.am-margin-right').removeClass("am-icon-angle-double-down").addClass("am-icon-angle-double-right")
                $(this).next('ul').slideUp();
            } else
            {
                $(this).find('.am-margin-right').removeClass("am-icon-angle-double-right").addClass("am-icon-angle-double-down")
                $(this).next('ul').slideDown();
            }
        });
    },

    getData: function ()
    {
        var url = path + '/user_listPermissionModel.action';
        var params = {};
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '登录返回')
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                var $li = '';
                for (var i = 0; i < data.length; i++)
                {
                    $li += '<li class="menu-li">' +
                        '<a class="am-cf menu-li-a" name="' + data[i].permissionType + '" onclick="qm_index.liSelect(this)">' + qm_index.getpermissionType(data[i].permissionType) + '</a>' +
                        '</li>';
                }
                $('#user-nav0').append($li);
                if ($.cookie('permissiondata') == null)
                {
                    $('#li-name').append('<span class="user-name" id="userName" name="'+cookiedata.userId+'">' + cookiedata.userName + '</span><span class="position-name" id="positionName" name=' + $("#user-nav0 li:first-child").find('a').attr("name") + '>(' + $("#user-nav0 li:first-child").text() + ')</span>');
                    var signName = $("#li-name").find('.position-name').attr('name');
                    console.log(signName)
                    qm_index.sign_login = signName;
                    console.log(qm_index.sign_login, '生成')
                }
                qm_index.showStyle();
            }
        })
    },
    liSelect: function (item)
    {
        var permissiondata = {
            'text': $(item).text().trim(),
            'userName': $(item).parents('#user-nav0').prev().find('.user-name').text(),
            'positionName': $(item).attr('name')
        };
        $.cookie('permissiondata', JSON.stringify(permissiondata))
        location.href = "qm-index.jsp?login=" + cookiedata.roleId;
        console.log(qm_index.sign_login, 'biaoji')
    },
    getpermissionType: function (data)
    {
        var returndata = '';
        switch (data)
        {
            case 'salesman'://业务员
                returndata = '业务员';
                break;
            case 'salesman_manager'://业务主管
                returndata = '业务主管';
                break;
            case 'finance'://财务员
                returndata = '财务员';
                break;
            case 'finance_manager'://财务主管
                returndata = '财务主管';
                break;
            case 'logistics'://后勤人员
                returndata = '后勤人员';
                break;
            case 'logistics_manager'://后勤主管
                returndata = '后勤主管';
                break;
            case 'follower'://跟单员
                returndata = '跟单员';

                break;
            default:
                break;
        }
        // qm_index.showStyle();
        return returndata;
    },

    showStyle: function ()
    {
        var data = qm_index.sign_login;
        console.log(data, '删除')
        switch (data)
        {
            case 'salesman'://业务员
                $('.untreated-2,.untreated-3,.untreated-4,.untreated-5').remove();
                $('.work-1,.work-5,.work-7,.work-9').remove();
                $('.work-4-4').remove();
                $('.work-8-1,.work-8-2,.work-8-5').remove();
                break;
            case 'salesman_manager'://业务主管
                $('.untreated-3,.untreated-4,.untreated-5').remove();
                $('.work-1,.work-2,.work-3,.work-5,.work-7').remove();
                $('.work-4-2').remove();
                $('.work-8-1,.work-8-2,.work-8-5').remove();
                break;
            case 'finance'://财务员
                $('.untreated-2,.untreated-3,.untreated-4,.untreated-5').remove();
                $('.work-1,.work-2,.work-3,.work-5,.work-6,.work-9').remove();
                $('.work-4-2,.work-4-4').remove();
                $('.work-8-5').remove();
                break;
            case 'finance_manager'://财务主管
                $('.untreated-2,.untreated-3,.untreated-4').remove();
                $('.work-1,.work-2,.work-3,.work-5,.work-6,.work-9').remove();
                $('.work-4-2,.work-4-4').remove();
                $('.work-8-5').remove();
                break;
            case 'logistics'://后勤人员
                $('.untreated-2,.untreated-3,.untreated-4,.untreated-5').remove();
                $('.work-1,.work-2,.work-3,.work-6,.work-7,.work-9').remove();
                $('.work-4-2,.work-4-4').remove();
                $('.work-8-5').remove();

                break;
            case 'logistics_manager'://后勤主管
                $('.untreated-2,.untreated-4,.untreated-5').remove();
                $('.work-1,.work-2,.work-3,.work-5,.work-6,.work-7,.work-9').remove();
                $('.work-4-2,.work-4-4').remove();
                $('.work-8-4').remove();
                break;
            case 'follower'://跟单员
                $('.untreated-2,.untreated-3,.untreated-5').remove();
                $('.work-1,.work-2,.work-3,.work-5,.work-7,.work-8,.work-9').remove();
                $('.work-4-2,.work-4-4').remove();
                break;
            default:
                break;
        }
        qm_index.skipBranchWarehouse();
    },
    skipBranchWarehouse: function ()
    {
        var skip = $('#positionName').attr('name');
        if (skip == 'salesman' || skip == 'salesman_manager')
        {
            $('#skipBranch').attr('href', path+'/pages/repertory/qm-warehouse.jsp?single=1')
        } else
        {
            $('#skipBranch').attr('href', path+'/pages/repertory/qm-branchwarehouse.jsp')
        }
    },
    toManage: function ()
    {
        window.open(path + "/qm-sys-login.jsp");
    },
    exitSystem:function ()
    {
        var url = path +'/logoutOnBrowser.action';
        var params ={};
        myjs.ajax_post(url,params,function (data)
        {
            var state = data.state;
            if(state =='1'){
                top.location.href = "../index/qm-indexLogin.jsp";
            }
        })
    },
};

var status = 1;
function getStyleAttr(obj, attr)
{
    //最终样式
    var styleObj = obj.currentStyle || getComputedStyle(obj, null);
    return styleObj[attr];
}

function switchSysBar(item)
{

    var switchPoint = document.getElementById("switchPoint");//获取小按钮
    var frmTitle = document.getElementById("frmTitle");//获取iframe
    if (1 == window.status)
    {
        window.status = 0;
        frmTitle.style.display = "none"
    } else
    {
        window.status = 1;
        frmTitle.style.display = ""
    }
}
function iFrameHeight()
{

    var ifm = document.getElementById("iframepage");
    var subWeb = document.frames ? document.frames["iframepage"].document :
        ifm.contentDocument;
    if (ifm != null && subWeb != null)
    {
        ifm.height = subWeb.body.scrollHeight;
    }
}


Menu = function ()
{
    $(".client").css("display", "block")
}



