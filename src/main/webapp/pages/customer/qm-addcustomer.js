/**
 * Created by Administrator on 2017/8/21.
 */
var qm_addcutomer = {

    adddata: function ()
    {
        // var inputval = $('input');
        // var inpNum =0;
        // inputval.each(function ()
        // {
        //        if (myjs.isNull($(this).val())){
        //            inpNum +=1;
        //        }
        // })
        // if (inpNum == '0'){
        //     var titletext = '提示';
        //     var conttext = '是否建立客户档案';
        //     var leftbuttext = '是';
        //     var fnleft = 'qm_addcutomer.addCustomer()';
        //     var rightbuttext = '否';
        //     var fnright = 'indenxlogin.ErrorpopRemove(this)'
        //     indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
        // }else {
        //    $(this).css('border-color','red')
        // }

        var $reg = /^[\u4E00-\u9FA5]{2,20}$/;
        var $phonetreaty = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if ($reg.test($('#userName').val()) && $phonetreaty.test($('#userPhone').val()) && !myjs.isNull($('#userBirthday').val()))
        {
            console.log('111')
            var conttext = '是否建立客户档案';
            var fnleft = 'qm_addcutomer.addCustomer()';
            var fnright = 'indenxlogin.ErrorpopRemove(this)';
            indenxlogin.Errorpoptwo('提示', conttext, '是', fnleft, '否', fnright)
        } else
        {
            var conttext = '请完整填写正确信息';
            var fnclick = 'indenxlogin.removepop()'
            indenxlogin.Errorpopone('提示', conttext, fnclick, '确定')
        }


    },
    addCustomer: function ()
    {
        var userName = $.trim($('#userName').val());
        var userPhone = $.trim($('#userPhone').val());
        var userBirthday = $.trim($('#userBirthday').val())
        var userAddress = $.trim($('#userAddress').val())
        var userSex = $.trim($('#userSex').find('.sex-checked').text());
        var creditRating = $.trim($("#creditRating").val());
        var customerType = $.trim($("#customerType").val());
        var url = path + "/s/saveCustomerRecord.action";
        console.log(url)
        var params = {};
        params["userName"] = userName;
        params["userPhone"] = userPhone;
        params["userBirthday"] = userBirthday;
        params["userAddress"] = userAddress;
        params["userSex"] = userSex;
        params["creditRating"] = creditRating;
        params["customerType"] = customerType;
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            if (state == '1')
            {
                location.href = 'qm-customerlist.jsp?client=1';
            }
        })
    },
    PopInput: function (item)
    {
        $(item).addClass("sex-checked").siblings().removeClass("sex-checked")
    }
};