/**
 * Created by Administrator on 2017/7/28.
 */

var indenxlogin = {
    usename_val: false,//手机号
    myteamid_val: false,//企业号
    password_val: false,//密码
    RepetiPsw_val: false,//密码二次
    verify_val: false,//验证码
    chinese_name: false,//名字
    enterprise_name: false,//企业名称
    Verifytime: 60,//倒计时


    IndexContSkip: function (item)
    {
//切换内容
        var $ContSkipname = $(item).attr('id');
        switch ($ContSkipname)
        {
            case("forgetpassword"):
                $('.opacity-box').load(path +'/pages/register/qm-forgetpassword.jsp');
                break;
            case("register"):
                $('.opacity-box').load(path +'/pages/register/qm-register.jsp');
                break;
            case("experience"):
                $('.opacity-box').load(path +'/pages/register/qm-experience.jsp');

                break;
            case("changepassword"):
                $('.opacity-box').load(path +'/pages/register/qm-changepassword.jsp');

                break;
            default:
        }
    },

    IndexSkip: function ()
    {//跳转登录页
        // var self = item;
        location.href = path +"/login.jsp"; //刷回登录界面
        // indenxlogin.ErrorpopRemove(self);
    },

    Errorpopone: function (titletext, conttext, fnclick, buttext)
    {//单按钮提示框
        var popone = '<div class="password-box" >' +
            '<div class="alter-select">' +
            '<div class="pop-title">' + titletext + '</div>' +
            '<div class="pop-frame1">' +
            conttext +
            '</div>' +
            '<div class="pop-frame2 ">' +
            '<div class="pop-frame-right" onclick=' + fnclick + '>' +
            buttext +
            '</div>' +
            '</div>' +
            '</div>' +
            '</div>';
        $('.opacity-box').append(popone);
    },

    Errorpoptwo: function (titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    {//双按钮提示框
        console.log('创建了')
        var poptwo = '<div class="password-box">' +
            '<div class="alter-select">' +
            '<div class="pop-title">' + titletext + '</div>' +
            '<div class="pop-frame1">' +
            conttext +
            '</div>' +
            '<div class="pop-frame2 pop-frame2-but">' +
            '<div class="pop-frame-right" onclick=' + fnleft + '>' +
            leftbuttext +
            '</div>' +
            '<div class="pop-frame-right" id="changepassword" onclick=' + fnright + '>' +
            rightbuttext +
            '</div>' +
            '</div>' +
            '</div>' +
            '</div>';
        $('.opacity-box').append(poptwo);
    },
    removepop: function ()
    {
        //删除弹窗
        $('.password-box').remove();
    },
    ErrorpopRemove: function (item)
    {//删除提示框
        $(item).parents('.password-box').remove();
    },
    //input数字验证
    inputVal:function (item)
    {
        var thisval= $(item).val();
        thisval.replace(/\D/g,'')
        $(item).val(thisval.replace(/\D/g,''))
    },



    //login
    phonenum: function (item)
    {//手机号验证
        var $phonetreaty = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        var $Inval = $(item).val();
        if ($Inval == '')
        {
            $(item).css('border', '1px solid #ccc').next().text('');
            indenxlogin.usename_val = false;

        } else if ($phonetreaty.test($Inval))
        {
            $(item).css('border', '1px solid #ccc').next().text('').css("color", '#000000');
            indenxlogin.usename_val = true;
        } else
        {
            $(item).css('border', '1px solid red').next().text('请输入手机号码！').css("color", 'red');
            indenxlogin.usename_val = false;
        }
    },

    MyTeamId: function (item)
    {//企业号验证
        var $Enterprisenum = /^[0-9a-zA-Z]{5}$/;
        var $Enterprise = $(item).val()
        if ($Enterprise.length != 5)
        {
            $(item).css('border', '1px solid red').next().text('请输入5位有效企业码').css("color", 'red');
            indenxlogin.myteamid_val = false;
        } else if ($Enterprisenum.test($Enterprise))
        {
            $(item).css('border', '1px solid #ccc').next().text('').css("color", '#61d01c');
            indenxlogin.myteamid_val = true;
        } else
        {
            $(item).css('border', '1px solid red').next().text('请输入5位有效企业码').css("color", 'red');
            indenxlogin.myteamid_val = false;
        }
    },

    PassWordNum: function (item)
    {//psw验证
        var $RegisterPsw = /^[a-zA-Z0-9]{6,32}$/;
        var $Register = $(item).val();
        if ($Register == '')
        {
            $(item).css('border', '1px solid #ccc').next().text('建议设置6到32位数字字母组合').css("color", '#CCCCCC');
            indenxlogin.password_val = false;
        } else if ($RegisterPsw.test($Register))
        {
            $(item).css('border', '1px solid #ccc').next().text('').css("color", '#000000');
            indenxlogin.password_val = true;
        } else
        {
            $(item).css('border', '1px solid red').next().text('密码为6到32位数字字母组合').css("color", 'red');
            indenxlogin.password_val = false;
        }
    },

    RepetiPsw: function (item)
    {//  验证psw是否相等
        var $ForgetPsw = $(item).val();
        var $prevpsw = $(item).parent('div').prev().find('input').val();
        if ($ForgetPsw != $prevpsw)
        {
            $(item).css('border', '1px solid red').next().text('密码不一致').css('color', 'red');
            indenxlogin.RepetiPsw_val = false;
        } else
        {
            $(item).css('border', '1px solid #ccc').next().text('').css("color", '#000000');
            indenxlogin.RepetiPsw_val = true;
        }
    },

    Verifylenght: function (item)
    {//判断验证码长度
        var $phonetreaty = /^[0-9]{4}$/;
        var $Inval = $(item).val();
        if ($phonetreaty.test($Inval))
        {
            $(item).css('border', '0').next().text('').css("color", '#000000');
            indenxlogin.verify_val = true;
        } else
        {
            $(item).css('border', '1px solid red').next().text('请输入验证码！').css("color", 'red');
            indenxlogin.verify_val = false;
        }
        if ($Inval == '')
        {
            $(item).css('border', '1px solid red').next().text('请输入验证码！');
            indenxlogin.verify_val = false;
        }
    },

    ChineseName: function (item)
    {// 是否为中文姓名
        var $reg = /^[\u4E00-\u9FA5]{2,4}$/;
        var $name = $(item).val();
        if (!$reg.test($name))
        {
            $(item).css('border', '1px solid red').next().text('请输入名字').css("color", 'red');
            indenxlogin.chinese_name = false;
        } else
        {
            $(item).css('border', '1px solid #ccc').next().text('').css("color", '#61d01c');
            indenxlogin.chinese_name = true;
        }
    },

    Designation: function (item)
    {//企业名称
        var $des = /^[\u4E00-\u9FA5]{2,50}$/;
        var $designation = $(item).val();
        if (!$des.test($designation))
        {
            $(item).css('border', '1px solid red').next().text('请输入企业名称').css("color", 'red');
            indenxlogin.enterprise_name = false;
        } else
        {
            $(item).css('border', '1px solid #ccc').next().text('').css("color", '#61d01c');
            indenxlogin.enterprise_name = true;
        }
    },

    VerifyTime: function (item)
    {//倒计时
        if (indenxlogin.Verifytime == 0)
        {
            $(item).attr("disabled", 'disabled').text("获取验证码");
            indenxlogin.Verifytime = 60;
            return;
        } else
        {
            $(item).removeAttr("disabled").text("重新发送(" + indenxlogin.Verifytime + ")");
            indenxlogin.Verifytime--;
        }
        setTimeout(function ()
            {
                indenxlogin.VerifyTime(item)
            }
            , 1000)
    },

    PswType: function (item)
    {//密码显示隐藏
        var $PswType = $(item).attr('class');
        var $Inputtype = $('input[name="pswname"]');
        if ($PswType == "a-bg")
        {
            $Inputtype.attr('type', 'text');
            $(item).removeClass('a-bg').addClass('a-bg1');
        } else
        {
            $Inputtype.attr('type', 'password');
            $(item).removeClass('a-bg1').addClass('a-bg');
        }
    },
    Service: function ()
    { //客服
        var titletext = '客服咨询';
        var conttext = '请拨打电话 ：0750-8883081';
        var fnclick = 'indenxlogin.ErrorpopRemove(this)';
        var buttext = '确定';
        indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
    }

}