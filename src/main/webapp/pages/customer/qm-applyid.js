var qm_applyid = {
    inint: function ()
    {
        console.log(urlParams)
        var urlType = urlParams.split('=')[0];
        if (urlType == 'jzDetails')
        {
            //查看建账
            $('#dispose').css('display','block');
            $('.div-box-2').css('border','1px solid #ccc');
            $('#submitBut').remove();
            $('#disagree').remove();
            $('#consent').remove();
            qm_applyid.getApplyDetails();
        }else if (urlType == 'accountApprove'){
            //审批建账
            $.cookie('accountApprove',urlParams);

            $('#dispose').css('display','block');
            $('.div-box-2').css('border','1px solid #ccc');
            $('#submitBut').remove();
            $('#div-box-view').css('display','block');
            qm_applyid.getApplyDetails();
        }else if(urlType == 'viewDetailsback'){
            if ($.cookie('accountApprove')!=null){
                urlParams = $.cookie('accountApprove');
                $('#dispose').css('display','block');
                $('.div-box-2').css('border','1px solid #ccc');
                $('#div-box-view').css('display','block');
                $('#submitBut').remove();
                qm_applyid.getApplyDetails();
            }
        } else
        {
            //申请建账
            $('.del-but').css('display','block')
            $('#applyPerson').text($('#userName', parent.document).text());
            qm_applyid.getuser();
            qm_applyid.getapprove();//获取审批人
            qm_applyid.getBranchMerchandiser();//获取
            $('#dispose').remove();
            $('#disagree').remove();
            $('#consent').remove();

        }

    },
    getuser: function ()
    {
        //获取客户类型
        var url = path + '/s/getCustomer.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '获取客户信息')
            var state = data.state;
            var data = data.result;
            console.log(data.userName)
            if (state == '1')
            {
                $('#userName').text(data.userName).attr('name', data.customerType)
            }

        })
    },

    getapprove: function ()
    {
        //获取审批部门
        var url = path + '/s/listDepartmentAndMember.action';
        var params = {};
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '神笔人')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                var $option = '';
                for (var i = 0; i < data.length; i++)
                {
                    $option += '<option value="' + data[i].teamDepartmentId + '">' + data[i].teamDepartmentName + '</option>';
                }
                $('#accountChecker').empty().append($option)
                qm_applyid.approveMember(data[0].teamDepartmentId)
            }

        })
    },
    approveMember: function (thisval)
    {
        //获取审批部门人员
        var url = path + "/s/listAccountChecker.action";
        var params = {};
        params["departmentId"] = thisval;
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["userId"] + '" >' + data[i]["userName"] + '</option>';
            $("#approveMember").empty().append(item);

        });
    },
    getBranchMerchandiser: function ()
    {
        //获取跟单部门
        var url = path + '/s/listTeamDepartment.action';
        var params = {};
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '神笔人')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                var $option = '';
                for (var i = 0; i < data.length; i++)
                {
                    $option += '<option value="' + data[i].teamDepartmentId + '">' + data[i].teamDepartmentName + '</option>';
                }
                $('#branchMerchandiser').empty().append($option)
                qm_applyid.getdocumentary(data[0].teamDepartmentId)
            }

        })
    },
    getdocumentary: function (thisval)
    {
        //跟单员
        var url = path + '/s/listMerchandiser.action';
        var params = {};
        params['customerType'] = urlParams.split('=')[0];
        params['departmentId'] = thisval;
        console.log(params, '跟单提交')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '跟单员')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                var $option = '';
                for (var i = 0; i < data.length; i++)
                {
                    $option += '<option value="' + data[i].userId + '">' + data[i].userName + '</option>';
                }
                $('#Merchandiser').empty().append($option)
            }
        })
    },
    submitBut: function ()
    {

        if (!myjs.isNull($('#Merchandiser').find('option:selected').text()) && !myjs.isNull($('#approveMember').find('option:selected').text()))
        {
            var titletext = '提示';
            var conttext = '是否提交申请';
            var leftbuttext = '是';
            var fnleft = 'qm_applyid.submitData()';
            var rightbuttext = '否';
            var fnright = 'indenxlogin.removepop()';
            indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
        } else
        {
            var titletext = '提示';
            var conttext = '审批人或跟单员不能为空';
            var fnclick = 'indenxlogin.removepop()';
            var buttext = '是';
            indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext)
        }
    },
    submitData: function ()
    {
        var url = path + '/s/saveCustomerAccount.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        params['customerName'] = $.trim($('#userName').text());
        params['merchandiserId'] = $.trim($('#Merchandiser').val());
        params['merchandiserName'] = $.trim($('#Merchandiser').find('option:selected').text());
        params['checkerId'] = $.trim($('#approveMember').val());
        params['checkerName'] = $.trim($('#approveMember').find('option:selected').text());
        params['requestReason'] = $('#requestReason').val();

        console.log(params, '提交申请')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;

            if (state == '1')
            {
                var titletext = '提示';
                var conttext = '提交成功';
                var fnclick = 'javascript:history.back(-1);';
                var buttext = '是';
                indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext)
            }
        })

    },
    getApplyDetails: function ()
    {
        var url = path + '/s/getCustomerAccount.action';
        var params = {};
        params['requestId'] = urlParams.split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '获取申请建账')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                console.log(data.requestStatus,'qaaaaaaaa')
                if(data.requestStatus =='2'){

                    $('#disagree').remove();
                    $('#consent').remove();
                }
                $('.del-but').css('display','block')
                $('#applyPerson').text(data.proposerName);
                $('#userName').text(data.customerName);
                $('#accountBox').empty().text(data.checkerDepartment);
                $('#approveBox').empty().text(data.checkerName);
                $('#branchBox').empty().text(data.merchandiserDepartment);
                $('#merchandiserBox').empty().text(data.merchandiserName);
                $('#requestReason').attr('disabled', 'disabled').text(data.requestReason);
                $('#viewDetails').attr('href','../clientresource/qm-clientresource.jsp?viewDetails='+data.customerId);
                var $item = '<div class="div-box"><span>' + data.checkerDepartment + data.checkerName + '</span>:<span id="disposeState">' + qm_applyid.statusType(data.requestStatus) + '</span></div>';
                $('#dispose').after($item)

            }
        })
    },
    statusType: function (num)
    {
        //状态
        var text = '';
        switch (num)
        {
            case 1:
                text = '待审批';
                break;
            case 2:
                text = '已通过';
                break;
            case 3:
                text = '已拒绝';
                break;
            default:
                break;
        }
        return text;
    },
    consentApplyBut: function ()
    {
        var titletext = '提示';
        var conttext = '是否通过这个申请';
        var leftbuttext = '是';
        var fnleft = 'qm_applyid.consentApply()';
        var rightbuttext = '否';
        var fnright = ' indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    consentApply: function ()
    {
        //同意申请
        var url = path + '/s/updateCustomerAccountAccept.action';
        var params = {};
        params['requestId'] = urlParams.split('=')[1];

        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '同意')
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                indenxlogin.removepop()
                $('#disposeState').text('已同意');
                $('#disagree').remove();
                $('#consent').remove();
            }
        })
    },
    disagreeApplyBut: function ()
    {
        var titletext = '提示';
        var conttext = '是否要否决这个申请';
        var leftbuttext = '是';
        var fnleft = 'qm_applyid.disagreeApply()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()'
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    disagreeApply: function ()
    {
        //拒绝申请
        var url = path + '/s/updateCustomerAccountRefuse.action';
        var params = {};
        params['requestId'] = urlParams.split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '拒绝')
            var state = data.state;
            var data = data.result;

            if (state == '1')
            {
                indenxlogin.removepop();
                $('#disposeState').text('已拒绝');
                $('#disagree').remove();
                $('#consent').remove();

            }
        })
    },
    goBack:function ()
    {
        switch (urlParams.split('=')[0]){
            case 'accountApprove':
                location.href='../approve/qm-accountApprove.jsp?details=1';
                break;
            default:
                location.href='qm-customerdata.jsp?cDataGO=1';
                break;
        }
    },

}