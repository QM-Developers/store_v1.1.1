/**
 * Created by Administrator on 2017/9/21.
 */
var qm_applytransfer = {
    inint: function ()
    {
        qm_applytransfer.getObj();
        qm_applytransfer.getName();
        console.log('111111')
    },
    getName: function ()
    {
        //获取客户名字
        console.log('11111')
        var url = path + '/s/getCustomer.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;
            var data = data.result;
            console.log(data,'名字')
            if (state == '1')
            {
                $('#customerName').html(data.userName)
            }
        })
    },
    getObj: function ()
    {
        //移交对象
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
                $('#promoterBranch').empty().append($option)
                qm_applytransfer.getObjChlid(data[0].teamDepartmentId)
            }

        })
    },
    getObjChlid: function (thisval)
    {
        var url = path + "/s/findDepartmentMember.action";
        var params = {};
        params["teamDepartmentId"] = thisval;
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var data = data.result;
            var item = "";
            for (var i = 0; i < data.length; i++)
                item += '<option value="' + data[i]["memberId"] + '" >' + data[i]["userName"] + '</option>';
            $("#promoter").empty().append(item);

        });
    },
    submitBut: function ()
    {

            var titletext = '提示';
            var conttext = '是否要移交该客户';
            var leftbuttext = '是';
            var fnleft = 'qm_applytransfer.submitApply()';
            var rightbuttext = '否';
            var fnright = 'indenxlogin.ErrorpopRemove(this)'
            indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)

    },
    submitApply: function ()
    {
        var url = path + '/s/updateCustomerToPromoter.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        params['promoterId'] = $('#promoterBranch').val().trim();

        console.log(params, '提交数据')
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                location.href = "qm-customerlist.jsp?cListGo=1";
            }
        })
    },
}