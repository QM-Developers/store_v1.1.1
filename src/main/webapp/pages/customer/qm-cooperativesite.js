/**
 * Created by Administrator on 2017/9/8.
 */
var qm_cooperativesite = {
    certificate: null,
    environment: null,
    imageitem: '',
    inint: function ()
    {
        var urltype = urlParams.split('=')[0]
        switch (urltype)
        {
            case 'cId':
                $('.site-li').find('input').css('border-color', '#cccccc');
                break;
            case 'cSite':
                urlid = urlParams.split('=')[1];
                qm_cooperativesite.initWebUpload(urlid);//详情的
                console.log(urlid)
                $('.site-li').find('input').css('border-color', '#cccccc');
                qm_cooperativesite.getdata();
                qm_cooperativesite.butshow();
                $('.container').css('display', 'block');
                $('#paging').css('display', 'block');

                break;

            case 'rSite':
                urlid = urlParams.split('=')[1];
                console.log(urlid)
                qm_cooperativesite.getdata();
                qm_cooperativesite.butshow();
                qm_cooperativesite.initWebUpload(urlid);//详情的
                $('.container').css('display', 'block');
                $('#paging').css('display', 'block');
                break;
        }
        console.log(urlParams)
        $('.disable-sign').focus(function ()
        {
            $(this).css('border-color','#ccc')
        })
    },
    submitMessage: function ()
    {
        //提交按钮
        var $Compile = $('.disable-sign');
        var inputval = 0;
        $Compile.each(function ()
        {
            if (myjs.isNull($(this).val()))
            {
                $(this).focus().css('border-color', 'red');
                inputval += 1;
            }
        })
        if (inputval == 0)
        {

            var titletext = '提示';
            var conttext = '是否提交资料';
            var leftbuttext = '是';
            var fnleft = 'qm_cooperativesite.submitdata()';
            var rightbuttext = '否';
            var fnright = 'indenxlogin.removepop()';
            indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
        }
    },
    submitdata: function ()
    {
        //提交数据
        var url = path + '/s/saveUserPlace.action';
        var params = {};
        params['customerId'] = urlParams.split('=')[1];
        params['userPlaceArea'] = $('#userPlaceArea').val();
        params['userPlaceType'] = qm_cooperativesite.userPlaceType($('#userPlaceType').val());
        params['userPlaceAcreage'] = $('#userPlaceAcreage').val();
        params['userOwnerNum'] = $('#userOwnerNum').val();
        params['userAlreadyUse'] = $('#userAlreadyUse').val();
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            var userPlaceId = data.result;

            if (state == '1')
            {
                $('.container').css('display', 'block');
                $('#paging').css('display', 'block');
                $('#userPlaceId').attr('name', userPlaceId);//取id
                var userPlaceId = $('#userPlaceId').attr('name');
                qm_cooperativesite.initWebUpload(userPlaceId);//提交的传图片
                qm_cooperativesite.butshow();
                indenxlogin.removepop()
            }
        })
    },
    revampdata: function ()
    {
        //修改数据
        if (urlParams.split('=')[0] == 'id')
        {
            var siteid = $('#userPlaceId>ul:first-child').attr('id');
        } else
        {
            var siteid = urlid;
        }

        var url = path + '/s/updateUserPlace.action';
        var params = {};
        params['userPlaceId'] = siteid;
        params['userPlaceArea'] = $('#userPlaceArea').val();
        params['userPlaceType'] = qm_cooperativesite.userPlaceType($('#userPlaceType').val());
        params['userPlaceAcreage'] = $('#userPlaceAcreage').val();
        params['userOwnerNum'] = $('#userOwnerNum').val();
        params['userAlreadyUse'] = $('#userAlreadyUse').val();
        console.log(params, 'tijiso')
        myjs.ajax_post(url, params, function (data)
        {
            var state = data.state;

            if (state == '1')
            {
                $('.shade-sel').css('display', 'block').parent('div').css("border-color", "#fff");
                $('#compilebox').text("编辑").next().css("display", "none")
                $('.disable-sign').attr("disabled", "true").css("border-color", "#fff");
                qm_cooperativesite.butshow();
                indenxlogin.removepop()
            }
        })
    },
    getdata: function ()
    {
        //获取数据
        var url = path + '/s/getUserPlace.action';
        var params = {};
        params['userPlaceId'] = urlid;
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '图片')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#userPlaceArea').val(data.userPlaceArea);
                $('#userPlaceType').find("option:selected").text(data.userPlaceType);
                $('#userPlaceAcreage').val(data.userPlaceAcreage);
                $('#userOwnerNum').val(data.userOwnerNum);
                $('#userAlreadyUse').val(data.userAlreadyUse);

                var certificateList = data.certificateList;
                var environmentList = data.environmentList;
                for (var i = 0; i < certificateList.length; i++)
                {

                    var $img = '<a class=img-a>' +
                        '<i class=removeimage onclick=qm_cooperativesite.removeImageBut(this)>X</i>' +
                        '<img id=' + certificateList[i].imgId + '  src=' + path + certificateList[i].imgUrl + '>' +
                        '</a>';
                    $("#certificate" + parseInt(i + 1)).find('.webuploader-pick').append($img)
                }
                for (var i = 0; i < environmentList.length; i++)
                {

                    var $img = '<a class=img-a>' +
                        '<i class=removeimage onclick=qm_cooperativesite.removeImageBut(this)>X</i>' +
                        '<img id=' + environmentList[i].imgId + '  src=' + path + environmentList[i].imgUrl + '>' +
                        '</a>';
                    $("#environment" + parseInt(i + 1)).find('.webuploader-pick').append($img)
                }
            }
        })
    },

    butshow: function ()
    {
        //小物件隐藏
        $('#butbox').remove();
        $('#compilebox').css('display', 'block');
        $('.disable-sign').attr('disabled', 'disabled').css("border-color", "#fff").unbind("click");
        $('.shade-sel').css('display', 'block').parent('div').css("border-color", "#fff");
    },
    compile: function (item)
    {
        //编辑
        var $Compile = $('.disable-sign');
        if ($Compile.attr("disabled"))
        {
            $('.shade-sel').css('display', 'none').parent('div').css("border-color", "#ccc");
            $(item).text("保存").next().css("display", "block");//改变文字
            $Compile.removeAttr("disabled").css("border-color", "#ccc");//取消禁用

        } else
        {
            var inputval = 0;
            $Compile.each(function ()
            {
                if (myjs.isNull($(this).val()))
                {
                    $(this).focus().css('border-color', 'red');
                    inputval += 1;
                }
            })
            if (inputval == 0)
            {
                var titletext = '提示';
                var conttext = '是否提交资料';
                var leftbuttext = '是';
                var fnleft = 'qm_cooperativesite.revampdata()';
                var rightbuttext = '否';
                var fnright = 'indenxlogin.ErrorpopRemove(this)';
                indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
            }

        }
    },
    cancel: function (item)
    {
        var url = path + '/s/getUserPlace.action';
        var params = {};
        params['userPlaceId'] = urlid;
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data, '图片')
            var state = data.state;
            var data = data.result;
            if (state == '1')
            {
                $('#userPlaceArea').val(data.userPlaceArea);
                $('#userPlaceType').find("option:selected").text(data.userPlaceType);
                $('#userPlaceAcreage').val(data.userPlaceAcreage);
                $('#userOwnerNum').val(data.userOwnerNum);
                $('#userAlreadyUse').val(data.userAlreadyUse);
                qm_cooperativesite.butshow();
                $(item).css('display','none');
                $('#compilebox').text('编辑');
            }
        })
    },
    userPlaceType: function (data)
    {
        //判断类型
        switch (data)
        {
            case 'no' :
                return data = '无限定';
                break;
            case 'allow' :
                return data = '可养区';
                break;
            case 'forbid' :
                return data = '限养区';
                break;
            case 'restrict' :
                return data = '禁养区';
                break;
        }
    },
    initWebUpload: function (urlid)
    {
        console.log(urlid)
        var site = {
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: path + '/script/script/webuploader-0.1.5/Uploader.swf',
            // 文件接收服务端。
            server: path + '/s/uploadPlaceCertificate.action',
            threads: 1, // 上传并发数
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#certificate1',
            fileVal: 'img',
            formData: {'userPlaceId': urlid},
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        };
        qm_cooperativesite.certificate1 = WebUploader.create(site);
        site.pick = '#certificate2';
        qm_cooperativesite.certificate2 = WebUploader.create(site);
        site.pick = '#certificate3';
        qm_cooperativesite.certificate3 = WebUploader.create(site);
        site.pick = '#environment1';
        site.server = path + '/s/uploadPlaceEnvironment.action';
        qm_cooperativesite.environment1 = WebUploader.create(site);
        site.pick = '#environment2';
        site.server = path + '/s/uploadPlaceEnvironment.action';
        qm_cooperativesite.environment2 = WebUploader.create(site);
        site.pick = '#environment3';
        site.server = path + '/s/uploadPlaceEnvironment.action';
        qm_cooperativesite.environment3 = WebUploader.create(site);

        function operation(element, id)
        {
            element.on('fileQueued', function (file)
            {
                var $li = $('<a class="img-a"><i class="removeimage" onclick="qm_cooperativesite.removeImageBut(this)">X</i><img  src=""/></a>'),
                    $img = $li.find('img');
                // $list为容器jQuery实例
                $(id).find('.webuploader-pick').append($li);

                element.makeThumb(file, function (error, src)
                {
                    if (error)
                    {
                        $img.replaceWith('<span>不能预览</span>');
                        return;
                    }
                    $img.attr('src', src);
                }, 310, 170);
            });
            // 文件上传过程中创建进度条实时显示。
            element.on('uploadProgress', function (file, percentage)
            {
                var $li = $('#' + file.id),
                    $percent = $li.find('.upload-progress');
                // 避免重复创建
                if (!$percent.length)
                {
                    $percent = $('<div class="upload-progress am-progress am-progress-striped am-progress-sm am-active ">' +
                        '<div class="am-progress-bar am-progress-bar-secondary"  style="width: 0%"></div>' +
                        '</div>').appendTo($li).find('.upload-progress');
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

        operation(qm_cooperativesite.certificate1, $('#certificate1'));
        operation(qm_cooperativesite.certificate2, $('#certificate2'));
        operation(qm_cooperativesite.certificate3, $('#certificate3'));

        operation(qm_cooperativesite.environment1, $('#environment1'));
        operation(qm_cooperativesite.environment2, $('#environment2'));
        operation(qm_cooperativesite.environment3, $('#environment3'));

    },
    removeshow: function (item)
    {
        $(item).find('.removeimage').css('display', 'block')
    },
    removehidden: function (item)
    {
        $(item).find('.removeimage').css('display', 'none')
    },
    removeImageBut: function (item)
    {
        //图片删除
        imageitem = item;
        var titletext = '提示';
        var conttext = '是否删除图片';
        var leftbuttext = '是';
        var fnleft = 'qm_cooperativesite.removeImage()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    removeImage: function ()
    {
        //删除图片
        var imgId = $(imageitem).parent('a').find('img').attr('id');
        var url = path + '/s/removePlaceImage.action';
        var params = {};
        params['imgId'] = imgId;
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            if (state == '1')
            {
                $(imageitem).parent('a').remove();
                console.log('11111111111')
                indenxlogin.removepop();
            }
        })
    },
    removeSiteBut: function ()
    {
        var titletext = '提示';
        var conttext = '是否删除场地';
        var leftbuttext = '是';
        var fnleft = 'qm_cooperativesite.removeSite()';
        var rightbuttext = '否';
        var fnright = 'indenxlogin.removepop()';
        indenxlogin.Errorpoptwo(titletext, conttext, leftbuttext, fnleft, rightbuttext, fnright)
    },
    removeSite: function ()
    {
        //删除场地
        var userPlaceId = $('#userPlaceId>ul:first-child').attr('id');
        var url = path + '/s/removeUserPlace.action';
        var params = {};
        params['userPlaceId'] = urlParams.split('=')[0] == 'cSite' ? urlid : userPlaceId;
        console.log(params)
        myjs.ajax_post(url, params, function (data)
        {
            console.log(data)
            var state = data.state;
            if (state == '1')
            {
                location.href = 'qm-cooperativelist.jsp?cSiteGo=1';
                // history.go(-1)
            }
        })
    },
    gobock: function ()
    {
        var url = urlParams.split('=')[0];
        console.log(url, '地址')
        switch (url)
        {
            case 'cId':
                location.href = "qm-cooperativelist.jsp?cSiteGo=1";
                break;
            case 'cSite':
                location.href = "qm-cooperativelist.jsp?cSiteGo=1";
                break;

            case 'rSite':
                location.href = "qm-cooperativelist.jsp?rSiteGo=2";
                break;
            default:
                break;
        }
    },

}