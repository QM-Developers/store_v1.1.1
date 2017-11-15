/**
 * Created by Administrator on 2017/8/4.
 */
var loginpost = {

    RegisterUserId: '',
    Forget_ID: '',
    // Register注册

    IndexSubmit: function ()
    {//登录

        var titletext = '提示';
        var fnclick = 'indenxlogin.ErrorpopRemove(this)';
        var buttext = '确定';
        var conttext = '信息错误，请核对信息';
        if (/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test($('#indexphone').val()))
            indenxlogin.usename_val = true;
        if (/^[0-9a-zA-Z]{5}$/.test($('#indexteamnum').val()))
            indenxlogin.myteamid_val = true;
        if (/^[a-zA-Z0-9]{6,32}$/.test($('#indexpsw').val()))
            indenxlogin.password_val = true;

        if (indenxlogin.usename_val && indenxlogin.myteamid_val && indenxlogin.password_val)
        {

            var url = path + "/login_on_browser.action";
            var params = {};
            params["userPhone"] = $('#indexphone').val();
            params["myTeamId"] = $('#indexteamnum').val();
            params["userPassword"] = md5($('#indexpsw').val());
            myjs.ajax_post(url, params, function (data, status)
            {
                var state = data.state;
                var data = data.result;
                if (status)
                {
                    switch (state)
                    {
                        case 1 :
                            console.log(data, '数据')
                                location.href = path + "/pages/index/qm-index.jsp?login=" + data.roleId;
                            break;
                        case 2 :
                            var conttext = '请核对信息';
                            indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
                            break;
                        case 3 :
                            var conttext = '该账号未激活';
                            indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
                            break;
                        case 4 :
                            var conttext = '未找到该账号或企业码';
                            indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
                            break;
                        default:
                    }
                }
            });
        } else
        {
            indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
            return false;
        }
    },


    RegisterGoNext: function (item)
    {
        //下一步
        $(item).parents('.register-cont-box').find('#register1').css('display', 'none').next().css('display', 'block');
        $(item).parents('.register-but1').css('display', 'none').next().css('display', 'block');
    }
    ,
    RegisterGoBack: function (item)
    {
        //返回
        indenxlogin.verify_val = false;
        indenxlogin.password_val = false;
        var $clearval1 = $(item).parents('.register-cont-box').find('#register2');
        var $clearval2 = $clearval1.prev();
        $clearval1.css('display', 'none').find('input').val('');
        $clearval2.css('display', 'block').find('#verify').val('');
        $clearval2.find('button').attr("disabled", false).text("获取验证码");
        indenxlogin.Verifytime = 0;
        $(item).parents('.register-but1').css('display', 'none').prev().css('display', 'block');

    },
    RegisterVerifyPhone: function (item)
    {//获取验证码
        var self = item;
        var url = path + "/registerGetVerify.action";
        var params = {};
        params["userPhone"] = $('#userPhone').val();
        params["myTeamId"] = $('#myTeamId').val();
        if (indenxlogin.usename_val && indenxlogin.myteamid_val)
        {
            $(item).attr('disabled', 'disabled');
            myjs.ajax_post(url, params, function (data, status)
            {
                var titletext = '提示';
                var fnclick = 'indenxlogin.ErrorpopRemove(this)';//删除提示框
                var buttext = '确定';
                var fngo = 'indenxlogin.IndexSkip(this)';//跳转
                var onebuttext = '直接登录';
                var state = data.state;
                switch (state)
                {
                    case 1 :
                        indenxlogin.VerifyTime(self);
                        break;
                    case 2 :
                        var conttext = '验证码发送失败';
                        $(item).removeAttr('disabled');
                        indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
                        break;
                    case 3 :
                        var conttext = '账号未建档,请核对信息';
                        $(item).removeAttr('disabled');
                        indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
                        break;
                    case 4 :
                        var conttext = '账号已激活';
                        $(item).removeAttr('disabled');
                        indenxlogin.Errorpopone(titletext, conttext, fngo, onebuttext);
                        break;
                    default:
                }
            });
        } else
        {
            return;
        }
    },
    RegisterNextStep: function (item)
    { //       下一步
        var self = item;
        console.log('321');
        var titletext = '提示';
        var conttext = '信息错误，请核对信息';
        var fnclick = 'indenxlogin.ErrorpopRemove(this)';
        var buttext = '确定';
        if (indenxlogin.usename_val && indenxlogin.myteamid_val && indenxlogin.verify_val)
        {
            var url = path + "/registerVerify.action";
            var params = {};
            console.log('1213')
            params["verify"] = $('#verify').val();
            params["userPhone"] = $('#userPhone').val();
            params["myTeamId"] = $('#myTeamId').val();
            myjs.ajax_post(url, params, function (data, status)
            {
                if (status == 'success')
                {
                    var state = data.state;
                    var data = data.result;
                    if (state == 1)
                    {
                        $('#RegisteruserName').val(data.userName);
                        $('#resultuserPhone').val(data.userPhone);
                        var userId = data.userId;
                        loginpost.RegisterGoNext(self);
                        loginpost.RegisterUserId = userId;
                    } else
                    {
                        indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
                        return false;
                    }
                }
            })
        } else
        {
            indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
            return false;
        }

    },
    RegisterSubmit: function ()
    {

        var titletext = '提示';
        var conttext = '信息错误，请核对信息';
        var fnclick = 'indenxlogin.ErrorpopRemove(this)';
        var buttext = '确定';
        var fngo = 'indenxlogin.IndexSkip(this)';

        if (indenxlogin.password_val && indenxlogin.RepetiPsw_val)
        {

            var url = path + "/register.action";
            var params = {};
            params["userId"] = loginpost.RegisterUserId;
            params["userPassword"] = md5($('#userPassword').val());
            myjs.ajax_post(url, params, function (data, status)
            {

                if (status == "success")
                {
                    var state = data.state;
                    if (state == 1)
                    {
                        var oneconttext = '激活成功';
                        indenxlogin.Errorpopone(titletext, oneconttext, fngo, buttext);
                    }
                }
            })
        } else
        {
            indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
            return false;
        }
    },
//    var userId = "48712ee959b24af69d5ede3d941f572e";
    ForgetGoNext: function (item)
    {
        //下一步
        $(item).parents('.forgetpassword-cont-box').find('#forgetpassword1').css('display', 'none').next().css('display', 'block');
        $(item).parents('.forgetpassword-but1').css('display', 'none').next().css('display', 'block');
    },
    ForgetGoBack: function (item)
    {
        //返回重置清空一些值
        indenxlogin.verify_val = false;
        indenxlogin.password_val = false;
        var $goback1 = $(item).parents('.forgetpassword-cont-box').find('#forgetpassword2');
        var $goback2 = $goback1.prev();
        $goback1.css('display', 'none').find('input').val('');
        $goback2.css('display', 'block').find('#ForgetVerify').val('');//验证码清空
        $goback2.find('button').attr("disabled", false).text("获取验证码");
        indenxlogin.Verifytime = 0;
        $(item).parents('.forgetpassword-but1').css('display', 'none').prev().css('display', 'block');
        $('#Pswtype').removeClass('a-bg1').addClass('a-bg');//重置显示按钮
    },

    ForgetVerifyPhone: function (item)
    {//获取验证码
        var self = item;
        var titletext = '提示';
        var fnclick = 'indenxlogin.ErrorpopRemove(this)';
        var buttext = '确定';
        if (indenxlogin.usename_val && indenxlogin.myteamid_val)
        {
            $(item).attr('disabled', 'disabled');
            var url = path + "/retrieveGetPasswordVerify.action";
            var params = {};
            params["userPhone"] = $('#Forgetphone').val();
            params["myTeamId"] = $('#Forgetmyteam').val();
            myjs.ajax_post(url, params, function (data, status)
            {
                var state = data.state;
                switch (state)
                {
                    case 1:
                        indenxlogin.VerifyTime(self);
                        break;
                    case 2:
                        var conttext = '信息发送失败';
                        $(item).removeAttr('disabled');
                        indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
                        break;
                    case 3:
                        var conttext = '未找到该用户，请核对信息';
                        $(item).removeAttr('disabled');

                        indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
                        break;
                    default:
                }
            });
        } else
        {
            var errortext = '请填写信息';
            indenxlogin.Errorpopone(titletext, errortext, fnclick, buttext);
            return;
        }
    },
    ForgetNextStep: function (item)
    { //点击下一步
        var self = item;
        if (indenxlogin.usename_val && indenxlogin.myteamid_val && indenxlogin.verify_val)
        {
            var url = path + "/retrievePasswordVerify.action";
            var params = {};
            params["userPhone"] = $('#Forgetphone').val();
            params["myTeamId"] = $('#Forgetmyteam').val();
            params["verify"] = $('#ForgetVerify').val();
            myjs.ajax_post(url, params, function (data, status)
            {
                if (status == 'success')
                {
                    var state = data.state;
                    if (state == 1)
                    {
                        var data = data.result;
                        var userId = data.userId;
                        loginpost.ForgetGoNext(self);
                        loginpost.Forget_ID = userId;
                    }
                } else
                {
                    return false;
                }
            })
        } else
        {
            return false;
        }
    },

    ForgetSubmit: function ()
    { //提交修改

        var titletext = '提示';
        var fnclick = 'indenxlogin.IndexSkip(this)';
        var buttext = '确定';
        if (indenxlogin.password_val && indenxlogin.RepetiPsw_val)
        {
            var url = path + "/updatePassword.action";
            var params = {};
            params["userId"] = loginpost.Forget_ID;
            params["myTeamId"] = $('#Forgetmyteam').val();
            params["userPassword"] = md5($('#setpassword').val());
            myjs.ajax_post(url, params, function (data, status)
            {
                if (status == "success")
                {
                    var state = data.state;
                    if (state == 1)
                    {
                        var conttext = '密码修改成功';
                        indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
                    }
                } else
                {
                    return false;
                }
            })
        } else
        {
            return false;
        }
    },

    ExperienceSubmit: function (item)
    {

        var titletext = '提示';
        var buttext = '确定';
        var fnremove = 'indenxlogin.ErrorpopRemove(this)';
        var fnclick = 'indenxlogin.IndexSkip(this)';

        if (indenxlogin.enterprise_name && indenxlogin.chinese_name && indenxlogin.usename_val)
        {
            var url = path + "/registerExperience.action";
            var params = {};
            params["company"] = $('#company').val();
            params["contacts"] = $('#contacts').val();
            params["position"] = $('#position').val();
            params["phone"] = $('#phone').val();
            myjs.ajax_post(url, params, function (data, status)
            {
                if (status)
                {
                    var state = data.state;
                    if (state == 1)
                        var conttext = '您的信息已提交，我们会在12小时内给您回访，请稍等！';
                    indenxlogin.Errorpopone(titletext, conttext, fnclick, buttext);
                }
            });
        } else
        {
            var errortext = '请填写信息';
            indenxlogin.Errorpopone(titletext, errortext, fnremove, buttext);
            return false;
        }
    }
}