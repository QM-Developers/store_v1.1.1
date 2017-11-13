/**
 * Created by Administrator on 2017/11/2.
 */
var qm_myData = {
    psw_1: false,
    front: null,
    inint: function ()
    {
        qm_myData.initWebUpload();
        qm_myData.getPersonageData();
    },
    getPersonageData: function ()
    {
        var url = path + '/user_findMyInfo.action';
        var params = {};
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, 'geren')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#userName').text(data.userName);
                $('#userSex').text(data.userSex);
                $('#userPhone').text(data.userPhone);
                $('#myTeamPhone').text(data.userPhone);
                $('#userAddress').text(data.userAddress);
                $('#userIdentity').text(data.userIdentity);
                $('#myTeamName').text(data.myTeamName);
                $('#teamDepartmentName').text(data.teamDepartmentName);
                $('#positionName').text(data.positionName);
                $('#myTeamId').text(data.myTeamId);
                $('#userImg').attr('src', path + data.userImg);

            }
        })
    },

    initWebUpload: function ()
    {
        console.log('11111111')
        var site = {
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: path + '/script/script/webuploader-0.1.5/Uploader.swf',
            // 文件接收服务端。
            server: path + '/user_uploadHeadPortrait.action',
            threads: 1, // 上传并发数
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#uploadingBut',
            fileVal: 'img',
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        };
        qm_myData.front = WebUploader.create(site);

        console.log('2222')
        function operation(element, id)
        {
            element.on('fileQueued', function (file)
            {
                console.log('aaaaa')
                var $li = $('<div><a class=img-a><img id="image" src=""/></a></div>'),
                    $img = $li.find('img');
                // $list为容器jQuery实例
                $('#uploadingImg').empty().append($li);

                element.makeThumb(file, function (error, src)
                {
                    if (error)
                    {
                        $img.replaceWith('<span>不能预览</span>');
                        return;
                    }
                    $img.attr('src', src);
                });
            });
            // 文件上传过程中创建进度条实时显示。
            element.on('uploadProgress', function (file, percentage)
            {
                // var $li = $('#' + file.id),
                //     $percent = $li.find('.webuploader-pick');
                // // 避免重复创建
                // if (!$percent.length)
                // {
                //     $percent = $('<div class="am-progress add-progress am-progress-striped">' +
                //         '<div class="am-progress-bar am-progress-bar-secondary" style="width: 30%"></div>' +
                //         '</div>').appendTo($li).find('.webuploader-pick');
                // }
                // $percent.css('width', percentage * 100 + '%');
                var $li = $('#uploadingImg'),
                    $percent = $li.find('.progress span');

                // 避免重复创建
                if (!$percent.length)
                {
                    $percent = $('<p class="progress"><span></span></p>')
                        .appendTo($li)
                        .find('span');
                }

                $percent.css('width', percentage * 100 + '%');
            });
            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            element.on('uploadSuccess', function (file, data)
            {
                var $li = $('#' + file.id),
                    $percent = $li.find('.upload-progress');
                if ($percent.length)
                    $percent.remove();
                $li.append();
                qm_myData.getImgUrl(data);
                console.log(data)
            });
            // 文件上传失败，显示上传出错。
            element.on('uploadError', function (file)
            {
                var $li = $('#' + file.id),
                    $percent = $li.find('.upload-progress');
                if ($percent.length)
                    $percent.remove();
                $percent = $('<div class="upload-progress" style="color: red;width: 65px">上传失败</div>').appendTo($li);
            });
            // 完成上传完了，成功或者失败，先删除进度条。
            element.on('uploadComplete', function (file)
            {

            });
        }

        console.log('333')
        operation(qm_myData.front, $('#uploadingBut'))
    },
    getImgUrl: function (urldata)
    {
        console.log(urldata);
        $('#userImg').attr('src', path + urldata.result)

    },
    imgShow: function ()
    {
        //上传框显示
        $('#headimg').css('display', 'block');
    },
    imgHidden: function ()
    {
        //上传框隐藏
        $('#headimg').css('display', 'none');
    },
    pswShow: function ()
    {

        $('#alterwindow').css('display', 'block'); //密码弹窗
    },
    // putPassword: function ()
    // {
    //     $('#alterselect').css('display', 'block');
    // },
    windowHidde: function ()
    {
        $('#alterwindow').css('display', 'none').find('input').val('');
        $('#alterselect').css('display', 'none');
        $('.am-radio a').removeClass('a-bg1').addClass('a-bg');
        $('.password-mark').find('input').attr('type', 'password');
        //确定之后隐藏#alterwindow 清除input 重置
    },
    hideShowPsw: function (item)
    {
        var $InputType = $(item).parents('.alter-window').find('.password-mark').find('input');
        if ($InputType.attr('type') == "password")
        {
            console.log('111')
            $InputType.attr('type', 'text');
            $(item).removeClass('a-bg').addClass('a-bg1')
        } else
        {
            console.log('222')
            $InputType.attr('type', 'password');
            $(item).removeClass('a-bg1').addClass('a-bg')
        }
    },
    pswVerify: function (item)
    {
        var url = path + '/verifyPassword.action';
        var params = {};
        params['userPassword'] = md5($(item).val());
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                qm_myData.psw_1 = true;
                $('#psw-1').text('密码正确');
            }else {
                qm_myData.psw_1 = false;
                $('#psw-1').text('密码错误');
            }
        })
    },
    replacePswBut:function ()
    {
        $('#alterwindow').css('display', 'none');
        var titletext = '提示';
        var conttext = '是否提交';
        var leftbuttext = '是';
        var fnleft = 'qm_myData.replacePsw()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)

    },
    replacePsw: function ()
    {
        //修改
        if (qm_myData.psw_1 = true && indenxlogin.password_val == true && indenxlogin.RepetiPsw_val == true)
        {
            var url = path + '/updatePassword.action';
            var params = {};
            params['userPassword'] = md5($('#userPsw').val());
            console.log(params,'密码')
            myjs.ajax_post(url, params, function (data)
            {
                console.log(data)
                var state = data.state;
                var data = data.result;
                if (state == '1')
                {
               qm_myData.exitSystem();
                }
            })
        }
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
}